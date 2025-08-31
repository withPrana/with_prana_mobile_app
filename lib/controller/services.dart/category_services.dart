import 'package:with_prana_mobile_app/controller/services.dart/api_calls.dart';
import 'package:with_prana_mobile_app/core/constants/api_endpoints.dart';
import 'package:with_prana_mobile_app/core/enums/api_request_enum.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';

class CategoryServices {
  ////get categories
  static Future<List<CategoryResponseModel>> getCategories() async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.get,
      useToken: false,
      url: ApiEndpoints.categoryEndpoint,
      functionFor: "Category",
      errorMessage: "Unable to get categories",
    );

    if (response != null && response is List) {
      final categoryList =
          response
              .map((category) => CategoryResponseModel.fromJson(category))
              .toList();
      return categoryList;
    }
    return [];
  }
}
