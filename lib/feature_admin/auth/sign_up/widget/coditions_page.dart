import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/controll/sign_up_cubit.dart';

class ConditionsPage extends StatelessWidget {
  const ConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الشروط والأحكام'),
        ),
        body: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            final cubit =context.read<SignUpCubit>();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount:cubit. termsAndConditions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // النص الخاص بكل شرط
                        Expanded(
                          child: Text(
                          cubit.  termsAndConditions[index],
                            textAlign: TextAlign.right,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          '${index + 1}.',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
