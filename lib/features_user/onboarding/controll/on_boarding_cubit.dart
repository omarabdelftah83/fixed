import 'package:bloc/bloc.dart';
import 'package:webbing_fixed/features_user/onboarding/controll/on_boarding_state.dart';
import 'package:webbing_fixed/features_user/onboarding/data/country_repository.dart';
import 'package:webbing_fixed/features_user/onboarding/model/country_model.dart';


class OnBoardingCubit extends Cubit<OnBoardingState> {
  final ApiCountryService apiCountryService;

  OnBoardingCubit(this.apiCountryService) : super(OnBoardingInitial());

  // Method to send the selected language and country
  Future<void> sendCountryAndLanguage(String language, String country) async {
    final requestModel = RequestCountryModel(
      lan: language,
      country: country,
    );
    final result = await apiCountryService.country(requestModel);
    result.fold(
          (failure) {
        print('Error: ${failure.message}');
      },
          (_) {
        print('Country and language sent successfully');
      },
    );
  }
}
