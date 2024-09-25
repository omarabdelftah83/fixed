import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/model/post_provide_model.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class PostService {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<Either<Failure, ServicesResponse>> postServices(ServicesRequest servicesRequest) async {
    try {
      final formData = await servicesRequest.toMap();

      final response = await networkHandler.postImage(
        ApiConfigurations.postAllServices,
        formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = response.data;
        final servicesResponse = ServicesResponse.fromJson(jsonResponse);
        return Right(servicesResponse);
      } else {
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      return Left(ServerFailure(message: 'Failed to make request: $error'));
    }
  }
}
