import 'package:app_notes/android/views/home/home.view.dart';
import 'package:app_notes/android/views/login/login.view.dart';
import 'package:app_notes/repositories/auth.repository.dart';
import 'package:app_notes/utils/errors.dart';
import 'package:get/get.dart';
import 'package:app_notes/shared/api-response.dart';
import 'package:app_notes/utils/util.dart';
import 'package:app_notes/models/usuario.model.dart';

class AuthController extends GetxController {
  AutenticacaoRepository repository = AutenticacaoRepository();

  RxList<Errors> errors = List<Errors>().obs;

  checkIsLogged() async {
    bool isLogged = await this.repository.getIsLogged();
    print(isLogged);
    if (isLogged) {
      Get.toNamed('/home-product');
    } else {
      Get.toNamed('/login');
    }
  }

  authenticate({String email, String password}) async {
    ApiResponse apiResponse =
        await this.repository.login(email: email, password: password);

    if (!apiResponse.success) {
      exibirSnack('Ocorreu um erro', apiResponse.message);
    }

    await this.repository.setIsLogged();
    return apiResponse;
  }

  // listar() async {
  //   categorias.assignAll(await categoriaRepository.listar());
  //   carregando.value = false;
  // }

  addError(String error) async {
    errors.add(Errors(message: error));
    // var response = await categoriaRepository.adicionar(categoria.toJson());
  }
}
