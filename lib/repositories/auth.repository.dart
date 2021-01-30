import 'package:app_notes/dto/storage.dto.dart';
import 'package:app_notes/repositories/api.repository.dart';
import 'package:app_notes/repositories/storage.repository.dart';
import 'package:app_notes/shared/api-response.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:dio/dio.dart';

class AutenticacaoRepository {
  Dio dio = new Dio();
  ApiRepository repository = ApiRepository();
  StorageRepository storageRepository = StorageRepository();

  Future<ApiResponse> login({String email, String password}) async {
    var retorno = await this.dio.post('${Constantes.urlAPI}/auth/login',
        data: {'email': email, 'password': password});

    ApiResponse apiResponse = ApiResponse.fromJson(retorno.data);

    if (!apiResponse.success) return apiResponse;

    apiResponse.data['isLogged'] = apiResponse.success;
    StorageDTO storage = StorageDTO.fromJson(apiResponse.data);

    await storageRepository.save(key: 'dataUser', value: storage);

    return apiResponse;
  }

  Future<ApiResponse> register(
      {String name, String email, String password}) async {
    var retorno = await repository.post(
      endpoint: 'users',
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    ApiResponse apiResponse = ApiResponse.fromJson(retorno.data);
    if (!apiResponse.success) return apiResponse;

    return apiResponse;
  }
}
