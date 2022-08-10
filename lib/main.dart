import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  Sayac controller1 = Get.put(Sayac());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (() {
         Get.changeTheme (Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        }),icon: Icon(Icons.sunny)),
      ],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sayaça şu kadar basıldı:"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => Text(controller1.sayac.toString())),
            ),
            ElevatedButton(
                    child: Text("Sayacı arttır."),
                    onPressed: (){
                      controller1.arttir();
                    },
                  ),
            ],
        ),
      ),
    );
  }
}

class Sayac extends GetxController{
 var sayac = 0.obs;
 var ikondeger = 0.obs;
 get getsayac => sayac.value;
 void arttir(){
  sayac = sayac + 1;
 }
 get getikon => ikondeger.value;
 void ikongece(){
  ikondeger = ikondeger + 1;
 }
 void ikongunduz(){
  ikondeger = ikondeger - 1;
 }
}
