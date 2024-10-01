import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // استيراد مكتبة toast
import 'package:webbing_fixed/feature_admin/home/model/post_price.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class ApiOfferPriceService {
  NetworkHandler networkHandler = NetworkHandler();

  Future<Either<Failure, ResponsePrice>> offerPriceOrder(RequestPrice requestPrice) async {
    try {
      final response = await networkHandler.post(
        ApiConfigurations.postPriceOrder,
        requestPrice.toMap(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = ResponsePrice.fromMap(response.data);
        print('Data posted successfully with status code ${response.statusCode}');
        return Right(responseData);
      } else {
        print('Failed to post data with status code: ${response.statusCode}');
        return Left(ServerFailure(message: 'Server returned an error: ${response.statusCode}'));
      }
    } catch (error) {
      print('Error occurred: $error');
      return Left(ServerFailure(message: 'Failed to make request: $error'));
    }
  }
}
