import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/shimmer/shimmer_loading.dart';
import '../home_export.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeUserCubit>(context);

    return BlocBuilder<HomeUserCubit, HomeUserState>(
      buildWhen: (previous, current) {
        return current is HomeUserLoading ||
            current is ServicesLoaded ||
            current is HomeUserErrorState;
      },
      builder: (context, state) {
        if (state is HomeUserLoading) {
          return const ShimmerLoading();
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
                    cubit.fetchServices();
                    cubit.fetchBestOffer();
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
          return const Center(child: Text(''));
        }
      },
    );
  }

}
