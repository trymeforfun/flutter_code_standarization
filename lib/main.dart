import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_standardization/bloc/random/random_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => RandomBloc(),
    child: const MyWidget(),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  RandomBloc? _randomBloc = RandomBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _randomBloc?.add(GetRandomDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BlocBuilder(
            bloc: _randomBloc,
            builder: (context, state) {
              print("state is $state");
              if (state is RandomLoadingState) {
                return CircularProgressIndicator();
              }

              if (state is RandomSuccessState) {
                return Container(
                  height: 300,
                  width: 300,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(state.response.message ?? ""),
                    backgroundColor: Colors.transparent,
                  ),
                );
              } else {
                return Text("data failed");
              }
            },
          ),
        ),
        floatingActionButton: ElevatedButton.icon(
            onPressed: () {
              _randomBloc?.add(GetRandomDataEvent());
            },
            icon: Icon(Icons.refresh),
            label: Text("refresh")),
      ),
    );
  }
}
