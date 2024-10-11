import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:webbing_fixed/core/shimmer/shimmer_loading.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_cubit.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_state.dart';
import 'package:webbing_fixed/features_user/home/widget/custom_cared.dart';
import 'package:webbing_fixed/features_user/sitting/setting_export.dart';
class BestOffers extends StatelessWidget {
  const BestOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeUserCubit>(context);

    return BlocBuilder<HomeUserCubit, HomeUserState>(
      buildWhen: (previous, current) {
        return current is HomeUserLoading ||
            current is BestOfferLoaded ||
            current is HomeUserErrorState;
      },
      builder: (context, state) {
        if (state is HomeUserLoading) {
          return const ShimmerLoading();
        } else if (state is BestOfferLoaded) {
          final offers = state.services;
          return Container(
            height: 185.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                    width: 340.w,
                    child: CustomCard(
                      iconPath: offer.serviceName,
                      imagePath: offer.providerPic,
                      providerName: offer.providerName ?? 'Unknown Provider',
                      price: offer.price ?? '0',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is HomeUserErrorState) {
          return Center(child: Text('حدث خطأ: ${state.errorMessage}'));
        }
        return const Center(child: Text('لا توجد بيانات حالياً.'));
      },
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // عدد العناصر الوهمية
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
