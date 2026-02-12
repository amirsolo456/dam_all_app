import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:khatoon_container/index.dart';
import 'package:khatoon_container/src/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/src/features/user/data/models/user_model/user_response.dart';
import 'package:khatoon_shared/index.dart';



class UserRemoteDataSource extends IUserRepository<UserModel> {
  final ApiService _apiService;

  UserRemoteDataSource(this._apiService);

  @override
  Future<void> addUser(UserModel userModel) async {
    try {
      final Response<List<UserModel>> response = await _apiService.post<UserModel>(
        '/users',
        data: UserRequest(userModel),
        options: Options(),
      );
      if (kDebugMode) {
        print('User added successfully: ${response.data}');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error adding user: ${e.message}');
      }
      throw Exception('Failed to add user: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<void> clearAllUsers() async {
    try {
      final Response<UserModel> response = await _apiService.dio.get<UserModel>('/users');
      final List<dynamic> userList = response.data as List<dynamic>;
      userList.map((dynamic userJson) => UserModel.fromJson(userJson)).toList();
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error fetching all users: ${e.message}');
      }
      throw Exception(
        'Failed to fetch users: ${e.response?.data ?? e.message}',
      );
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      await _apiService.dio.delete('/users/$id');
      if (kDebugMode) {
        print('User with id $id deleted successfully');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error deleting user: ${e.message}');
      }
      throw Exception(
        'Failed to delete user: ${e.response?.data ?? e.message}',
      );
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      final Response<dynamic> response = await _apiService.dio.get('/users');
      final List<dynamic> userList = response.data as List<dynamic>;
      return userList.map((dynamic userJson) => UserModel.fromJson(userJson)).toList();
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error fetching all users: ${e.message}');
      }
      throw Exception(
        'Failed to fetch users: ${e.response?.data ?? e.message}',
      );
    }
  }

  @override
  Future<UserModel?> getUserById(int id) async {
    try {
      final Response<List<UserModel>> response = await _apiService.get<UserModel>(
        '/users/$id',
        options: Options(),
      );
      if (response.data != null) {
        return response.data!.first;
      } else {
        return null;
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> updateUser(UserModel userModel) async {
    try {
      await _apiService.dio.put(
        '/users/${userModel.id}',
        data: userModel.toJson(),
      );
      if (kDebugMode) {
        print('User updated successfully');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error updating user: ${e.message}');
      }
      throw Exception(
        'Failed to update user: ${e.response?.data ?? e.message}',
      );
    }
  }
}
