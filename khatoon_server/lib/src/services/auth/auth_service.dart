import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class  AuthService {

  AuthService(this.jwtSecret);
  final String jwtSecret;

  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }

  String generateToken(String userId) {
    final jwt = JWT(<String, String>{'id': userId});
    return jwt.sign(SecretKey(jwtSecret));
  }

  JWT? verifyToken(String token) {
    try {
      return JWT.verify(token, SecretKey(jwtSecret));
    } catch (_) {
      return null;
    }
  }
}
