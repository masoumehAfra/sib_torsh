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


  // Test Local aa
  // This Local bb
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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
