import 'package:equatable/equatable.dart';

abstract class UserEntity extends Equatable {
  final int userId;
  final String firstName;
  final String lastName;


  const UserEntity({required this.userId, required this.firstName,required this.lastName});

  @override
  // TODO: implement props
  List<Object?> get props => [userId, firstName,lastName];
}
