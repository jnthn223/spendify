import 'package:fpdart/fpdart.dart';
import 'package:spendify/core/error/failure.dart';
import 'package:spendify/core/usercase/usecase.dart';
import 'package:spendify/core/common/entities/user.dart';
import 'package:spendify/features/auth/domain/repository/auth.repository.dart';

class UserSignIn implements UseCase<User, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.signInWithEmailPassword(
        email: params.email, password: params.password);
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });
}
