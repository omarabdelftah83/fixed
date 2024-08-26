
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/custom_textfailed%20_search.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';
import 'package:webbing_fixed/home/presention/widget/custom_cared.dart';
import 'package:webbing_fixed/home/presention/widget/custom_row_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaddingApp(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomRow(
                leftIconPath: AssetsManager.iconWallet,
                rightIconPath: AssetsManager.iconLocation,
                text: 'حدد موقعك',
              ),
              const SizedBox(height: 45,),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(
                  text: 'هل تحتاج مساعدة ؟',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10,),
              const CustomTextFieldSearch(
                suffixIcon: Icon(Icons.search),
                prefixIcon: Icon(Icons.keyboard_voice_rounded),
                hintText: 'بحث ',
              ),
              const SizedBox(height: 40,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'عرض الكل ', fontSize: 16, fontWeight: FontWeight.w600,),
                  CustomText(text: 'العروض ', fontSize: 18, fontWeight: FontWeight.w700,),
                ],
              ),
              const SizedBox(height: 18,),
              // In HomePage
              Container(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        width: 400,
                        child: CustomCard(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 18,),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(text: 'اختار خدمة الصيانة ', fontSize: 18, fontWeight: FontWeight.w600,),
              ),
              const SizedBox(height: 18,),
              const Align(
                alignment: Alignment.topRight,
                child: CustomText(text: 'ثم احصل على افضل العروض وافضل خدمة ', fontSize: 12, fontWeight: FontWeight.w400,),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                height: 300,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 4, // Number of items
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.conditionFixed);

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.black26,
                            width: 1,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(AssetsManager.iconStart),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Item $index',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}