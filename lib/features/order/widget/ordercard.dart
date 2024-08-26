import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';

class OrderCard extends StatelessWidget {
  final String name;
  final String service;
  final String date;
  final String imagePath;
  final String status;

  const OrderCard({
    super.key,
    required this.name,
    required this.service,
    required this.date,
    required this.imagePath,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 1,
              height: 90,
              color: Colors.grey.shade400,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الاسم: $name',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('الخدمة: $service',
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  Text(date,
                      style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  if (status == 'ملغية')
                    Row(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.call,
                              color: Colors.blue,
                            ),
                            onPressed: () {}),
                        IconButton(
                            icon: const Icon(
                              Icons.mail_outline,
                              color: Colors.blue,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                ],
              ),
            ),
            if (status == 'ملغية')
              GestureDetector(
                onTap: () {
                  _showAlertDialog(context);
                },
                child: const CustomText(
                  text: '(الغاء)',
                  fontSize: 15,
                  textColor: Colors.red,
                ),
              )
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const CustomText(
            text: 'الغاء',
            fontSize: 30,
          ),
          content: contentText(),
          actions: <Widget>[
            TextButton(
              child:const CustomText(text: 'الغاء',textColor: Colors.red,fontSize: 25,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget contentText() {
    return const SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText(
            text: 'هل تريد الغاء الموعد ؟',
            fontSize: 25,
          ),
          CustomText(
            text: 'اذا حذفت الموعد قبلها ب ساعه سيتم\n تطبيق غرامة قدرها 50 جنيه مصري ',
            fontSize: 15,
            textColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
