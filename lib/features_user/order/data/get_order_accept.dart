import 'package:webbing_fixed/features_user/order/%20model/get_all_order_accept.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class GetAllOrderAcceptUserRepository {
  final NetworkHandler networkHandler = NetworkHandler();
  Future<List<GetAllOrderAcceptUser>> getAllOrderAcceptUser() async {
    try {
      final response = await networkHandler.get(ApiConfigurations.getOrderAcceptUser);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => GetAllOrderAcceptUser.fromJson(json)).toList();
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