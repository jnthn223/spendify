import 'package:fpdart/fpdart.dart';
import 'package:spendify/core/error/exceptions.dart';
import 'package:spendify/core/error/failure.dart';
import 'package:spendify/features/categories/data/datasources/categories.remote.data.dart';
import 'package:spendify/features/categories/domain/entities/category.dart';
import 'package:spendify/features/categories/domain/repository/categories.repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepositoryImpl(this.categoriesRemoteDataSource);
  @override
  Future<Either<Failure, List<Category>>> getCategories(
      {required String userId}) async {
    try {
      final categories =
          await categoriesRemoteDataSource.getCategories(userId: userId);
      return right(categories);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
