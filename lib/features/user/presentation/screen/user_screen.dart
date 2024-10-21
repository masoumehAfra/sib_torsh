import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../core/utils/static/static_data.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';
import '../widget/add_user.dart';
import '../widget/user_item_card.dart';


// Step one !!!
class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {


  @override
  void initState() {
    super.initState();
    GetIt.I.get<UserCubit>().userList();
    // Step local !!!
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async{

            await showDialog(
            context: context,
            builder: (BuildContext context) =>
             LogoutDialog());
          },
          child:const Icon(Icons.add),

        ),
        body: BlocBuilder<UserCubit, UserState>(
          bloc: GetIt.I.get<UserCubit>(),
          builder: ((context, state) {
            if (state is ContentLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: StaticData.appPrimaryColor,
                ),
              );
            } else if (state is ContentLoaded) {

              return Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child:ListView.builder(
                    itemCount:state.contentList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        UserItemCard(
                          entity: state.contentList[index],
                        )),
              );
            } else if (state is ContentError) {
              return Container(
                width: double.infinity,
                color: StaticData.greyColor_1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ارتباط برقرار نشد",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "لطفا از وصل بودن اینترنت مطمئن شوید",
                      style: TextStyle(
                          color: StaticData.greyColor_6, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        GetIt.I.get<UserCubit>().emptyTask();
                        GetIt.I.get<UserCubit>().userList();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          color: StaticData.appPrimaryColor,
                          borderRadius: BorderRadius.circular(4),
                          // border: Border.all(color: StaticData.mediumBlueColor,width: 1.5)
                        ),
                        child: const Text(
                          "تلاش دوباره",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
        ),
      ),
    ));
  }
}
