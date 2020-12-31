import 'package:app_notes/repositories/api.repository.dart';

class UserRepository {
  ApiRepository repository = ApiRepository();

  Future<bool> auth(params) async {
    var response = await repository.post(endpoint: 'categorias', body: params);
    if (response.statusCode != 201) return false;
    return true;
    // return ApiResponse.fromJson(response.data);
  }
}
