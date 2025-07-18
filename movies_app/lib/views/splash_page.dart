
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movies_app/controller/splash_controller.dart';
import 'package:movies_app/utils/constants/image_paths.dart';

class SplashPage extends StatelessWidget {
  static const routeName="/splash-page";
  final c=Get.find<SplashController>();
  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Image.asset(ImagePaths.logo),
              SizedBox(height: 40,),
              Text("Flicksy",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
