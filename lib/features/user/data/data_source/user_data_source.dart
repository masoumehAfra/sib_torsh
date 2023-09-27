import 'package:dio/dio.dart';

abstract class UserDataSource {
  Future<Response> userList();
  Future<Response> addUser({required firstName,required lastName});
}