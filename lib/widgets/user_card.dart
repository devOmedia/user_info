import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:user_info/controller/userdata_controller.dart';
import 'package:user_info/services/map_lancher.dart';
import 'package:user_info/services/url_lancher.dart';

class UserCard extends StatelessWidget {
  UserCard({Key? key, this.index}) : super(key: key);

  final String? index;
  final UserdataController _userdata = Get.find();

  @override
  Widget build(BuildContext context) {
    final data = _userdata.data[int.parse(index.toString())];
    return Container(
      width: double.infinity,
      height: 100,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${data['name'] ?? 'Mahamudul Hasan'}"),
                  Text("${data['phone'] ?? '01830668736'}"),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('facebook pressed');
                        launchURL(data['fbUrl'].toString());
                      },
                      child: Icon(
                        Icons.facebook_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('location pressed');
                        openMap(22.7010, 90.3535);
                      },
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        print('call pressed');
                        await FlutterPhoneDirectCaller.callNumber(
                            data['phone'].toString());
                      },
                      child: Icon(
                        Icons.call,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
