import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/controll/mainlayoutadmin_cubit.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/controll/mainlayoutadmin_state.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/widget/custom_bottom_appar.dart';
import 'package:webbing_fixed/features_user/main_layout/presentaion/widget/custom_bottom_appar.dart';

class MainLayoutPageAdmin extends StatelessWidget {
  const MainLayoutPageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayOutAdminCubit, MainLayoutAdminState>(
      builder: (context, state) {
        final cubit = context.read<MainLayOutAdminCubit>();
        return Scaffold(
          body: cubit.pages[state.selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20.0),
              bottom: Radius.circular(20.0),
            ),
            child: Container(
              height: 70.0.h, // Adjust the height as needed
              child: BottomAppBar(
                color: Colors.white70,
                elevation: 10,
                child: CustomBottomAppBarAdmin(),
              ),
            ),
          ),
        );
      },
    );
  }
}
