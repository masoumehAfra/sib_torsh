import 'package:get_it/get_it.dart';

import 'core/network/api_provider.dart';
import 'features/user/data/data_source/user_data_source_impl.dart';
import 'features/user/data/repository/user_repository_impl.dart';
import 'features/user/domain/use_case/add_user_use_case.dart';
import 'features/user/domain/use_case/user_use_case.dart';
import 'features/user/presentation/cubit/user_cubit.dart';


void setupDependencies() {

  // Bloc
  GetIt.I.registerLazySingleton<UserCubit>(() => UserCubit(useCase: GetIt.I.get<UserUseCase>(),addUserUseCase:GetIt.I.get<AddUserUseCase>() ),);

  // Data Sources
  GetIt.I.registerLazySingleton<UserDataSourceImp>(
          () => UserDataSourceImp());

  // Repositories
  GetIt.I.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(dataSource:GetIt.I.get<UserDataSourceImp>() ));


  // Use Case
  GetIt.I.registerLazySingleton<UserUseCase>(() => UserUseCase(repository: GetIt.I.get<UserRepositoryImpl>()));
  GetIt.I.registerLazySingleton<AddUserUseCase>(() => AddUserUseCase(repository: GetIt.I.get<UserRepositoryImpl>()));

  /// Api Provider
  GetIt.I.registerLazySingleton<ApiProvider>(() => ApiProvider());

}