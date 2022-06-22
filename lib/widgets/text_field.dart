import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_info/controller/userdata_controller.dart';

class TextForm extends StatelessWidget {
  TextForm({
    Key? key,
    this.hintString,
    this.formIcon,
    this.keyBoard,
    this.validate,
    this.textController,
  }) : super(key: key);

  final String? hintString;
  final IconData? formIcon;
  final TextInputType? keyBoard;
  final dynamic validate;
  final TextEditingController? textController;
  final UserdataController _userdata = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.grey.shade100),
      child: TextFormField(
        controller: textController,
        keyboardType: keyBoard == null ? TextInputType.text : keyBoard,
        style: TextStyle(color: Colors.blue),
        validator: validate,
        onSaved: (value) {
          _userdata.currentData.add(value);
          print(value);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintString,
          prefixIcon: Icon(formIcon),
        ),
      ),
    );
  }
}
