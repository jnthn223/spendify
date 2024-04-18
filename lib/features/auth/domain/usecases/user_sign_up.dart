import 'package:fpdart/fpdart.dart';
import 'package:spendify/core/error/failure.dart';
import 'package:spendify/core/usercase/usecase.dart';
import 'package:spendify/features/auth/domain/entities/user.dart';
import 'package:spendify/features/auth/domain/repository/auth.repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
