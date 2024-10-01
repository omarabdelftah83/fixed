import 'package:flutter/material.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/sign_up_export.dart';

class SignUpServiceBody extends StatefulWidget {
  @override
  _SignUpServiceBodyState createState() => _SignUpServiceBodyState();
}

class _SignUpServiceBodyState extends State<SignUpServiceBody> {
  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<SignUpCubit>(context);
    cubit.fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   appBar: CustomAppBar(),
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<SignUpCubit>(context);
          List<String> serviceItems = [];

          if (state is ServicesLoaded) {
            serviceItems = state.services.map((service) => service.name).toList();
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h,),
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
                                    if (state is ServicesLoaded) {
                                      final selectedService = state.services
                                          .firstWhere((service) =>
                                              service.name == selectedItem);
                                      cubit.selectedServiceID = selectedService
                                          .id
                                          .toString(); // Convert int to String                                      cubit.onServiceChanged(selectedServiceID); // Pass the ID instead of the name
                                    }
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
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(23.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => cubit.pickImageFromCamera('back'),
                                        child: cubit.isBackImageUploading
                                            ? const Center(child: CircularProgressIndicator())
                                            : cubit.backImageFile == null
                                            ? const Icon(Icons.camera_alt_outlined, size: 24)
                                            : Image.file(
                                          cubit.backImageFile!,
                                          width: 50, // Set width
                                          height: 50, // Set height
                                        ),
                                      ),
                                      const SizedBox(width: 10), // Space between the camera and the text
                                      const CustomText(
                                        text: 'الرجاء تحميل صورة الاماميه',
                                        textColor: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: 'صورة البطاقة(من الخلف)',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(23.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => cubit.pickImageFromCamera('front'),
                                        child: cubit.isFrontImageUploading
                                            ? const Center(child: CircularProgressIndicator())
                                            : cubit.frontImageFile == null
                                            ? const Icon(Icons.camera_alt_outlined, size: 24)
                                            : Image.file(
                                          cubit.frontImageFile!,
                                          width: 50, // Set width
                                          height: 50, // Set height
                                        ),
                                      ),
                                      const SizedBox(width: 10), // Space between the camera and the text
                                      const CustomText(
                                        textColor: Colors.grey,
                                        fontSize: 12,
                                        text: 'الرجاء تحميل صورة الخلفيه',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: 'صورة شخصية',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                 SizedBox(height: 10.h),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(23.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => cubit
                                            .pickImageFromCamera('profile'),
                                        child: cubit.isProfileImageUploading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : cubit.profileImageFile == null
                                                ? const Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 24)
                                                : Image.file(
                                                    cubit.profileImageFile!,
                                                    width: 50,
                                                    // Set width
                                                    height: 50,
                                                  ), // Adjust the size as needed
                                      ),
                                      const SizedBox(width: 10),
                                      // Space between the camera and the text
                                      const CustomText(
                                        textColor: Colors.grey,
                                        fontSize: 12,
                                        text: 'افتح الكاميرة لالتقاط صورة',

                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ),
                                 SizedBox(height: 30.h),
                                CustomButton(
                                  onPressed: () {
                                    cubit.postServices(
                                        context); // Ensure this method is defined in your cubit
                                  },
                                  text: 'انشاء حساب',
                                ),
                                const SizedBox(height: 50),
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
                                          style: TextStyle(fontSize: 16),
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
