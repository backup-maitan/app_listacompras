import 'package:app_notes/repositories/api.repository.dart';
import 'package:app_notes/models/usuario.model.dart';
import 'package:app_notes/shared/api-response.dart';
import 'package:app_notes/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoRepository {
  ApiRepository repository = ApiRepository();

  Future<ApiResponse> login({String email, String password}) async {
    var retorno = await repository.post(
        endpoint: 'users/auth', body: {'email': email, 'password': password});

    return ApiResponse.fromJson(retorno.data);
  }

  setIsLogged() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.setBool('isLogged', true);
  }

  Future<bool> getIsLogged() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.getBool('isLogged');
  }
}
