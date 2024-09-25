import 'package:webbing_fixed/feature_admin/home/model/get_all_order_model.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class GetAllOrderRepository {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<List<GetOrderModel>> getAllOrderHome() async {
    try {
      final response = await networkHandler.get(ApiConfigurations.getOrderHome);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => GetOrderModel.fromJson(json)).toList();
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