import 'package:app_notes/models/product.model.dart';
import 'package:get/get.dart';
import 'package:app_notes/utils/util.dart';
import 'package:app_notes/repositories/product.repository.dart';
import 'package:app_notes/dto/create-product.dto.dart';

class ProductController extends GetxController {
  ProductRepository productRepository = ProductRepository();

  RxBool carregando = true.obs;

  Rx<Product> product = Product().obs;
  RxList<Product> products = List<Product>().obs;

  listar() async {
    carregando.value = true;
    products.assignAll(await productRepository.listar());
    carregando.value = false;
  }

  findByUser() async {
    // carregando.value = true;
    products.assignAll(await productRepository.findByUser());
    carregando.value = false;
  }

  add(CreateProductDTO productDTO) async {
    var response = await productRepository.adicionar(params: productDTO);
    if (response) {
      listar();
    }
    return response;
  }

// obterProduto(String produtoId, String estabelecimentoId) async {
//   produto.value = await produtoRepository.obter(
//       estabelecimentoId: estabelecimentoId, produtoId: produtoId);
//   carregando.value = false;
// }
}
