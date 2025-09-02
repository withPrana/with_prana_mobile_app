import 'package:with_prana_mobile_app/controller/services.dart/api_calls.dart';
import 'package:with_prana_mobile_app/core/constants/api_endpoints.dart';
import 'package:with_prana_mobile_app/core/enums/api_request_enum.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/models/category_models/sub_category_models.dart';

class CategoryServices {
  ////get categories
  static Future<List<CategoryResponseModel>> getCategories() async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.get,
      useToken: false,
      url: ApiEndpoints.categoryEndpointEndpoint,
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

  ////get category by id
  static Future<CategoryByIdResponseModel?> getCategoryById({
    required String categoryId,
  }) async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.get,
      useToken: false,
      url: "${ApiEndpoints.categoryEndpointEndpoint}/$categoryId",
      functionFor: "Category by id",
      errorMessage: "Unable to get category",
    );

    if (response != null) {
      return CategoryByIdResponseModel.fromJson(response);
    }
    return null;
  }

  ////get sub categories
  static Future<List<SubCategoryResponseModel>> getSubCategories() async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.get,
      useToken: false,
      url: ApiEndpoints.subCategoryEndpointEndpoint,
      functionFor: "Category",
      errorMessage: "Unable to get sub categories",
    );

    if (response != null && response is List) {
      final categoryList =
          response
              .map((category) => SubCategoryResponseModel.fromJson(category))
              .toList();
      return categoryList;
    }
    return [];
  }
}
