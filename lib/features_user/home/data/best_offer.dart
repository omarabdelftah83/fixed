import 'package:dio/dio.dart';
import 'package:webbing_fixed/features_user/home/model/best_offer_model.dart';
import 'package:webbing_fixed/features_user/home/model/order_service.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class GetBestOffer {
  final NetworkHandler networkHandler = NetworkHandler();

  Future<List<BestOfferModel>> getBestOffer() async {
    try {
      final response = await networkHandler.get(ApiConfigurations.getBestOffer);
      if (response.statusCode == 200) {
        final json = response.data as List;
        // Assuming the API returns a list of best offers
        return json.map((offer) => BestOfferModel.fromJson(offer)).toList();
      } else {
        print('Failed to load offers with status code: ${response.statusCode}');
        throw Exception('Failed to load offers');
      }
    } catch (e) {
      print('Failed to load offers: $e');
      throw Exception('Failed to load offers: $e');
    }
  }
}
