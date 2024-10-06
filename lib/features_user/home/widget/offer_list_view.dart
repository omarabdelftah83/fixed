import 'package:flutter/material.dart';
import 'package:webbing_fixed/features_user/home/widget/custom_cared.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
