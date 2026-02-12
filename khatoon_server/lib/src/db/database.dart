// ignore_for_file: public_member_api_docs

import 'package:mysql_client/mysql_client.dart';

class DatabaseService {
  // factory DatabaseService() {
  //   return _inst;
  // }

  //   DatabaseService._internal() {
  //    _connect();
  // }

  // static final DatabaseService _inst = DatabaseService._internal();

  MySQLConnection? _connection;

  Future<MySQLConnection> _connect() async {
    _connection = await MySQLConnection.createConnection(
      host: '127.0.0.1',
      port: 62013,
      userName: 'DESKTOP-DHHSICTAmir',
      databaseName: 'master',
      password: '456456',
      secure: false,
    );

    await _connection?.connect(
      timeoutMs: 15000,
    );
    return _connection!;
  }

  Future<List<Map<String, dynamic>>> execute(
    String query, {
    Map<String, dynamic>? params,
    bool iterable = false,
  }) async {
    // if (_connection == null || _connection?.connected == false) {
    //   await _connect();
    // }

    // if (_connection?.connected == false) {
    //   print('Not connected!');
    //   throw Exception('Could not connect to the database');
    // }
    // print('connected!');
    final result = await (await _connect()).execute(query, params, iterable);
    return _parseToListOfMaps(result.toList());
  }

  Future<IResultSet> executeIRes(
    String query, {
    Map<String, dynamic>? params,
    bool iterable = false,
  }) async {
    // if (_connection == null || _connection?.connected == false) {
    //   await _connect();
    // }

    // if (_connection?.connected == false) {
    //   print('Not connected!');
    //   throw Exception('Could not connect to the database');
    // }
    return (await _connect()).execute(query, params, iterable);
  }

  List<Map<String, dynamic>> _parseToListOfMaps(dynamic parsed) {
    if (parsed == null) {
      return [];
    }

    if (parsed is List<ResultSet>) {
      if (parsed.isEmpty) {
        return [];
      }
      if (parsed.first is Map) {
        return parsed
            .map<Map<String, dynamic>>(
              (e) => Map<String, dynamic>.from(e as Map),
            )
            .toList();
      }

      return [];
    }

    // Case 2: object with 'columns' and 'rows' (columns: [col1,col2], rows: [[v1,v2],[...]])
    if (parsed is Map) {
      if (parsed.containsKey('columns') && parsed.containsKey('rows')) {
        final colsDyn = parsed['columns'];
        final rowsDyn = parsed['rows'];
        if (colsDyn is List && rowsDyn is List) {
          final cols = colsDyn.map((c) => c.toString()).toList();
          final rows = rowsDyn
              .map<List<dynamic>>((r) => List<dynamic>.from(r as List))
              .toList();
          return rows
              .map((r) => Map<String, dynamic>.fromIterables(cols, r))
              .toList();
        }
      }

      // Case 3: object with 'rows' as list of maps: { "rows": [{}, {}] }
      if (parsed.containsKey('rows') && parsed['rows'] is List) {
        final rows = parsed['rows'] as List;
        if (rows.isEmpty) {
          return [];
        }
        if (rows.first is Map) {
          return rows
              .map<Map<String, dynamic>>(
                (e) => Map<String, dynamic>.from(e as Map),
              )
              .toList();
        }
      }

      // Case 4: column-wise map: { "col1": [v1,v2], "col2":[v1,v2] }
      final keys = parsed.keys.toList();
      final values = parsed.values.toList();
      if (values.isNotEmpty && values.first is List) {
        final rowCount = (values.first as List).length;
        final out = <Map<String, dynamic>>[];
        for (var i = 0; i < rowCount; i++) {
          final row = <String, dynamic>{};
          for (var j = 0; j < keys.length; j++) {
            final col = keys[j];
            final colList = values[j] as List;
            row[col.toString()] = i < colList.length ? colList[i] : null;
          }
          out.add(row);
        }
        return out;
      }

      // Case 5: single row as map -> return list with single map
      return [Map<String, dynamic>.from(parsed)];
    }

    // unknown format
    return [];
  }

  Future<List<T>> queryAs<T>(
    String sql,
    T Function(Map<String, dynamic> json) fromJson,
  ) async {
    try {
      await _connect();
      final rows = await execute(sql);

      return rows.map<T>((row) => fromJson(row)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<T>> queryAsWithParams<T>(
    String sql,
    Map<String, dynamic> params,
    T Function(Map<String, dynamic> json) fromJson,
  ) async {
    final rows = await execute(sql, params: params);

    return rows.map<T>((row) => fromJson(row)).toList();
  }

  Future<T?> querySingleAs<T>(
    String sql,
    T Function(Map<String, dynamic> json) fromJson,
  ) async {
    final list = await queryAs<T>(sql, fromJson);
    return list.isNotEmpty ? list.first : null;
  }
}

/// سرویس Singleton برای مدیریت اتصال به Microsoft SQL Server
/*class DatabaseService {
  DatabaseService._internal();

  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() => _instance;

  static Future<DatabaseService> get instance async {
    await _instance.connect();
    return _instance;
  }

  final MssqlConnection _connection = MssqlConnection.getInstance();

  bool _isConnected = false;

  /// تنظیمات اتصال - بهتر است بعداً به .env منتقل شود
  final Map<String, dynamic> _config = {
    'ip': '127.0.0.1',
    'port': '8080',
    'databaseName': 'khatoon_db',
    'username': 'sa',
    'password': '456456',
    'timeoutInSeconds': 30,
  };
  Future<void> _forceReconnect() async {
    try {
      // ابتدا اتصال قبلی را قطع کن
      if (_connection.isConnected) {
        await _connection.disconnect();
      }

      // اتصال جدید ایجاد کن
      final success = await _connection.connect(
        ip: _config['ip'] as String,
        port: _config['port'] as String,
        databaseName: _config['databaseName'] as String,
        username: _config['username'] as String,
        password: _config['password'] as String,
        timeoutInSeconds: _config['timeoutInSeconds'] as int,
      );

      if (!success) {
        throw Exception('Connection failed in _forceReconnect');
      }
    } catch (e) {
      print('🔥 خطا در reconnect: $e');
      rethrow;
    }
  }
  Future<void> _ensureConnected() async {
    // if underlying client says connected -> ok
    // if (_connection.isConnected) return;

    // otherwise try to (re)connect using saved config
    // NOTE: don't rely on any local boolean, check underlying client
    await _connection.connect(
      // ip: _config['ip'] as String,
      // port: _config['port'] as String,
      // databaseName: _config['databaseName'] as String,
      // username: _config['username'] as String,
      // password: _config['password'] as String,
      // timeoutInSeconds: _config['timeoutInSeconds'] as int,
      ip: '127.0.0.1',
      port:'1433',
      databaseName:  'khatoon_db',
      username: 'sa',
      password: '456456',
      timeoutInSeconds: 30,
    );
  }

  /// اتصال lazy به SQL Server
  Future<void> connect() async {
    // if underlying client is already connected, do nothing
    if (_connection.isConnected) {
      return;
    }

    if (!(await _connection.connect(
      ip: _config['ip'] as String,
      port: _config['port'] as String,
      databaseName: _config['databaseName'] as String,
      username: _config['username'] as String,
      password: _config['password'] as String,
      timeoutInSeconds: _config['timeoutInSeconds'] as int,
    ))) {
      print('rideeeeeeee');
    }
  }



  Future<List<Map<String, dynamic>>> query(String sql) async {
    await _forceReconnect();

    try {


      final String rawJson = await _connection.getData(sql);
      if (rawJson.trim().isEmpty) return [];

      final dynamic parsed = jsonDecode(rawJson);
      return _parseToListOfMaps(parsed);
    } catch (e, stack) {
      print('❌ خطا در query: $sql\n$e');
      print('Stack trace: $stack');
      rethrow;
    }
  }

  /// اجرای کوئری SELECT و بازگشت لیست رکوردها به صورت List<Map<String, dynamic>>
  List<Map<String, dynamic>> _parseToListOfMaps(dynamic parsed) {
    // parsed already decoded (dynamic)
    if (parsed == null) return [];

    // Case 1: list of maps: [{...}, {...}, ...]
    if (parsed is List) {
      if (parsed.isEmpty) return [];
      if (parsed.first is Map) {
        return parsed
            .map<Map<String, dynamic>>(
                (e) => Map<String, dynamic>.from(e as Map))
            .toList();
      }
      // list of lists? fallthrough to other handling below is unlikely - return empty
      return [];
    }

    // Case 2: object with 'columns' and 'rows' (columns: [col1,col2], rows: [[v1,v2],[...]])
    if (parsed is Map) {
      if (parsed.containsKey('columns') && parsed.containsKey('rows')) {
        final colsDyn = parsed['columns'];
        final rowsDyn = parsed['rows'];
        if (colsDyn is List && rowsDyn is List) {
          final List<String> cols = colsDyn.map((c) => c.toString()).toList();
          final List<List<dynamic>> rows = rowsDyn
              .map<List<dynamic>>((r) => List<dynamic>.from(r as List))
              .toList();
          return rows
              .map((r) => Map<String, dynamic>.fromIterables(cols, r))
              .toList();
        }
      }

      // Case 3: object with 'rows' as list of maps: { "rows": [{}, {}] }
      if (parsed.containsKey('rows') && parsed['rows'] is List) {
        final rows = parsed['rows'] as List;
        if (rows.isEmpty) return [];
        if (rows.first is Map) {
          return rows
              .map<Map<String, dynamic>>(
                  (e) => Map<String, dynamic>.from(e as Map))
              .toList();
        }
      }

      // Case 4: column-wise map: { "col1": [v1,v2], "col2":[v1,v2] }
      final keys = parsed.keys.toList();
      final values = parsed.values.toList();
      if (values.isNotEmpty && values.first is List) {
        final int rowCount = (values.first as List).length;
        final List<Map<String, dynamic>> out = [];
        for (int i = 0; i < rowCount; i++) {
          final row = <String, dynamic>{};
          for (int j = 0; j < keys.length; j++) {
            final col = keys[j];
            final colList = values[j] as List;
            row[col.toString()] = i < colList.length ? colList[i] : null;
          }
          out.add(row);
        }
        return out;
      }

      // Case 5: single row as map -> return list with single map
      return [Map<String, dynamic>.from(parsed)];
    }

    // unknown format
    return [];
  }

  /// اجرای SELECT با پارامتر (امن در برابر SQL Injection)
  Future<List<Map<String, dynamic>>> queryWithParams(
    String sql,
    Map<String, dynamic> params,
  ) async {
    await _ensureConnected();

    try {
      final String rawJson = await _connection.getDataWithParams(sql, params);
      if (rawJson.trim().isEmpty) return [];

      final dynamic parsed = jsonDecode(rawJson);

      // if parsed is a map with columns/rows, parse accordingly
      return _parseToListOfMaps(parsed);
    } catch (e, stack) {
      print('❌ خطا در queryWithParams:\n$sql\n$params\n$e');
      print('Stack trace: $stack');
      rethrow;
    }
  }

  Future<int> execute(String sql) async {
    await _ensureConnected();

    try {
      final String rawJson = await _connection.writeData(sql);
      if (rawJson.trim().isEmpty) return 0;

      final dynamic parsed = jsonDecode(rawJson);
      if (parsed is Map && parsed.containsKey('affected')) {
        final affected = parsed['affected'];
        if (affected is num) return affected.toInt();
      }

      // If server returns simple number or other shape, try to coerce
      if (parsed is num) return parsed.toInt();

      return 0;
    } catch (e, stack) {
      print('❌ خطا در execute:\n$sql\n$e');
      print('Stack trace: $stack');
      rethrow;
    }
  }

  /// اجرای دستور با پارامتر - بازگشت Map کامل شامل affected و ...
  // ---------- executeWithParams -> return parsed Map (safety: always Map<String,dynamic>) ----------
  Future<Map<String, dynamic>> executeWithParams(
    String sql,
    Map<String, dynamic> params,
  ) async {
    await _ensureConnected();

    try {
      final String rawJson = await _connection.writeDataWithParams(sql, params);
      if (rawJson.trim().isEmpty) return <String, dynamic>{};

      final dynamic parsed = jsonDecode(rawJson);
      if (parsed is Map) return Map<String, dynamic>.from(parsed);

      // if parsed is a number or string, wrap it into a map
      return <String, dynamic>{'result': parsed};
    } catch (e, stack) {
      print('❌ خطا در executeWithParams:\n$sql\n$params\n$e');
      print('Stack trace: $stack');
      rethrow;
    }
  }



  /// گرفتن یک رکورد (مثل SELECT TOP 1)
  Future<Map<String, dynamic>?> querySingle(String sql) async {
    await _ensureConnected();
    final results = await query(sql);
    return results.isNotEmpty ? results.first : null;
  }

  /// گرفتن یک مقدار ساده (مثل COUNT، MAX و ...)
  Future<dynamic> queryScalar(String sql) async {
    await _ensureConnected();
    final results = await query(sql);
    if (results.isEmpty) return null;
    return results.first.values.first;
  }

  /// قطع اتصال دستی (در صورت نیاز)
  Future<void> disconnect() async {
    if (!_isConnected) return;
    await _ensureConnected();
    try {
      await _connection.disconnect();
      _isConnected = false;
      print('🔌 اتصال به SQL Server قطع شد');
    } catch (e) {
      print('⚠️ خطا در قطع اتصال: $e');
    }
  }

  bool get isConnected => _isConnected;
}*/
