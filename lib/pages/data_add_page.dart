import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_info/controller/userdata_controller.dart';
import 'package:user_info/services/add_image.dart';
import 'package:user_info/services/validation.dart';
import 'package:user_info/widgets/text_field.dart';

class AddUserInfo extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserdataController _userdata = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _lotController = TextEditingController();
  final TextEditingController _longController = TextEditingController();

  final List userDetails = [];

  dataAddToList() { //<===================addd this in a setState
    userDetails.add(
      {
        'name': "${_nameController.text}",
        'phone': "${_phoneController.text}",
      
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              padding: EdgeInsets.all(14),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      child: Center(
                        child: Text(
                          'Add Up',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.blue[300]),
                        ),
                      ),
                    ),
                    TextForm(
                      textController: _nameController,
                      hintString: 'Enter Name',
                      formIcon: Icons.face_outlined,
                      validate: (value) {
                        if (value == '') {
                          return 'Enter the name please';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextForm(
                      textController: _phoneController,
                      hintString: 'Phone Number',
                      formIcon: Icons.phone_android_outlined,
                      keyBoard: TextInputType.phone,
                      validate: (value) {
                        if (value == '') {
                          return 'Enter the Number please';
                        }
                        if (value.length < 11 || value.length > 11) {
                          return 'Must have 11 degits';
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextForm(
                      textController: _urlController,
                      hintString: 'Enter FB url',
                      formIcon: Icons.facebook_outlined,
                      keyBoard: TextInputType.url,
                      validate: (value) {
                        if (value == '') {
                          return 'Enter the Url please';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: Text('Use Device Location',
                          style: TextStyle(
                              color: Colors.blue[300],
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      onPressed: () {},
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text('Or',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: TextForm(
                              textController: _lotController,
                              hintString: 'Latitude',
                              formIcon: Icons.location_pin,
                              keyBoard: TextInputType.number,
                              validate: (value) {
                                if (value == '') {
                                  return 'location can be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextForm(
                              textController: _longController,
                              hintString: 'Logitude',
                              formIcon: Icons.location_pin,
                              keyBoard: TextInputType.number,
                              validate: (value) {
                                if (value == '') {
                                  return 'location can be empty';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        imageFromCamera();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.camera,
                            color: Colors.blue[300],
                            size: 24,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Add Image',
                            style: TextStyle(
                                fontSize: 16, color: Colors.blue[300]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      child: MaterialButton(
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          if (validateAndSave(_formKey)) {
                            print('Form Validated');
                            Navigator.pop(context);
                            print(_userdata.currentData);
                            _userdata.updateList();
                            print(_userdata.currentData);
                          } else {
                            print('Form not Validated');
                          }
                        },
                        color: Colors.blue[500],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
