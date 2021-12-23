import 'package:get/get.dart';
import 'package:app_notes/models/todo.model.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;
}
