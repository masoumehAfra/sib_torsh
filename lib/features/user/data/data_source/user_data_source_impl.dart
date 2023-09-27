import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/exception/server_exception.dart';
import '../../../../core/network/api_path.dart';
import '../../../../core/network/api_provider.dart';
import '../../../../core/utils/static/static_data.dart';
import 'user_data_source.dart';



class UserDataSourceImp extends UserDataSource {
  @override
  Future<Response> userList() async {
    try {
      Response response = await GetIt.I
          .get<ApiProvider>()
          .httpClient
          .get(loginApi);


      print("**********$response");
      return response;
    } on DioException catch (error) {
      String? errorMessage = error.response?.data["message"] != "" &&
              error.response?.data["message"] != null
          ? error.response?.data["message"]
          : error.response?.statusMessage;

      throw (ServerException(
          message: errorMessage, statusCode: error.response?.statusCode));
    }
  }

  @override
  Future<Response> addUser({required firstName,required lastName}) async {
    try {
      Response response = await GetIt.I
          .get<ApiProvider>()
          .httpClient
          .post(addUserPath, data: {'first_name': firstName,'last_name':lastName});


      print("**********$response");

      return response;
    } on DioException catch (error) {
      String? errorMessage = error.response?.data["message"] != "" &&
          error.response?.data["message"] != null
          ? error.response?.data["message"]
          : error.response?.statusMessage;

      throw (ServerException(
          message: errorMessage, statusCode: error.response?.statusCode));
    }
  }
}
