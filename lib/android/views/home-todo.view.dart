import 'package:app_notes/android/views/todo.view.dart';
import 'package:app_notes/android/widgets/header.widget.dart';
import 'package:app_notes/controllers/product.controller.dart';
import 'package:app_notes/models/product.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_notes/android/widgets/default_button.widget.dart';

class HomeTodoView extends StatelessWidget {
  // final TodoController todoController = Get.put(TodoController());
  final ProductController productController =
      Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    void showAlertDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Descricao",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultButton(
                      text: "Confirmar",
                      press: () {
                        productController.add(
                          new Product(
                          /*  user_id: 1,*/
                            name: textEditingController.text,
                          ),
                        );
                        // categoriaController.listar();
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return GetX<ProductController>(
      init: productController,
      initState: (_) {
        productController.listar();
      },
      builder: (_) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Container(
              width: 60,
              height: 60,
              child: Icon(
                Icons.add,
                size: 40,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 0.0),
                  colors: [
                    const Color(0xFFA3188A),
                    const Color(0xFF196CAE),
                  ],
                ),
              ),
            ),
            onPressed: () {
              textEditingController.clear();
              showAlertDialog(context);
            },
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),
                colors: [
                  const Color(0xFFA3188A),
                  const Color(0xFF196CAE),
                ],
              ),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Header(),
                  // FiltroHeader(),
                  SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: ListView.separated(
                        itemCount: productController.products.length,
                        separatorBuilder: (_, __) => Divider(),
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            productController.products[index].name,
                          ),
                          onTap: () {
                            Get.to(HomeTodoView());
                            Get.to(TodoView(
                              index: index,
                            ));
                          },
                          // leading: Checkbox(
                          //   value: todoController.todos[index].done,
                          //   onChanged: (v) {
                          //     var changed = todoController.todos[index];
                          //     changed.done = v;
                          //     todoController.todos[index] = changed;
                          //   },
                          // ),
                          trailing: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
