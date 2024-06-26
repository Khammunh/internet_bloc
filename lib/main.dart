import 'package:flutter/material.dart';
import 'package:internet/cubit/internet_cubit.dart';
import 'package:internet/home_Page.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test internet',
      debugShowCheckedModeBanner: false,theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),useMaterial3: true
      ),
     home: BlocProvider<InternetCubit>(
      create: (context) => InternetCubit(),
      child: const HomePage(),
     ),
    );
  }
}