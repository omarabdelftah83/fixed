import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/drop_down_custom_textfailed.dart';
import 'package:webbing_fixed/features_user/sitting/widget/custom_listtile.dart';
import 'package:webbing_fixed/features_user/sitting/widget/custom_switch.dart';

class Settingbody extends StatelessWidget {
  const Settingbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            const Center(
              child: CustomText(
                textColor: Color(0XFF8D8383),
                text: 'الاعدادات',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
             SizedBox(
              height: 16.h,
            ),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              hintText: 'تعديل الملف الشخصي',
              onTap: (){
                Navigator.pushNamed(context, Routes.editProfile);

              },
            ),
             SizedBox(
              height: 16.h,
            ),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.wallet_travel,
                color: Colors.blue,
              ),
              // Example suffixIcon
              hintText: 'المحفظة',
              onTap: (){
               Navigator.pushNamed(context, Routes.walletPage);

              },
            ),
             SizedBox(
              height: 16.h,
            ),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.language,
                color: Colors.blue,
              ),
              // Example suffixIcon

              prefixIcon: const Icon(Icons.arrow_drop_down),
              hintText: ' اللغه',
              dropdownItems: ['English', 'العربية'],
              onDropdownChanged: (selectedItem) {},
            ),
             SizedBox(
              height: 16.h,
            ),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.public,
                color: Colors.blue,
              ),
              prefixIcon: const Icon(Icons.arrow_drop_down),
              hintText: ' الدوله',
              dropdownItems: ["مصر", "الكويت"],
              onDropdownChanged: (selectedItem) {},
            ),
             SizedBox(
              height: 16.h,
            ),
            CustomSwitch(
              border: Border.all(color: Colors.grey, width: 1.0),

              value: true,
              text: 'حفظ كلمة المرور',
              icon: Icons.lock,
              onChanged: (value) {},
            ),
             SizedBox(
              height: 16.h,
            ),
            CustomSwitch(
              border: Border.all(color: Colors.grey, width: 1.0),
              value: true,
              text: 'حفظ البصة',
              icon: Icons.fingerprint,
              onChanged: (value) {},
            ),
             SizedBox(
              height: 16.h,
            ),
            CustomListtile(
              text: 'الشروط والاحكام',
              icon: Icons.document_scanner,
              onTap: () {},
            ),
             SizedBox(
              height: 16.h,
            ),
            CustomListtile(
              text: 'تسجيل الخروج',
              icon: Icons.logout,
              isLogout: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
