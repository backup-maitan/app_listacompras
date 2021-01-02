import 'package:app_notes/models/product.model.dart';
import 'package:get/get.dart';
import 'package:app_notes/repositories/product.repository.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class ProductController extends GetxController {
  ProductRepository productRepository = ProductRepository();

  RxBool carregando = true.obs;

  Rx<Product> product = Product().obs;
  RxList<Product> products = List<Product>().obs;

  listar() async {
    carregando.value = true;
    print(carregando);
    products.assignAll(await productRepository.listar());
    Future.delayed(Duration(seconds: 5));
    carregando.value = false;
    print(carregando);
  }

  add(Product categoria) async {
    var response = await productRepository.adicionar(categoria.toJson());
    if (response) listar();
  }

// obterProduto(String produtoId, String estabelecimentoId) async {
//   produto.value = await produtoRepository.obter(
//       estabelecimentoId: estabelecimentoId, produtoId: produtoId);
//   carregando.value = false;
// }
}
