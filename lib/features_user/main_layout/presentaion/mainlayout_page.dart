import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/features_user/main_layout/presentaion/main_layout_cubit.dart';
import 'package:webbing_fixed/features_user/main_layout/presentaion/main_layout_state.dart';
import 'package:webbing_fixed/features_user/main_layout/presentaion/widget/custom_bottom_appar.dart';

class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenCubit(),
      child: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          final cubit = context.read<MainScreenCubit>();
          return Scaffold(
            body: cubit.pages[state.selectedIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20.0),
                bottom: Radius.circular(20.0),
              ),
              child: Container(
                height: 70.0, // Adjust the height as needed
                child: BottomAppBar(
                  color: Colors.white70,
                  elevation: 10,
                  child: CustomBottomAppBar(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
