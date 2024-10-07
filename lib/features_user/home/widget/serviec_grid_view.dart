import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_cubit.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_cubit.dart';
import 'package:webbing_fixed/features_user/home/controll/home_user_state.dart';
import 'package:webbing_fixed/features_user/home/screen/condetion_fixed.dart';

class ServicesGridView extends StatefulWidget {
  const ServicesGridView({Key? key}) : super(key: key);

  @override
  _ServicesGridViewState createState() => _ServicesGridViewState();
}

class _ServicesGridViewState extends State<ServicesGridView> with AutomaticKeepAliveClientMixin {
  late HomeUserCubit homeUserCubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homeUserCubit = BlocProvider.of<HomeUserCubit>(context);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // استدعاء super.build

    return BlocBuilder<HomeUserCubit, HomeUserState>(
      builder: (context, state) {
        if (state is HomeUserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServicesLoaded) {
          final services = state.services;
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConditionFixed(serviceId: service.id),
                    ),
                  ).then((value) {
                    homeUserCubit.fetchServices();
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(
                          'http://194.164.77.238${service.photo}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          service.name,
                          style: const TextStyle(
                            fontSize: 14,
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
          );
        } else if (state is HomeUserErrorState) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('No services available.'));
        }
      },
    );
  }
}
