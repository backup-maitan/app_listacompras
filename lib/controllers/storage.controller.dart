import 'package:app_notes/dto/storage-usuario.dto.dart';
import 'package:app_notes/dto/storage.dto.dart';
import 'package:app_notes/repositories/storage.repository.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  StorageRepository storageRepository = StorageRepository();

  Future<StorageDTO> getDataUser() async {
    var dataUser = await storageRepository.read('dataUser');
    print(dataUser);
    return StorageDTO.fromJson(dataUser);
  }

  setStorageDefault() async {
    var dataUser = await storageRepository.read('dataUser');
    print(dataUser);
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
