import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_info/controller/userdata_controller.dart';
import 'package:user_info/pages/data_add_page.dart';
import 'package:user_info/widgets/user_card.dart';

class HomePage extends StatelessWidget {
  final UserdataController _userdata = Get.put(UserdataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddUserInfo()));
            },
            child: Icon(
              Icons.add,
              color: Colors.black54,
              size: 30,
            )),
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Obx(
                () => ListTile(
                  title: Text(
                    'UserBook',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  subtitle: Text(
                    "${_userdata.data.length} users",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Obx(
                () => Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _userdata.data.length,
                    itemBuilder: (context, index) => UserCard(
                      index: index.toString(),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}


// ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: getData.length,
//                   itemBuilder: (context, index) => UserCard(name: getData[index]?.name.toString(),),
//                 ),