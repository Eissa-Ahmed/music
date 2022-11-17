import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/homeMusic/presentation/view/homeMusic.dart';
import 'package:music/homeMusic/presentation/viewModel/view_model_music_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewModelMusicCubit()..init(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeMusic(),
      ),
    );
  }
}
