import 'package:dartz/dartz.dart';
import '../../../../core/exception/failures.dart';
import '../entity/user_entity.dart';
import '../repository/user_repository.dart';

class UserUseCase {
  UserRepository repository;
  UserUseCase({required this.repository});

  Future<Either<Failure, List<UserEntity>>> call() async {
    return await repository.userList();
  }
}
