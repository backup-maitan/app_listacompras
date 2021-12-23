import 'dart:async';

import 'package:app_notes/repositories/api.repository.dart';
import 'package:dio/dio.dart';

class UserRepository {
  ApiRepository repository = ApiRepository();

  Future<bool> auth(params) async {
    var response = await (repository.post(endpoint: 'categorias', body: params) as FutureOr<Response<dynamic>>);
    if (response.statusCode != 201) return false;
    return true;
    // return ApiResponse.fromJson(response.data);
  }
}
