import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/counter_controller.dart';

void main() {
  runApp(MyApp());
}
///Get.to(NewPage()) yeni sayfaya yollar
///Get.off(NewPage()) bulunduğu sayfayı kapatıp yeni sayfaya yollar
///Get.back() önceki sayfaya döner
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  CounterController _controller = Get.put(CounterController());
  CounterController _findController = Get.find();

  ///put yapılan controllerı bulur obx kullanılabilir olur
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have clicked",
              style: TextStyle(
                fontSize: 32,
              ),
            ),

            ///controller tanımlı ise kullanım
            /* Obx(
              () => Text(
                _controller.counter.toString(),
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),*/

            ///extract widget yapıldığı zaman controller tanımlamadan kullanım
            getX(),
            ///önceden put yapılmış bir controlleri find ile bulup kullanılmasında işe yarar
            getPutObx()
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _controller.add();
              print(_controller.counter);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.remove();
              print(_controller.counter);
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark()
              );
            },
            child: Icon(Icons.change_circle),
          ),
        ],
      ),
    );
  }

  GetX<CounterController> getX() {
    return GetX<CounterController>(
            builder: (_controller2) => Text(
              _controller2.counter.toString(),
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          );
  }

  Obx getPutObx() {
    return Obx(() => Text(
            _findController.counter.toString(),
            style: TextStyle(
              fontSize: 32,
            ),
          ),);
  }
}
