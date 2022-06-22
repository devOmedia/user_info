import 'package:get/get.dart';


class UserdataController extends GetxController{
  final RxList<dynamic> data = [].obs;

   List<dynamic> currentData = [];

  updateList() {
    data.add(
      {
        'name': currentData[0],
        'phone': currentData[1],
        'fbUrl': currentData[2],
        'lat': currentData[3],
        'log': currentData[4],
      }
    );
    currentData = [];
  }


}