import 'package:fpdart/fpdart.dart';
import 'package:spendify/core/error/failure.dart';
import 'package:spendify/core/usercase/usecase.dart';
import 'package:spendify/features/auth/domain/repository/auth.repository.dart';

class UserSignOut implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  UserSignOut(this.authRepository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.signOutUser();
  }
}
