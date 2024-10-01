import 'package:bloc/bloc.dart';
import 'package:webbing_fixed/features_user/onboarding/data/country_repository.dart';
import 'package:webbing_fixed/features_user/onboarding/model/country_model.dart';
import 'package:webbing_fixed/features_user/sitting_user/controll/lang_user_state.dart';

class LangUserCubit extends Cubit<LangUserState> {
  final ApiCountryService apiCountryService;

  LangUserCubit(this.apiCountryService) : super(LangUserInitial());

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
