import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sib_torsh/features/user/domain/use_case/add_user_use_case.dart';
import '../../../../core/utils/static/static_data.dart';
import '../../domain/use_case/user_use_case.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserUseCase useCase;
  AddUserUseCase addUserUseCase;

  UserCubit({required this.useCase,required this.addUserUseCase}) : super(ContentLoading());

  Future<void> userList() async {
    final result = await useCase();
    result.fold((error) => emit(ContentError()),
        (data) => emit(ContentLoaded(contentList: data)));
  }

  Future<void> emptyTask() async {
    emit(ContentLoading());
  }

  Future<void> addUser({required firstName,required lastName}) async{
    if(state is ContentLoaded){

      var temp= state as ContentLoaded;
      final result = await addUserUseCase(firstName: firstName,lastName: lastName);
      result.fold((error) => emit(ContentError()),
              (data) async{

                Fluttertoast.showToast(
                    msg: "$firstName $lastName با موفقیت اضافه شد",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: StaticData.snackBarColor,
                    textColor: Colors.black,
                    fontSize: 16.0);

                emit(ContentLoaded(contentList: temp.contentList));
              });

    }

  }
}
