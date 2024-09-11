import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/text_failed/custom_text_failed.dart';
import 'package:webbing_fixed/core/text_failed/drop_down_custom_textfailed.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';

class ConditionFixed extends StatefulWidget {
  const ConditionFixed({Key? key}) : super(key: key);

  @override
  _ConditionFixedState createState() => _ConditionFixedState();
}

class _ConditionFixedState extends State<ConditionFixed> {
  int _unitCount = 0;

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
              DropDownCustomTextfailed(
                prefixIcon: const Icon(Icons.arrow_drop_down),
                hintText: 'اختر الخدمة',
                dropdownItems: [' نقل او تركيب مكيف', ' تعبئة غاز وتنظيف مكيف','تصليح مكيف','اخرى'],
                onDropdownChanged: (selectedItem) {
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
                dropdownItems: ['في اقرب وقت', ' اليوم','غدا','خلال اسبوع','الاسبوع القادم'],
                onDropdownChanged: (selectedItem) {
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
              const CustomTextField(
                prefixIcon: Icon(Icons.camera_alt_outlined),
                hintText: 'التقاط',
                keyboardType: TextInputType.emailAddress,
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
            ],
          ),
        ),
      ),
    );
  }
}
