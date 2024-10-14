
import 'package:flutter/material.dart';
import 'package:webbing_fixed/location/current_location.dart';
import '../home_export.dart';

class ConditionFixed extends StatefulWidget {
  final int serviceId;
  const ConditionFixed({Key? key, required this.serviceId}) : super(key: key);

  @override
  _ConditionFixedState createState() => _ConditionFixedState();
}

class _ConditionFixedState extends State<ConditionFixed> {


  @override
  void initState() {
    super.initState();
    final cubit = BlocProvider.of<HomeUserCubit>(context);
    cubit.fetchServiceId(widget.serviceId);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeUserCubit>(context);
    return Scaffold(
      body: CustomPaddingApp(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomText(
                  text: 'صيانة التكيفات',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'تحديد الخدمة',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<HomeUserCubit, HomeUserState>(
                buildWhen: (previous, current) {
                  return current is ServiceIdLoaded ||
                      current is ServicesLoaded;
                },
                builder: (context, state) {
                  if (state is HomeUserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ServiceIdLoaded) {
                    final service = state.service;
                    return DropDownCustomTextfailed(
                      prefixIcon: const Icon(Icons.arrow_drop_down),
                      hintText: 'اختر الخدمة',
                      dropdownItems: [service.name],
                      onDropdownChanged: (selectedItem) {
                        cubit.selectedServiceId = selectedItem;
                      },
                    );
                  } else if (state is HomeUserErrorState) {
                    return Center(child: Text(state.errorMessage));
                  } else if (state is ServicesLoaded &&
                      state.services.isEmpty) {
                    return const Center(child: Text('لا توجد خدمات متاحة.'));
                  } else {
                    return const Center(child: Text('لا توجد خدمات متاحة.'));
                  }
                },
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'الوقت المناسب',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              DropDownCustomTextfailed(
                prefixIcon: const Icon(Icons.arrow_drop_down),
                hintText: 'اختر الوقت المناسب للتنفيذ',
                dropdownItems: [
                  'في اقرب وقت',
                  'اليوم',
                  'غدا',
                  'خلال اسبوع',
                  'الاسبوع القادم'
                ],
                onDropdownChanged: (selectedItem) {
                  setState(() {
                    cubit.selectedTime = selectedItem;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'العنوان',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),

              InkWell(
                onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CurrentLocationPage(),
                      ),
                    );
                },
                child: Container(
                  height: 60, // ارتفاع الحقل
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey), // أيقونة الموقع
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: cubit.locationController,
                          readOnly: true, // لجعل الحقل غير قابل للتحرير
                          decoration: const InputDecoration(
                            hintText: 'حدد موقعك',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'إرفاق صورة أو فيديو للمشكلة',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await cubit.pickImage();
                  setState(() {});
                },
                child: Container(
                  height: cubit.containerHeight,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    image: cubit.selectedImage != null
                        ? DecorationImage(
                            image: FileImage(File(cubit.selectedImage!.path)),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (cubit.selectedImage == null) ...[
                        const Icon(Icons.camera_alt_outlined,
                            color: Colors.grey),
                        const SizedBox(width: 10),
                      ],
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: TextField(
                            controller: cubit.imageController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              hintText: 'التقاط',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'الوصف',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: cubit.descriptionController,
                minLines: 2,
                maxLines: 11,
                hintText: 'يرجى كتابة المشكلة بدقة...',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'عدد الوحدات',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<HomeUserCubit, HomeUserState>(
                builder: (context, state) {
                  if (state is HomeUserLoading) {
                    return const Center(
                        child: CircularProgressIndicator()); // يظهر عند التحميل
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: cubit.decrement,
                      ),
                      Text(
                        '${cubit.unitCount}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: cubit.increment,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              Center(
                child: CustomButton(
                  color: Colors.grey[200],
                  onPressed: () async {
                    String? token = CacheHelper.getToken();

                    if (cubit.selectedServiceId == null ||
                        cubit.selectedTime == null ||
                        cubit.locationController.text.isEmpty ||
                        cubit.descriptionController.text.isEmpty ||
                        cubit.unitCount <= 0) {
                      showSnackbar(context, 'يرجى ملء جميع الحقول المطلوبة.',
                          Colors.red);
                      return;
                    }

                    if (token == null) {
                      final result = await Navigator.pushNamed(
                          context, Routes.singUpPageUser);
                    } else {
                      await cubit.createOrderService(widget.serviceId, context);
                    }

                    showSnackbar(
                        context, 'Order created successfully', Colors.green);
                    cubit.selectedServiceId = null;
                    cubit.selectedTime = null;
                    cubit.locationController.clear();
                    cubit.imageController.clear();
                    cubit.descriptionController.clear();
                    cubit.unitCount = 0;
                    cubit.clearImage(); // Call the clear image method

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const MainLayoutPage(),
                      ),
                      (route) => false, // إزالة جميع الصفحات السابقة
                    );
                  },
                  text: 'تخطي',
                  textColor: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message, Color? color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

}


