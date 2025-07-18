import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movies_app/utils/routes.dart';
import 'package:movies_app/views/splash_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



void main()async{
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  runApp(Flicksy());

}

class Flicksy extends StatelessWidget {
  const Flicksy({super.key});

  @override

  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          fontFamily: 'Manrope'
      ),
      initialRoute: SplashPage.routeName,
      getPages: getPages,
    );
  }
}