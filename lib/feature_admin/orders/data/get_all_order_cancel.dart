import 'package:webbing_fixed/feature_admin/orders/model/get_all_order_accept.dart';
import 'package:webbing_fixed/feature_admin/orders/model/get_all_order_cancel.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class GetAllOrderCancelRepository {
  final NetworkHandler networkHandler = NetworkHandler();
  Future<List<GetAllOrderCancel>> getAllOrderCancel() async {
    try {
      final response = await networkHandler.get(ApiConfigurations.getOrderCancel);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => GetAllOrderCancel.fromJson(json)).toList();
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