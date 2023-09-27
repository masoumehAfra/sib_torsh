import 'package:equatable/equatable.dart';
import '../../domain/entity/user_entity.dart';

abstract class UserState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ContentLoading extends UserState {}

class ContentLoaded extends UserState {
  final List<UserEntity> contentList;


  ContentLoaded({required this.contentList});

  @override
  // TODO: implement props
  List<Object?> get props => [contentList];
}

class ContentError extends UserState {}
