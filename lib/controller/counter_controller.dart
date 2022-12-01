import 'package:get/get.dart';

class CounterController extends GetxController {
  var _counter = 0.obs;
  /*
  int getCounter(){
    return _counter.value;
  }*/
 get counter => _counter.value;
 set counter(newValue) => _counter.value= newValue;

 void add(){
   counter++;
 }
 void remove(){
   counter--;
 }


/*   @override
void onInit() {
    // TODO: implement onInit
    super.onInit();
    _counter = 0.obs;
  }*/
}
