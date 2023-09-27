import 'package:dartz/dartz.dart';
import '../../../../core/exception/failures.dart';
import '../entity/user_entity.dart';

abstract class UserRepository{
  Future<Either<Failure,List<UserEntity>>> userList();
  Future<Either<Failure,String>> addUser({required firstName,required lastName});
}