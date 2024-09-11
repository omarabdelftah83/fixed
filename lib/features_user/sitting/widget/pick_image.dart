import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';

class PickImageWidget extends StatefulWidget {
  const PickImageWidget({super.key});

  @override
  _PickImageWidgetState createState() => _PickImageWidgetState();
}

class _PickImageWidgetState extends State<PickImageWidget> {
  File? _imageFile;

  Future<void> _pickAndUploadImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const String defaultImagePath = 'assets/image/3ed75d887e493bf524f77569db242502.png'; // Default asset path

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!)
                    : AssetImage(defaultImagePath) as ImageProvider,
                radius: 35,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => _pickAndUploadImage(),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const CustomText(
          text: 'تعديل',
          textColor: Colors.blue,
        ),
      ],
    );
  }
}
