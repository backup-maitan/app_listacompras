import 'package:app_notes/repositories/auth.repository.dart';
import 'package:app_notes/repositories/storage.repository.dart';
import 'package:app_notes/utils/errors.dart';
import 'package:get/get.dart';
import 'package:app_notes/shared/api-response.dart';
import 'package:app_notes/utils/util.dart';

class AuthController extends GetxController {
  AutenticacaoRepository repository = AutenticacaoRepository();
  StorageRepository storageRepository = StorageRepository();

  RxList<Errors> errors = List<Errors>().obs;
  // RxBool isLogged = false.obs;

  checkIsLogged() async {
    var isLogged = await storageRepository.getIsLogged();
    print(isLogged);
    if (isLogged) {
      Get.offNamed('/home-products');
    } else {
      Get.offNamed('/login');
    }
  }

  authenticate({String email, String password}) async {
    ApiResponse apiResponse =
        await this.repository.login(email: email, password: password);

    if (!apiResponse.success) {
      exibirSnack('Ocorreu um erro', apiResponse.message);
    }

    Get.offNamed('/home-products');
    return apiResponse;
  }

  register({String name, String email, String password}) async {
    ApiResponse apiResponse = await this.repository.register(
          name: name,
          email: email,
          password: password,
        );

    if (!apiResponse.success) {
      exibirSnack('Ocorreu um erro', apiResponse.message);
    }

    exibirSnack('Sucesso', 'Cadastro realizado');
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed('/login');
    return apiResponse;
  }

  logOut() async {
    await storageRepository.remove('dataUser');
    Get.offAllNamed('/login');
  }

  addError(String error) async {
    errors.add(Errors(message: error));
    // var response = await categoriaRepository.adicionar(categoria.toJson());
  }
}
