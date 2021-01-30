import 'package:app_notes/repositories/storage.repository.dart';
import 'package:dio/dio.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:get/get.dart' hide Response;

class ApiRepository {
  Dio dio = Dio();

  StorageRepository storageRepository = Get.put(StorageRepository());

  Future<Response> get(
      {String endpoint, Map<String, dynamic> parameters}) async {
    var payload = await storageRepository.getJwtPayload();

    var response = await fetch(() => dio.get(
          '${Constantes.urlAPI}/$endpoint',
          queryParameters: parameters,
          options:
              Options(headers: {'Authorization': 'Bearer ${payload.token}'}),
        ));

    if (response != null && response.statusCode == 401) {
      // var novoToken = await obterToken(token);
      // await storageRepository.inserir(key: 'token', value: novoToken);
    }

    return response;
  }

  Future<Response> post({String endpoint, dynamic body}) async {
    var payload = await storageRepository.getJwtPayload();

    return await fetch(() => dio.post(
          '${Constantes.urlAPI}/$endpoint',
          data: body,
          options: payload != null
              ? Options(headers: {'Authorization': 'Bearer ${payload.token}'})
              : {},
        ));
  }

  Future<Response> put({String endpoint, dynamic body}) async {
    var payload = await storageRepository.getJwtPayload();

    return await fetch(() => dio.put(
          '${Constantes.urlAPI}/$endpoint',
          data: body,
          options:
              Options(headers: {'Authorization': 'Bearer ${payload.token}'}),
        ));
  }

  Future<Response> delete({String endpoint, dynamic body}) async {
    var payload = await storageRepository.getJwtPayload();

    return await fetch(() => dio.delete(
          '${Constantes.urlAPI}/$endpoint',
          data: body,
          options:
              Options(headers: {'Authorization': 'Bearer ${payload.token}'}),
        ));
  }

  Future<Response> fetch(Future<Response> Function() tryFetch) async {
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

  // obterToken(String token) async {
  //   if (token == null)
  //     goTo('/login');
  //   else
  //     return await fetch(() => dio.get('${Constants.apiUrl}/obter-token',
  //         options: Options(headers: {'Authorization': 'Bearer $token'})));
  // }
}
