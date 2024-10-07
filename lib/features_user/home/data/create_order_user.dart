import 'package:dartz/dartz.dart';
import 'package:webbing_fixed/features_user/home/model/create_order_model.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class CreateOrderService {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<Either<Failure, CreateOrderResponse>> createOrderServices(CreateOrderRequest createOrderRequest, int id) async {
    try {
      print('Creating order with ID: $id');
      final formData = await createOrderRequest.toMap();
      print('Request data: $formData');

      final response = await networkHandler.postOrder('http://194.164.77.238/order_service/${id}/', formData);
      print('Response status code: ${response.statusCode}');

      // Check for successful response
      if (response.statusCode == 200 && response.statusCode == 201) {
        final jsonResponse = response.data;
        print('Response data: $jsonResponse');
        final servicesResponse = CreateOrderResponse.fromJson(jsonResponse);
        return Right(servicesResponse);
      } else {
        print('Server returned an error: ${response.statusCode}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Error occurred: $error');
      return Left(ServerFailure(message: 'Failed to make request: $error'));
    }
  }
}
