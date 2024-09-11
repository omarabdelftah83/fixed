import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/SvgIcon/custom_svg_icon.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/controll/mainlayoutadmin_cubit.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/controll/mainlayoutadmin_state.dart';

class CustomBottomAppBarAdmin extends StatelessWidget {
  CustomBottomAppBarAdmin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainLayOutAdminCubit>();
    return BlocBuilder<MainLayOutAdminCubit, MainLayoutAdminState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            cubit.icons.length,
                (index) {
              return GestureDetector(
                onTap: () => cubit.updateSelectedIndex(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 8),
                    SvgIconWidget(
                      iconPath: cubit.icons[index],
                      color: state.selectedIndex == index
                          ? Colors.blue
                          : Colors.black,
                    ),
                    const SizedBox(width: 8),
                    CustomText(
                      text: cubit.labels[index],
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      textColor: state.selectedIndex == index
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
