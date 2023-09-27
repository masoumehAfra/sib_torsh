import 'package:dartz/dartz.dart';
import '../../../../../../core/exception/server_exception.dart';
import '../../../../core/exception/failures.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/user_data_source.dart';
import '../model/user_model.dart';

class UserRepositoryImpl extends UserRepository {
  UserDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<UserEntity>>> userList() async {
    try {
      final response = await dataSource.userList();

      final temp = response.data["data"] as List;
      final List<UserEntity> testList =
          temp.map((e) => ContentModel.fromJson(e)).toList();
      return Right(testList);
    } on ServerException catch (error) {
      return Left(ServerFailure(error));
    }
  }

  @override
  Future<Either<Failure, String>> addUser({required firstName,required lastName})async {
      try {
        final response = await dataSource.addUser(firstName: firstName,lastName: lastName);

        print("................add $response");
        return Right("ok");
      } on ServerException catch (error) {
        return Left(ServerFailure(error));
      }
  }

}
