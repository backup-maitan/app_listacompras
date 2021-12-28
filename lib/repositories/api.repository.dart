import 'package:app_notes/dto/storage.dto.dart';
import 'package:app_notes/repositories/storage.repository.dart';
import 'package:dio/dio.dart';
import 'package:app_notes/utils/constantes.dart';
import 'dart:convert';
import 'package:get/get.dart' hide Response;

class ApiRepository {
  Dio dio = Dio();

  StorageRepository storageRepository = Get.put(StorageRepository());

  Future<Response?> get(
      {String? endpoint, Map<String, dynamic>? parameters}) async {
    var payload = await storageRepository.getJwtPayload();

    var response = await fetch(() => dio.get(
          '${Constantes.urlAPI}/$endpoint',
          queryParameters: parameters,
          options: (payload != null && payload.token != null
              ? Options(headers: {'Authorization': 'Bearer ${payload.token}'})
              : new Options()),
        ));

    // if (response != null && response.statusCode == 401) {
    //   var novoToken = await refreshToken(payload!.token);
    //   var dataUser = await storageRepository.getDataUser();
    //   dataUser.payload = novoToken;
    //   await storageRepository.save(key: 'dataUser', value: dataUser);
    // }

    return response;
  }

  Future<Response?> post({String? endpoint, dynamic body}) async {
    var payload = await storageRepository.getJwtPayload();
    return await fetch(() => dio.post(
          '${Constantes.urlAPI}/$endpoint',
          data: body,
          options: (payload != null && payload.token != null
              ? Options(headers: {'Authorization': 'Bearer ${payload.token}'})
              : new Options()),
        ));
  }

  Future<Response?> put({String? endpoint, dynamic body}) async {
    var payload = await storageRepository.getJwtPayload();

    return await fetch(() => dio.put(
          '${Constantes.urlAPI}/$endpoint',
          data: body,
          options: (payload != null && payload.token != null
              ? Options(headers: {'Authorization': 'Bearer ${payload.token}'})
              : new Options()),
        ));
  }

  Future<Response?> delete({String? endpoint, dynamic body}) async {
    var payload = await storageRepository.getJwtPayload();

    return await fetch(() => dio.delete(
          '${Constantes.urlAPI}/$endpoint',
          data: body,
          options: (payload != null && payload.token != null
              ? Options(headers: {'Authorization': 'Bearer ${payload.token}'})
              : new Options()),
        ));
  }

  Future<Response?> fetch(Future<Response> Function() tryFetch) async {
    Response response;
    try {
      response = await tryFetch();
    } on DioError catch (e) {
      return e.response;
    }
    return response;
  }

  // exibirErro(e) {
  //   if (e is DioError) {
  //     throw AppException(dioError: e);
  //   }
  //   throw UnknownException(message: e.toString());
  // }

  refreshToken(String? token) async {
    print('refresh');
    if (token == null) {
      // goTo('/login');
    } else
      return await fetch(() => dio.post('${Constantes.urlAPI}/auth/refresh',
          data: {"refresh_token": token},
          options: Options(headers: {'Authorization': 'Bearer $token'})));
  }
}
