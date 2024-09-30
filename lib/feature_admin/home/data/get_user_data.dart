import 'package:webbing_fixed/feature_admin/home/model/get_user_model.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class GetUserRepository {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<GetUserModel?> getUserData() async {
    try {
      final response = await networkHandler.get(ApiConfigurations.getUserData);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = response.data;
        final user = GetUserModel.fromJson(jsonMap);
        return user;
      } else {
        print('Error: ${response.statusCode} - ${response.data}');
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e, stacktrace) {
      print('Exception: $e');
      print('Stacktrace: $stacktrace');
      throw Exception('Failed to load data: $e');
    }
  }
}
