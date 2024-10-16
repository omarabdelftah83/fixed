import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';

class CustomCard extends StatelessWidget {
  final String? providerName;
  final String? price;
  final String? rating;
  final String? iconPath;
  final String? imagePath;

  const CustomCard({
    Key? key,
    this.providerName,
    this.price,
    this.rating,
    this.iconPath,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 80.0),
                  Expanded(
                    child: Column(
                      //  crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: '(${iconPath})' ?? '',
                              fontSize: 15,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              text: price ?? '',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomText(
                              text: providerName ?? '',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(width: 16.0),
                            CircleAvatar(
                              backgroundImage: imagePath != null
                                  ? NetworkImage(
                                      'http://194.164.77.238$imagePath')
                                  : const AssetImage('AssetsManager.defaultAvatar'),
                              radius: 20,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 55.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomText(
                                text: rating ?? '5',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(width: 10),
                              const SvgIconWidget(
                                iconPath: AssetsManager.iconStart ?? '',
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 2,
          top: 2,
          child: Container(
            width: 120.0,
            height: 40.0,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: const Center(
              child: CustomText(
                text: 'افضل',
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
