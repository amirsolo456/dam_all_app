import 'dart:async';

import 'package:khatoon_server/src/db/database.dart';
import 'package:khatoon_shared/index.dart'; // فرض بر اینه که User و UserRank اینجا تعریف شدن

class UserRepository implements IUserRepository<User> {
  UserRepository();

  // دسترسی به Pool یا Connection
  Future<DatabaseService> _getConnection() async {
    return DatabaseService();
  }

  @override
  Future<void> addUser(User user) async {
    final conn = await _getConnection();
    try {
      await conn.execute(
        '''
        INSERT INTO users (
          username, password, email, last_login, 
          data_created, rank, name, age
        ) VALUES (
          @username, @password, @email, @lastLogin,
          @dataCreated, @rank, @name, @age
        )
        ''',
       params:   <String, dynamic>{
          'username': user.username,
          'password': _hashPassword(user.password),
          'email': user.email,
          'lastLogin': user.lastLogin,
          'dataCreated': user.dataCreated,
          'rank': user.rank.name,
          'name': user.name,
          'age': user.age,
        },
      );
    } catch (e) {
      throw Exception('خطا در ثبت کاربر: $e');
    } finally {
      // اگر Connection موقتی بود، ببند (اگر Pool هست نیازی نیست)
      // await conn.close();
    }
  }

  @override
  Future<List<User>> getAllUsers() async {
    final conn = await _getConnection();
    try {
      final results = await conn.queryAs<User>(
        'SELECT * FROM Users',
        User.fromJson,
      );

      return results;
    } catch (e) {
      throw Exception('خطا در دریافت کاربران: $e');
    }
  }

  @override
  Future<User?> getUserById(int id) async {
    final conn = await _getConnection();
    try {
      final  results = await conn.execute(
        '''
        SELECT id, username, email, last_login, 
               data_created, rank, name, age
        FROM users 
        WHERE id = @id
        ''',
        params: <String, dynamic>{'id': id},
      );

      if (results.isEmpty) {
        return null;
      }

      final row = results.first.values.first;
      return User(
        id: row['id'] as int,
        username: row['username'] as String,
        password: '',
        email: row['email'] as String,
        lastLogin: row['last_login'] as int,
        dataCreated: row['data_created'] as int,
        rank: UserRank.values.firstWhere(
          (UserRank r) => r.name == (row['rank'] as String),
          orElse: () => UserRank.viewer,
        ),
        name: row['name'] as String? ?? '',
        age: row['age'] as int? ?? 0,
      );
    } catch (e) {
      throw Exception('خطا در دریافت کاربر: $e');
    }
  }

  @override
  Future<void> updateUser(User user) async {
    final conn = await _getConnection();
    try {
      await conn.execute(
        '''
        UPDATE users 
        SET username = @username,
            email = @email,
            last_login = @lastLogin,
            rank = @rank,
            name = @name,
            age = @age
        WHERE id = @id
        ''',
        params: <String, dynamic>{
          'id': user.id,
          'username': user.username,
          'email': user.email,
          'lastLogin': user.lastLogin,
          'rank': user.rank.name,
          'name': user.name,
          'age': user.age,
        },
      );
    } catch (e) {
      throw Exception('خطا در به‌روزرسانی کاربر: $e');
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    final conn = await _getConnection();
    try {
      await conn.execute(
        'DELETE FROM users WHERE id = @id',
        params: <String, dynamic>{'id': id},
      );
    } catch (e) {
      throw Exception('خطا در حذف کاربر: $e');
    }
  }

  @override
  Future<void> clearAllUsers() async {
    final conn = await _getConnection();
    try {
      await conn.execute('TRUNCATE TABLE users RESTART IDENTITY CASCADE');
    } catch (e) {
      throw Exception('خطا در پاک کردن همه کاربران: $e');
    }
  }

  String _hashPassword(String password) {
    // TODO: استفاده از bcrypt یا Argon2
    // فعلاً placeholder
    return password; // در تولید واقعی هش کنید!
  }
}
