import 'package:dartz/dartz.dart';
import '../../../../core/exception/failures.dart';
import '../repository/user_repository.dart';

class AddUserUseCase {
  UserRepository repository;
  AddUserUseCase({required this.repository});

  Future<Either<Failure, String>> call({required firstName,required lastName}) async {
    return await repository.addUser(firstName: firstName,lastName: lastName);
  }
}