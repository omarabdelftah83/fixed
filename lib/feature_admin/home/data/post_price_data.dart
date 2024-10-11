import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // استيراد مكتبة toast
import 'package:webbing_fixed/feature_admin/home/model/post_price.dart';
import 'package:webbing_fixed/network/api_configurations.dart';
import 'package:webbing_fixed/network/faliar.dart';
import 'package:webbing_fixed/network/network_handler.dart';

class ApiOfferPriceService {
  NetworkHandler networkHandler = NetworkHandler();

  Future<Either<Failure, ResponsePrice>> offerPriceOrder(RequestPrice requestPrice, int id ) async {
    try {
      final response = await networkHandler.post('http://194.164.77.238/order/${id}/offers/', requestPrice.toMap(),
      );

      if ( response.statusCode == 201) {
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
