import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/features_user/onboarding/model/country_model.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class ApiLangService {
  NetworkHandler networkHandler = NetworkHandler();

  Future<Either<Failure, Unit>> lang(RequestCountryModel requestCountryModel) async {
    try {
      final response = await networkHandler.put(
        ApiConfigurations.updateUserData,  // Make sure the URL is correct
        requestCountryModel.toMap(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(unit);
      } else {
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      return Left(ServerFailure(message: 'Failed to make request: $error'));
    }
  }
}

