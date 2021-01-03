import 'package:app_notes/repositories/auth.repository.dart';
import 'package:app_notes/utils/errors.dart';
import 'package:get/get.dart';
import 'package:app_notes/shared/api-response.dart';
import 'package:app_notes/utils/util.dart';

class AuthController extends GetxController {
  AutenticacaoRepository repository = AutenticacaoRepository();

  RxList<Errors> errors = List<Errors>().obs;
  RxBool isLogged = false.obs;

  checkIsLogged() async {
    this.isLogged.value = await this.repository.getIsLogged();
    if (this.isLogged.value) {
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

  // listar() async {
  //   categorias.assignAll(await categoriaRepository.listar());
  //   carregando.value = false;
  // }

  addError(String error) async {
    errors.add(Errors(message: error));
    // var response = await categoriaRepository.adicionar(categoria.toJson());
  }
}
