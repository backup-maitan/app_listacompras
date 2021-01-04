import 'package:app_notes/dto/storage.dto.dart';
import 'package:app_notes/repositories/storage.repository.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  StorageRepository storageRepository = StorageRepository();

  setStorageDefault() async {
    var dataUser = await storageRepository.read('dataUser');
    if (dataUser == null) {
      await storageRepository.save(
        key: 'dataUser',
        value: StorageDTO(
          isLogged: false,
          user: null,
          shoppingLists: [],
        ).toJson(),
      );
    }
  }
}
