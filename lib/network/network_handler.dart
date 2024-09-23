import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webbing_fixed/core/resource/app_string.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';

class NetworkHandler {
  final Dio _dio = Dio();

  NetworkHandler() {
    _dio.options.connectTimeout = const Duration(seconds: 60); // Increased connect timeout
    _dio.options.receiveTimeout = const Duration(seconds: 60); // Increased receive timeout
    _dio.options.headers = {
      'Content-Type': 'application/json',
    };
    // Allow all status codes for custom handling
    _dio.options.validateStatus = (status) {
      return status! < 600; // Allow all status codes
    };
  }

  Future<void> _addTokenToHeaders() async {
    String? token = CacheHelper.getToken();  // Using the getToken method
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
      print('Token added to headers: $token');
    } else {
      print('No token found');
    }
  }

  Future<Response> get(String endpoint) async {
    try {
      await _addTokenToHeaders();
      Response response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load data: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw Exception('Failed to fetch data: ${e.message}');
    } catch (e) {
      print('General Exception: $e');
      rethrow;
    }
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      await _addTokenToHeaders();
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception('Failed to post data: ${e.message}');
    } catch (e) {
      print('General Exception: $e');
      rethrow;
    }
  }


  Future<Response> postFavorite(String endpoint) async {
    try {
      await _addTokenToHeaders();
      Response response = await _dio.post(
        endpoint,
        // No data argument
      );
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200) {
        return response;
      } else {
        // Provide additional information on what might have gone wrong
        print('Failed to post data: ${response.statusCode} - ${response.statusMessage}');
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw Exception('Failed to post data: ${e.message}');
    } catch (e) {
      print('General Exception: $e');
      rethrow;
    }
  }

  Future<Response> postImage(String endpoint, FormData data) async {
    try {
      await _addTokenToHeaders();
      Response response = await _dio.post(
        endpoint,
        data: data,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        // تسجيل معلومات إضافية حول الاستجابة إذا فشلت
        print('Failed to post image: ${response.statusCode}');
        print('Response data: ${response.data}');
        throw Exception('Failed to post image: ${response.statusCode}');
      }
    } on DioException catch (e) {
      // تسجيل تفاصيل الاستثناء من Dio
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw Exception('Failed to post image: ${e.message}');
    } catch (e) {
      // تسجيل أي استثناءات أخرى
      print('General Exception: $e');
      rethrow;
    }
  }

  Future<Response> put(String endpoint, Map<String, dynamic> data) async {
    try {
      await _addTokenToHeaders();
      Response response = await _dio.put(
        endpoint,
        data: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to put data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception('Failed to put data: ${e.message}');
    } catch (e) {
      print('General Exception: $e');
      rethrow;
    }
  }

  Future<Response> patch(String endpoint, Map<String, dynamic> data) async {
    try {
      await _addTokenToHeaders();
      Response response = await _dio.patch(
        endpoint,
        data: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to patch data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception('Failed to patch data: ${e.message}');
    } catch (e) {
      print('General Exception: $e');
      rethrow;
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      await _addTokenToHeaders();
      Response response = await _dio.delete(endpoint);
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200 || response.statusCode == 204) {
        return response;
      } else {
        throw Exception('Failed to delete data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Response data: ${e.response?.data}');
      throw Exception('Failed to delete data: ${e.message}');
    } catch (e) {
      print('General Exception: $e');
      rethrow;
    }
  }
}
