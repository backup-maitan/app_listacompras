import 'dart:convert';

import 'package:app_notes/models/shopping-cart.model.dart';
import 'package:app_notes/repositories/api.repository.dart';
import 'package:app_notes/models/usuario.model.dart';
import 'package:app_notes/shared/api-response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoRepository {
  ApiRepository repository = ApiRepository();

  Future<ApiResponse> login({String email, String password}) async {
    var retorno = await repository.post(
        endpoint: 'users/auth', body: {'email': email, 'password': password});

    ApiResponse apiResponse = ApiResponse.fromJson(retorno.data);
    if (!apiResponse.success) return apiResponse;
    await this.setIsLogged(isLogged: true);
    await this.setDataUser(data: jsonEncode(apiResponse.data));
    return apiResponse;
  }

  setDataUser({String data}) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.setString('dataUser', data);
  }

  Future<String> getDataUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var shopp = localStorage.getString('dataUser');
    return shopp;
  }

  Future<ShoppingLists> getFirstShoppingLists() async {
    var dataUser = jsonDecode(await getDataUser());
    return ShoppingLists.fromJson(dataUser['shoppingLists'][0]);
  }

  setIsLogged({bool isLogged = false}) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return localStorage.setBool('isLogged', isLogged);
  }

  Future<bool> getIsLogged() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    if (localStorage.getBool('isLogged') == null)
      await setIsLogged(isLogged: false);

    return localStorage.getBool('isLogged');
  }
}
