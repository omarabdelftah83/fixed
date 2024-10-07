
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_export.dart';

class ServiceDropdown extends StatelessWidget {
  final HomeUserCubit cubit;

  const ServiceDropdown({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeUserCubit, HomeUserState>(
      builder: (context, state) {
        if (state is HomeUserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServiceIdLoaded) {
          final service = state.service;
          return DropDownCustomTextfailed(
            prefixIcon: const Icon(Icons.arrow_drop_down),
            hintText: 'اختر الخدمة',
            dropdownItems: [service.name],
            onDropdownChanged: (selectedItem) {
              cubit.selectedServiceId = selectedItem;
            },
          );
        } else if (state is HomeUserErrorState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is ServicesLoaded && state.services.isEmpty) {
          return const Center(child: Text('لا توجد خدمات متاحة.'));
        } else {
          return const Center(child: Text('لا توجد خدمات متاحة.'));
        }
      },
    );
  }
}
