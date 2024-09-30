import 'package:dartz/dartz.dart';
import '../setting_export.dart';

class UpdateUserProfile {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<Either<Failure, UpdateUserResponse>> updateUser(UpdateUserRequest updateUserRequest) async {
    try {
      final response = await networkHandler.put(
        ApiConfigurations.updateUserData,
        updateUserRequest.toMap(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        final updateUserResponse = UpdateUserResponse.fromMap(data);
        return Right(updateUserResponse);
      } else {
        print('Response Data: ${response.data}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Dio Error: $error');
      return Left(ServerFailure(message: 'فشل في إجراء الطلب: $error')); // تقديم تفاصيل الخطأ
    }
  }
}
