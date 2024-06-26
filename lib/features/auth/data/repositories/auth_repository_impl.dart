import 'package:fpdart/fpdart.dart';
import 'package:spendify/core/common/entities/user.dart';
import 'package:spendify/core/error/exceptions.dart';
import 'package:spendify/core/error/failure.dart';
import 'package:spendify/features/auth/data/datasources/auth_remote.data_source.dart';
import 'package:spendify/features/auth/domain/repository/auth.repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null) return left(Failure('User is not logged in'));

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final user = await remoteDataSource.signInWithEmailPassword(
          email: email, password: password);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
          name: name, email: email, password: password);
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOutUser() async {
    try {
      await remoteDataSource.signOutUser();
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
