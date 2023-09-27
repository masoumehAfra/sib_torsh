import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/utils/static/static_data.dart';
import '../cubit/user_cubit.dart';


class LogoutDialog extends StatelessWidget {
   LogoutDialog({Key? key}) : super(key: key);



  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //height: cafe == 1 ?620:520,
                width: 350,
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                decoration:  BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    ), ],),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextFormField(
                        controller: _firstNameController,
                        textInputAction:
                        TextInputAction.next,
                        textAlign: TextAlign.right,
                        autofocus: true,
                        decoration:  InputDecoration(
                          labelText: 'نام',
                          labelStyle:const TextStyle(
                              fontSize: 14,
                              fontFamily:
                              StaticData
                                  .fontMedium),

                          border:
                          const OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.person,
                            color: StaticData
                                .greyColor_2,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        textInputAction:
                        TextInputAction.done,
                        textAlign: TextAlign.right,
                        autofocus: false,
                        decoration:  InputDecoration(
                          labelText: 'نام خانوادگی',
                          labelStyle:const TextStyle(
                              fontSize: 14,
                              fontFamily:
                              StaticData
                                  .fontMedium),
                          border:
                          const OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.person_pin_rounded,
                            color: StaticData
                                .greyColor_2,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 25,
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            child: Container(
                              width: 110,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: StaticData.appPrimaryColor,
                                  borderRadius: BorderRadius.circular(8)),
                              alignment: Alignment.center,
                              child: const Text("Add",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ),
                            onTap: () async {

                              if(_firstNameController.value.text.length >1 && _lastNameController.value.text.length>1){
                                GetIt.I.get<UserCubit>().addUser(firstName:  _firstNameController.value.text,lastName: _lastNameController.value.text);
                                Navigator.pop(context);
                              }else{
                                Fluttertoast.showToast(
                                    msg: "نام و نام خانوادگی را به درستی وارد کنید",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: StaticData.snackBarColor,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              }



                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: 110,
                              height: 45,
                              alignment: Alignment.center,
                              child: const Text("Cancel",
                                  style: TextStyle(
                                    //color: StaticData.orangeTxtColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ]),
              )
            ],
          ),
       ));
  }
}
