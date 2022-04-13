import 'package:dio/dio.dart';
import 'package:flutter_data_layer_repository_pattern_v2/data/network/entity/recipe_entity.dart';

class KoException implements Exception {
  final int statusCode;
  final String? message;

  const KoException({required this.statusCode, this.message});

  @override
  String toString() {
    return 'KoException: statusCode: $statusCode, message: ${message ?? 'No message specified'}';
  }
}

class ApiClient {
  final String baseUrl;
  final String apiKey;

  ApiClient({
    required this.baseUrl,
    required this.apiKey,
  });

  Future<RecipeListResponse> getRecipes() async {
    try {
      final response = await Dio().get(
        'https://$baseUrl/recipes/list',
        queryParameters: {
          'from': 0,
          'size': 20,
        },
        options: Options(
          headers: {
            'X-RapidAPI-Host': baseUrl,
            'X-RapidAPI-Key': apiKey,
          },
        ),
      );

      if (response.data != null) {
        final data = response.data;

        return RecipeListResponse.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Could not parse response.');
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw KoException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      } else {
        throw Exception(e.message);
      }
    }
  }
}
