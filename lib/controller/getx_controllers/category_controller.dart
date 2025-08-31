import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/services.dart/category_services.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';

class CategoryController extends GetxController {
  final categories = <CategoryResponseModel>[].obs;

  final isLoadingCategory = false.obs;

  ////get categories
  Future<void> getCategories() async {
    isLoadingCategory.value = true;
    final response = await CategoryServices.getCategories();
    categories.value = response;
    isLoadingCategory.value = false;
  }
}
