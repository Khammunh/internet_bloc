import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet/cubit/internet_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late InternetCubit internetCubit;
  @override
  void initState() {
    internetCubit = context.read<InternetCubit>();
    internetCubit.checkConnectivity();
    internetCubit.trackConnectivityChange();
    super.initState();
  }

  @override
  void dispose() {
    internetCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Internet"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetStatus>(
              builder: (context, state) {
                return state.status == ConnectivityStatus.connected? Text(
                  "Connected",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30,
                  ),
                ):Text(
                  "Not Connected",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
