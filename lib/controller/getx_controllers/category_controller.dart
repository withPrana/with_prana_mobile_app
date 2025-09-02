import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/services.dart/category_services.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/models/category_models/sub_category_models.dart';

class CategoryController extends GetxController {
  final categories = <CategoryResponseModel>[].obs;
  final subCategories = <SubCategoryResponseModel>[].obs;

  final categoryById = Rx<CategoryByIdResponseModel?>(null);

  final isLoadingCategories = false.obs;
  final isLoadingCategoryById = false.obs;
  final isLoadingSubCategory = false.obs;

  ////get categories
  Future<void> getCategories() async {
    isLoadingCategories.value = true;
    final response = await CategoryServices.getCategories();
    categories.value = response;
    isLoadingCategories.value = false;
  }

  ////get categories
  Future<void> getCategoryById(String categoryId) async {
    isLoadingCategoryById.value = true;
    final response = await CategoryServices.getCategoryById(
      categoryId: categoryId,
    );
    categoryById.value = response;
    isLoadingCategoryById.value = false;
  }

  ////get sub categories
  Future<void> getSubCategories() async {
    isLoadingSubCategory.value = true;
    final response = await CategoryServices.getSubCategories();
    subCategories.value = response;
    isLoadingSubCategory.value = false;
  }
}
