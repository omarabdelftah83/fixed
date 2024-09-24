import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/sign_up_export.dart';

class SignUpService extends StatefulWidget {
  @override
  _SignUpServiceState createState() => _SignUpServiceState();
}

class _SignUpServiceState extends State<SignUpService> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _frontImageFile;
  File? _backImageFile;
  File? _profileImageFile;
  bool _isFrontImageUploading = false;
  bool _isBackImageUploading = false;
  bool _isProfileImageUploading = false;
@override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<SignUpCubit>(context);
    cubit.fetchServices();
  }
  Future<void> _pickImageFromCamera(String imageType) async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          if (imageType == 'front') {
            _frontImageFile = File(pickedFile.path);
            _isFrontImageUploading = true;
          } else if (imageType == 'back') {
            _backImageFile = File(pickedFile.path);
            _isBackImageUploading = true;
          } else if (imageType == 'profile') {
            _profileImageFile = File(pickedFile.path);
            _isProfileImageUploading = true;
          }
        });
        await _uploadImage(pickedFile.path, imageType);
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
  }

  Future<void> _uploadImage(String imagePath, String imageType) async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      if (imageType == 'front') {
        _isFrontImageUploading = false;
      } else if (imageType == 'back') {
        _isBackImageUploading = false;
      } else if (imageType == 'profile') {
        _isProfileImageUploading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> serviceItems = [];

    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<SignUpCubit>(context);
          if (state is ServicesLoaded) {

            serviceItems = state.services
                .map((serviceItems) => serviceItems.name)
                .toList();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: CustomText(
                    text: 'تسجيل الخدمة',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 700,
                      margin: const EdgeInsets.only(top: 40),
                      decoration: const BoxDecoration(
                        color: Color(0xFF3EBBDD),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 0.0,
                      right: 0.0,
                      bottom: 10,
                      child: Container(
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: 'الخدمة المقدمة',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropDownCustomTextfailed(
                                  prefixIcon: const Icon(Icons.arrow_drop_down),
                                  hintText: 'اختر الخدمة',
                                  dropdownItems: serviceItems,
                                  onDropdownChanged: (selectedItem) {
                                    // Handle dropdown change
                                  },
                                ),
                                const SizedBox(height: 30),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: 'صورة البطاقة(من الامام)',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => _pickImageFromCamera('front'),
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          child: _isFrontImageUploading
                                              ? const Center(child: CircularProgressIndicator())
                                              : _frontImageFile == null
                                              ? const Icon(Icons.camera_alt_outlined, size: 24)
                                              : Image.file(_frontImageFile!),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Expanded(
                                      child: CustomTextField(
                                        prefixIcon: Icon(Icons.download),
                                        hintText: 'تحميل',
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: 'صورة البطاقة(من الخلف)',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => _pickImageFromCamera('back'),
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          child: _isBackImageUploading
                                              ? const Center(child: CircularProgressIndicator())
                                              : _backImageFile == null
                                              ? const Icon(Icons.camera_alt_outlined, size: 24)
                                              : Image.file(_backImageFile!),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Expanded(
                                      child: CustomTextField(
                                        prefixIcon: Icon(Icons.download),
                                        hintText: 'تحميل',
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: 'صورة شخصية',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () => _pickImageFromCamera('profile'),
                                  child: Container(
                                    width: 00,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: _isProfileImageUploading
                                        ? const Center(child: CircularProgressIndicator())
                                        : _profileImageFile == null
                                        ? const Icon(Icons.camera_alt_outlined, size: 24)
                                        : Image.file(_profileImageFile!),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                CustomButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.mainLayoutPage);
                                  },
                                  text: 'انشاء حساب',
                                ),
                                const SizedBox(height: 30),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.singUpAdminPage);
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: AppStrings.noAccount + ' ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                        TextSpan(
                                          text: AppStrings.createAccount,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF3EBBDD),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icon_google.png',
                                      width: 50,
                                      height: 100,
                                    ),
                                    const SizedBox(width: 16),
                                    Image.asset(
                                      'assets/icon_face.png',
                                      width: 50,
                                      height: 100,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
