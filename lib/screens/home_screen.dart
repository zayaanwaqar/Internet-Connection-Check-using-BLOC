import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/internet_bloc.dart';
import '../blocs/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text('Internet Connected');
            } else if (state is InternetLostState) {
              return const Text('Internet Lost');
            } else {
              return const Text('Loading');
            }
          },
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Lost'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
