import 'package:khatoon_server/src/services/invoice_repository.dart';

class SyncService {
  SyncService(this.invoice);

  final InvoiceService invoice;

  Future<Map<String, dynamic>> handlePush(Map<String, dynamic> body) async {
    final entityType = body['entityType']?.toString();
    final ops = (body['ops'] as List<dynamic>?)?.cast<Map<String, dynamic>>() ??
        <Map<String, dynamic>>[];

    final ok = <String>[];
    final failed = <Map<String, dynamic>>[];
    final apply = <Map<String, dynamic>>[];

    for (final op in ops) {
      SyncResult res;
      switch (entityType) {
        case 'invoice':
          res = await invoice.handleOp(op);
        // case 'payment': res = await paymentService.handleOp(op); break;
        // case 'employee': ...
        default:
          failed.add(<String, dynamic>{
            'id': op['syncId'] ?? '',
            'reason': 'unsupported_entity',
          });
          continue;
      }

      if (res.accepted) {
        ok.add(op['syncId']?.toString() ?? '');
      } else {
        failed.add(<String, dynamic>{
          'id': op['syncId']?.toString() ?? '',
          'reason': res.reason,
        });
        if (res.serverCopy != null) {
          apply.add(<String, dynamic>{
            'entityType': entityType,
            'action': 'upsert',
            'payload': res.serverCopy,
          });
        }
      }
    }

    return <String, dynamic>{
      'ok': ok.where((String s) => s.isNotEmpty).toList(),
      'failed': failed,
      'apply': apply,
    };
  }
}
