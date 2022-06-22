import 'package:image_picker/image_picker.dart';

imageFromCamera() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
}
