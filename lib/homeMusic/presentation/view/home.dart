import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/homeMusic/presentation/viewModel/view_model_music_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ViewModelMusicCubit.get(context);

    return BlocConsumer<ViewModelMusicCubit, ViewModelMusicState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: PageView.builder(
            controller: cubit.pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (i) {
              if (i == 0) {
                cubit.assetsQuranPlayer.pause();
              }
              if (i == 1) {
                cubit.assetsAudioPlayer.pause();
              }
            },
            itemBuilder: (context, i) {
              return cubit.pages[i];
            },
            itemCount: 2,
          ),
        );
      },
    );
  }
}
