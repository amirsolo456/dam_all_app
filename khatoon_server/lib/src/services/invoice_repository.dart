// lib/services/invoice_service.dart
import 'package:khatoon_server/src/db/database.dart';

class SyncResult {
  SyncResult(this.accepted, {this.reason, this.serverCopy});

  final bool accepted;
  final String? reason;
  final Map<String, dynamic>? serverCopy;
}

class InvoiceService {
  InvoiceService(this.db);

  final DatabaseService db;

  Future<Map<String, dynamic>?> getById(String id) async {
    final rows = await db.execute('SELECT * FROM invoices WHERE id = @id',
        params: <String, dynamic>{'id': id},);
    if (rows.isEmpty) {
      return null;
    }
    return rows.first;
  }

  Future<void> insertInvoice(Map<String, dynamic> payload) async {
    final now = DateTime.now().toIso8601String();
    await db.execute(
      '''
      INSERT INTO invoices (id, invoice_no, type, party_id, total_amount, status, notes, version, is_deleted, created_at, updated_at)
      VALUES (@id, @invoice_no, @type, @party_id, @total_amount, @status, @notes, @version, @is_deleted, @created_at, @updated_at)
    ''',
      params: <String, dynamic>{
        'id': payload['id'],
        'invoice_no': payload['invoiceNo'],
        'type': payload['type'],
        'party_id': payload['partyId'],
        'total_amount': payload['totalAmount'] ?? 0,
        'status': payload['status'] ?? 'open',
        'notes': payload['notes'],
        'version': payload['version'] ?? 0,
        'is_deleted': payload['isDeleted'] ?? false,
        'created_at': payload['createdAt'] ?? now,
        'updated_at': payload['updatedAt'] ?? now,
      },
    );
  }

  Future<void> updateInvoice(Map<String, dynamic> payload) async {
    final now = DateTime.now().toIso8601String();
    await db.execute(
      '''
      UPDATE invoices
      SET invoice_no=@invoice_no, type=@type, party_id=@party_id, total_amount=@total_amount,
          status=@status, notes=@notes, version=@version, is_deleted=@is_deleted, updated_at=@updated_at
      WHERE id=@id
    ''',
      params: <String, dynamic>{
        'id': payload['id'],
        'invoice_no': payload['invoiceNo'],
        'type': payload['type'],
        'party_id': payload['partyId'],
        'total_amount': payload['totalAmount'] ?? 0,
        'status': payload['status'] ?? 'open',
        'notes': payload['notes'],
        'version': payload['version'] ?? 0,
        'is_deleted': payload['isDeleted'] ?? false,
        'updated_at': payload['updatedAt'] ?? now,
      },
    );
  }

  Future<bool> isProcessed(String syncId) async {
    final rows = await db.execute(
        'SELECT sync_id FROM client_ops WHERE sync_id = @syncId',
        params: <String, dynamic>{'syncId': syncId},);
    return rows.isNotEmpty;
  }

  Future<void> markProcessed(String syncId, String entityType, String entityId,
      String operation,) async {
    await db.execute(
      'INSERT INTO client_ops (sync_id, entity_type, entity_id) VALUES (@syncId, @et, @eid)',
      params: <String, dynamic>{
        'syncId': syncId,
        'et': entityType,
        'eid': entityId,
      },
    );
  }

  Future<SyncResult> handleOp(Map<String, dynamic> op) async {
    final syncId = (op['syncId'] ?? '')?.toString() ?? '';
    final id =
        op['entityId']?.toString() ?? (op['payload']?['id']?.toString() ?? '');
    final operation = op['operation']?.toString() ?? 'insert';
    final payload =
        Map<String, dynamic>.from(op['payload'] as Map<String, dynamic>);
    final clientVersion = (op['version'] is int)
        ? op['version'] as int
        : int.tryParse('${op['version'] ?? payload['version'] ?? 0}') ?? 0;

    if (syncId.isNotEmpty && await isProcessed(syncId)) {
      return SyncResult(true); // idempotent ack
    }

    final serverRec = await getById(id);
    if (operation == 'insert') {
      if (serverRec == null) {
        await insertInvoice(payload);
        if (syncId.isNotEmpty) {
          await markProcessed(syncId, 'invoice', id, 'insert');
        }
        return SyncResult(true);
      } else {
        final serverVersion = (serverRec['version'] is int)
            ? serverRec['version'] as int
            : int.tryParse('${serverRec['version']}') ?? 0;
        if (clientVersion > serverVersion) {
          await updateInvoice(payload);
          if (syncId.isNotEmpty) {
            await markProcessed(syncId, 'invoice', id, 'insert->update');
          }
          return SyncResult(true);
        } else {
          return SyncResult(false,
              reason: 'version_conflict', serverCopy: serverRec,);
        }
      }
    } else if (operation == 'update') {
      if (serverRec == null) {
        await insertInvoice(payload);
        if (syncId.isNotEmpty) {
          await markProcessed(syncId, 'invoice', id, 'update->insert');
        }
        return SyncResult(true);
      } else {
        final serverVersion = (serverRec['version'] is int)
            ? serverRec['version'] as int
            : int.tryParse('${serverRec['version']}') ?? 0;
        if (clientVersion > serverVersion) {
          await updateInvoice(payload);
          if (syncId.isNotEmpty) {
            await markProcessed(syncId, 'invoice', id, 'update');
          }
          return SyncResult(true);
        } else {
          return SyncResult(false,
              reason: 'version_conflict', serverCopy: serverRec,);
        }
      }
    } else if (operation == 'delete') {
      if (serverRec != null) {
        payload['version'] = clientVersion;
        payload['isDeleted'] = true;
        await updateInvoice(payload);
        if (syncId.isNotEmpty) {
          await markProcessed(syncId, 'invoice', id, 'delete');
        }
      } else {
        if (syncId.isNotEmpty) {
          await markProcessed(syncId, 'invoice', id, 'delete-noop');
        }
      }
      return SyncResult(true);
    }

    return SyncResult(false, reason: 'unknown_operation');
  }
}
