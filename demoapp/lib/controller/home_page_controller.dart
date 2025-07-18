import 'package:get/get.dart';

//variable declaration
//logic work
// api calls
class HomePageController extends GetxController {

  //for making the variable observable.
  RxInt count = 0.obs;

  RxBool isLiked=true.obs;

  void toggleLikeStatus(){
    isLiked.value=!isLiked.value;
  }

  void increaseCount() {
    count = count + 1;
    print("the count is ${count}");
  }


  void decreaseCount() {
    count = count - 1;
    print("the count is ${count}");
  }

  void resetCount() {
    count.value = 0;
    print("the count is ${count}");
  }
}