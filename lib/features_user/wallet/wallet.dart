import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            const CustomText(
              text: 'المحفظه',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              textColor: Color(0xFF8D8383),
            ),
            const SizedBox(height: 20,),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TabBar(
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF3EBBDD),
                      width: 3.0,
                    ),
                  ),
                ),
                unselectedLabelColor: Colors.black,
                labelColor: const Color(0xFF3EBBDD),
                labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
                tabs: [
                  Tab(
                    child: Container(
                      width: 164.w,
                      height: 54.h,
                      alignment: Alignment.center,
                      child: const CustomText(
                        text: 'الرصيد',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 164.w,
                      height: 54.h,
                      alignment: Alignment.center,
                      child: const CustomText(
                        text: 'الغرامة',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
