import 'package:app_notes/models/product.model.dart';
import 'package:app_notes/repositories/api.repository.dart';

class ProductRepository {
  ApiRepository repository = ApiRepository();

  Future<bool> adicionar(params) async {
    var response = await repository.post(endpoint: 'products', body: params);
    if (response.statusCode != 201) return false;
    return true;
    // return ApiResponse.fromJson(response.data);
  }

  Future<List<Product>> listar({Map<String, dynamic> query}) async {
    List<Product> categorias = [];
    var response =
        await repository.get(endpoint: 'products', parameters: query);

    if (response != null && response.statusCode == 200)
      for (var item in (response.data as List)) {
        var categoria = Product.fromJson(item);
        categorias.add(categoria);
      }

    await Future.delayed(Duration(seconds: 2)); // remover depois

    return categorias;
  }

  // Future<Categoria> obter({String estabelecimentoId, String produtoId}) async {
  //   var response = await repository.get(endpoint: 'categorias');

  //   if (response != null && response.statusCode == 200)
  //     return Categoria.fromJson(response.data);
  //   else
  //     return null;
  // }
}
