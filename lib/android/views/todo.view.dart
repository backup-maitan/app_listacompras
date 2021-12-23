import 'package:app_notes/controllers/todo.controller.dart';
import 'package:app_notes/models/todo.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoView extends StatelessWidget {
  final TodoController todoController = Get.find();
  final int? index;

  TodoView({this.index});

  @override
  Widget build(BuildContext context) {
    String? text = '';
    if (!this.index.isNull) {
      text = todoController.todos[index!].text;
    }
    TextEditingController textEditingController =
        TextEditingController(text: text);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Descrição',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Text('Cancelar'),
                  color: Colors.red,
                  onPressed: () {
                    Get.back();
                  },
                ),
                RaisedButton(
                  child: Text('Adicionar'),
                  color: Colors.green,
                  onPressed: () {
                    todoController.todos.add(
                      Todo(text: textEditingController.text),
                    );
                    Get.back();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
