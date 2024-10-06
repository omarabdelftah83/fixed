import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/custom_button/custom_buttom.dart';

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
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  TextEditingController imageController = TextEditingController();
  double _containerHeight = 50.0;

  int _unitCount = 0;
  String? selectedServiceId;

  void _increment() {
    setState(() {
      _unitCount++;
    });
  }

  void _decrement() {
    if (_unitCount > 0) {
      setState(() {
        _unitCount--;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
        imageController.text = pickedFile.path;
        _containerHeight = 150.0;
      });
      print("Image path: ${pickedFile.path}");
    } else {
      print("No image selected.");
    }
  }

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                builder: (context, state) {
                  if (state is ServiceIdLoaded) {
                    final service = state.service;

                    return DropDownCustomTextfailed(
                      prefixIcon: const Icon(Icons.arrow_drop_down),
                      hintText: 'اختر الخدمة',
                      dropdownItems: [service.name],
                      onDropdownChanged: (selectedItem) {
                        setState(() {
                          selectedServiceId = service.id.toString();
                        });
                      },
                    );
                  } else if (state is HomeUserLoading) {
                    return const Center(child: CircularProgressIndicator());
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
                dropdownItems: ['في اقرب وقت', ' اليوم', 'غدا', 'خلال اسبوع', 'الاسبوع القادم'],
                onDropdownChanged: (selectedItem) {},
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
              const CustomTextField(
                prefixIcon: Icon(Icons.check),
                hintText: 'تم التحديد',
                keyboardType: TextInputType.emailAddress,
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
                onTap: _pickImage,
                child: Container(
                  height: _containerHeight,
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    image: _selectedImage != null
                        ? DecorationImage(
                      image: FileImage(File(_selectedImage!.path)),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (_selectedImage == null) ...[
                        const Icon(Icons.camera_alt_outlined, color: Colors.grey),
                        const SizedBox(width: 10),
                      ],
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: TextField(
                            controller: imageController,
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
              const CustomTextField(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _decrement,
                  ),
                  Text(
                    '$_unitCount',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _increment,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Center(child: CustomButton(
                  color: Colors.grey[200],
                  onPressed: (){}, text: 'تخطي',textColor: Colors.black54,))
            ],
          ),
        ),
      ),
    );
  }
}
