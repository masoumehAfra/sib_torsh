import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sib_torsh/service_locator.dart';

import 'features/user/domain/use_case/add_user_use_case.dart';
import 'features/user/domain/use_case/user_use_case.dart';
import 'features/user/presentation/cubit/user_cubit.dart';
import 'features/user/presentation/screen/user_screen.dart';


void main() {

  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(
            create: (context) =>
                UserCubit(useCase: GetIt.I.get<UserUseCase>(),addUserUseCase:GetIt.I.get<AddUserUseCase>())),

      ],
      child: MaterialApp(
        title: 'Afra',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UserScreen(),
      )
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
