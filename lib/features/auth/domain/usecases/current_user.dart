import 'package:fpdart/fpdart.dart';
import 'package:spendify/core/error/failure.dart';
import 'package:spendify/core/common/entities/user.dart';
import 'package:spendify/core/usercase/usecase.dart';
import 'package:spendify/features/auth/domain/repository/auth.repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
