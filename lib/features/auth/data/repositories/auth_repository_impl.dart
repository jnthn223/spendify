import 'package:fpdart/src/either.dart';
import 'package:spendify/features/auth/data/models/user.models.dart';
import 'package:spendify/features/auth/domain/entities/user.dart';
import 'package:spendify/core/error/exceptions.dart';
import 'package:spendify/core/error/failure.dart';
import 'package:spendify/features/auth/data/datasources/auth_remote.data_source.dart';
import 'package:spendify/features/auth/domain/repository/auth.repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> currentUser() {
    // TODO: implement currentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
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
}
