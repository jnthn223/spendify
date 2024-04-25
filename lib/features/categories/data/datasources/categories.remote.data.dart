import 'package:spendify/core/error/exceptions.dart';
import 'package:spendify/features/categories/data/models/category.model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories({required String userId});
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final SupabaseClient supabaseClient;

  CategoriesRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<CategoryModel>> getCategories({required String userId}) async {
    try {
      final result =
          await supabaseClient.from("categories").select().eq("userId", userId);
      return result
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
