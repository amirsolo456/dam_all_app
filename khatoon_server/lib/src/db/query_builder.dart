// lib/src/db/query_builder.dart
import 'package:khatoon_server/src/db/database.dart';

class QueryBuilder {

  QueryBuilder(this._db);
  final DatabaseService _db;

  Future<List<Map<String, dynamic>>> select({
    required String table,
    List<String>? columns,
    String? where,
    Map<String, dynamic>? whereParams,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final cols = columns?.join(', ') ?? '*';
    var query = 'SELECT $cols FROM $table';

    final params = <String, dynamic>{};

    if (where != null) {
      query += ' WHERE $where';
      if (whereParams != null) {
        params.addAll(whereParams);
      }
    }

    if (orderBy != null) {
      query += ' ORDER BY $orderBy';
    }

    if (limit != null) {
      query += ' LIMIT @limit';
      params['limit'] = limit;
    }

    if (offset != null) {
      query += ' OFFSET @offset';
      params['offset'] = offset;
    }

    if (params.isNotEmpty) {
      return _db.execute(query, params: params);
    } else {
      return _db.execute(query);
    }
  }

  Future<Map<String, dynamic>> insert({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    final columns = data.keys.join(', ');
    final placeholders = data.keys.map((k) => '@$k').join(', ');
    final query = 'INSERT INTO $table ($columns) VALUES ($placeholders)';

    final result =  await _db.execute(query, params: data);
    return result.first;
  }
}
