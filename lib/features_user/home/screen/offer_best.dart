import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/widget/custom_app_padding.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_cubit.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_state.dart';
import 'package:webbing_fixed/features_user/home/widget/custom_cared_splash.dart';

class OfferBestPage extends StatefulWidget {
  const OfferBestPage({super.key});

  @override
  State<OfferBestPage> createState() => _OfferBestPageState();
}

class _OfferBestPageState extends State<OfferBestPage> {
  @override
  void initState() {
    // TODO: implement initState
    final cubit = BlocProvider.of<HomeUserCubit>(context);
    cubit.fetchBestOffer();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: CustomPaddingApp(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<HomeUserCubit, HomeUserState>(
                builder: (context, state) {
                  if (state is HomeUserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BestOfferLoaded) {
                    final offers = state.services;
                    return ListView.builder(
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        final offer = offers[index];
                        String? formattedDate;
                        if (offer.createdAt != null) {
                          formattedDate =
                              DateFormat('yyyy-MM-dd').format(offer.createdAt!);
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 9),
                          child: SizedBox(
                            width: screenWidth,
                            child: CustomCardSplash(
                              offerId: offer.id ?? 0,
                              image: offer.providerPic,
                              timeArrive: formattedDate,
                              price: offer.price ?? 0.toString(),
                              providerName: offer.providerName ?? 'بدون اسم',
                              rating:
                                  '4.5', // يمكن إضافة التقييم لو كان موجودًا
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is HomeUserErrorState) {
                    return Center(
                        child: Text('لا توجد بيانات حالياً.'));
                  }
                  return const Center(child: Text('لا توجد بيانات حالياً.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
