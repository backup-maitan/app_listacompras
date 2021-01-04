import 'package:app_notes/dto/storage.dto.dart';
import 'package:app_notes/repositories/api.repository.dart';
import 'package:app_notes/repositories/storage.repository.dart';
import 'package:app_notes/shared/api-response.dart';

class AutenticacaoRepository {
  ApiRepository repository = ApiRepository();
  StorageRepository storageRepository = StorageRepository();

  Future<ApiResponse> login({String email, String password}) async {
    var retorno = await repository.post(
        endpoint: 'users/auth', body: {'email': email, 'password': password});

    ApiResponse apiResponse = ApiResponse.fromJson(retorno.data);
    if (!apiResponse.success) return apiResponse;

    apiResponse.data['isLogged'] = apiResponse.success;
    StorageDTO storage = StorageDTO.fromJson(apiResponse.data);

    await storageRepository.save(key: 'dataUser', value: storage);

    return apiResponse;
  }
}
