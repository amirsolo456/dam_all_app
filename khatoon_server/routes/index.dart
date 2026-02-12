import 'package:dart_frog/dart_frog.dart';
import 'package:khatoon_server/src/db/database.dart';
Response onRequest(RequestContext context) {
  return Response(
    body: 'Wlcome to Sample Dart Frog Api Server',
  );
}
// Future<Response> onRequest(RequestContext context) async {
//   if (context.request.method == HttpMethod.get) {
//     return _getAllTasks();
//   } else if (context.request.method == HttpMethod.post) {
//     final body = await context.request.body();
//     final data = json.decode(body) as Map<String, dynamic>;
//     return _addTask(data['title'].toString());
//   }
//   return Response(statusCode: 405); // Method not allowed
// }

Future<Response> _getAllTasks() async {
  final db = DatabaseService();
  final result = await db.execute('SELECT * FROM parties');
  final tasks = result
      .map(
        (Map<String, dynamic> row) => <String, dynamic>{
          'id': row[0],
          'title': row[1],
          'is_completed': row[2],
        },
      )
      .toList();
  return Response.json(body: tasks);
}

Future<Response> _addTask(String title) async {
  final db = DatabaseService();
  await db.execute(
    'INSERT INTO parties (title) VALUES (@title)',
    params: <String, Object?>{
      'title': title,
    },
  );
  return Response.json(
      body: <String, String>{'message': 'Task added successfully'},);
}
