import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';

class NetworkHandler {
  final Dio _dio = Dio();

  NetworkHandler() {
    _dio.options.connectTimeout = const Duration(seconds: 120); // Increased connect timeout
    _dio.options.receiveTimeout = const Duration(seconds: 120); // Increased receive timeout
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
      if (response.statusCode == 200 || response.statusCode == 201) {
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
  Future<Response> postWithoutBody(String endpoint) async {
    try {
      await _addTokenToHeaders();
      Response response = await _dio.post(endpoint);
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        return response;
      } else {
        print('Failed to post data: ${response.statusCode} - ${response.statusMessage}');
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

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      await _addTokenToHeaders();

      print('Sending data to $endpoint: $data'); // Print the data being sent
      Response response = await _dio.post(
        endpoint,
        data: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        print('Failed to post data: ${response.statusCode} - ${response.data}'); // Print the response data
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

  Future<Response> postOrder(String endpoint, FormData data) async {
    try {
      await _addTokenToHeaders();

      print('Sending data to $endpoint: $data'); // Print the data being sent
      Response response = await _dio.post(
        endpoint,
        data: data,
      );

      if (response.statusCode == 200 && response.statusCode == 201) {
        return response;
      } else {
        print('Failed to post data: ${response.statusCode} - ${response.data}'); // Print the response data
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
      print('Sending request to: $endpoint');
      print('Sending FormData: ${data.fields}');
      final response = await _dio.post(
        endpoint,
        data: data,
      );
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        throw Exception('Failed to post image: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      print('Request path: ${e.requestOptions.path}');
      print('Response data: ${e.response?.data}');
      print('Request headers: ${e.requestOptions.headers}');
      print('Request data: ${e.requestOptions.data}');
      throw Exception('Failed to post image: ${e.message}');
    } catch (e) {
      print('General Exception: $e');
      rethrow;
    }
  }
  Future<Response> putWithBody(String endpoint) async {
    try {
      await _addTokenToHeaders();  // إضافة التوكن للترويسة
      Response response = await _dio.put(endpoint);  // تنفيذ الطلب بدون بيانات
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        print('Error response: ${response.data}');  // عرض رسالة الخطأ إذا حدث
        throw Exception('Failed to put data: ${response.statusCode} - ${response.data}');
      }
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      throw Exception('Failed to put data: ${e.message}');
    } catch (e) {
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
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else {
        print('Error response: ${response.data}');  // Log the error response
        throw Exception('Failed to put data: ${response.statusCode} - ${response.data}');
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
      if (response.statusCode == 200 || response.statusCode == 201) {
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
  void _handleDioError(DioException e) {
    print('DioException: ${e.message}');
    print('Request path: ${e.requestOptions.path}');
    print('Response data: ${e.response?.data}');
    print('Request headers: ${e.requestOptions.headers}');
    print('Request data: ${e.requestOptions.data}');
  }
}
