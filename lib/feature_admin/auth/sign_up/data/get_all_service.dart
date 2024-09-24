import 'package:webbing_fixed/feature_admin/auth/sign_up/model/get_all_services_model.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class GetAllService {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<List<GetAllServicesModel>> getAll() async {
    try {
      final response = await networkHandler.get(ApiConfigurations.getAllServices);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => GetAllServicesModel.fromJson(json)).toList();
      } else {
        print('Failed to load orders with status code: ${response.statusCode}');
        throw Exception('Failed to load orders');
      }
    } catch (e) {
      print('Failed to load orders: $e');
      throw Exception('Failed to load orders: $e');
    }
  }
}