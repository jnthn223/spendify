import 'package:fpdart/fpdart.dart';
import 'package:spendify/core/error/failure.dart';
import 'package:spendify/features/categories/domain/entities/category.dart';

abstract interface class CategoriesRepository {
  Future<Either<Failure, List<Category>>> getCategories(
      {required String userId});
}
