import 'dart:math';

import 'package:app_notes/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Loader extends StatelessWidget {
  LoaderController controller = Get.put(LoaderController());

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (dynamic _) {
        return Center(
          child: Container(
            width: 120.0,
            height: 120.0,
            child: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/Cart Icon.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: controller.animation_rotation,
                    child: Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(controller.radius * cos(pi / 4),
                              controller.radius * sin(pi / 4)),
                          child: Dot(
                            radius: 6.0,
                            color: kPrimaryColor,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(controller.radius * cos(2 * pi / 4),
                              controller.radius * sin(2 * pi / 4)),
                          child: Dot(
                            radius: 6.0,
                            color: kPrimaryColor,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(controller.radius * cos(3 * pi / 4),
                              controller.radius * sin(3 * pi / 4)),
                          child: Dot(
                            radius: 6.0,
                            color: kPrimaryColor,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(controller.radius * cos(4 * pi / 4),
                              controller.radius * sin(4 * pi / 4)),
                          child: Dot(
                            radius: 6.0,
                            color: kPrimaryColor,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(controller.radius * cos(5 * pi / 4),
                              controller.radius * sin(5 * pi / 4)),
                          child: Dot(
                            radius: 6.0,
                            color: kPrimaryColor,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(controller.radius * cos(6 * pi / 4),
                              controller.radius * sin(6 * pi / 4)),
                          child: Dot(
                            radius: 6.0,
                            color: kPrimaryColor,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(controller.radius * cos(7 * pi / 4),
                              controller.radius * sin(7 * pi / 4)),
                          child: Dot(
                            radius: 6.0,
                            color: kPrimaryColor,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(controller.radius * cos(8 * pi / 4),
                              controller.radius * sin(8 * pi / 4)),
                          child: Dot(
                            radius: 6.0,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
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

class LoaderController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController controller;

  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;

  final double initialRadius = 35.0;
  RxDouble radius = 0.0.obs;

  @override
  void onInit() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    super.onInit();

    animation_rotation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animation_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animation_radius_out = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      if (controller.value >= 0.75 && controller.value <= 1.0) {
        radius.value = animation_radius_in.value * initialRadius;
      } else if (controller.value >= 0.0 && controller.value <= 0.25) {
        radius.value = animation_radius_out.value * initialRadius;
      }
    });

    controller.repeat();
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
