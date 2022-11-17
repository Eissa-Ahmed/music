import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../viewModel/view_model_music_cubit.dart';

class HomeMusic extends StatelessWidget {
  const HomeMusic({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ViewModelMusicCubit.get(context);
    return BlocConsumer<ViewModelMusicCubit, ViewModelMusicState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/essa.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: cubit.assetsAudioPlayer.builderRealtimePlayingInfos(
                  builder: (context, realtimePlayingInfos) {
                if (realtimePlayingInfos != null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      linearMusic(cubit, realtimePlayingInfos, context),
                      const SizedBox(
                        height: 20,
                      ),
                      iconsController(cubit),
                    ],
                  );
                } else {
                  return Container();
                }
              }),
            ),
          ),
        );
      },
    );
  }

  Row linearMusic(ViewModelMusicCubit cubit,
      RealtimePlayingInfos realtimePlayingInfos, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cubit.getTimeString(realtimePlayingInfos.currentPosition.inSeconds),
          style: const TextStyle(color: Colors.white),
        ),
        LinearPercentIndicator(
          barRadius: const Radius.circular(12),
          width: MediaQuery.of(context).size.width * 0.7,
          lineHeight: 6.0,
          percent: realtimePlayingInfos.currentPosition.inSeconds /
              realtimePlayingInfos.duration.inSeconds,
          backgroundColor: Colors.grey.shade600,
          progressColor: Colors.white,
        ),
        Text(
          cubit.getTimeString(realtimePlayingInfos.duration.inSeconds),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Padding iconsController(ViewModelMusicCubit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              cubit.assetsAudioPlayer.previous();
            },
            icon: const Icon(
              Icons.skip_previous,
              color: Colors.white,
              size: 40,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                cubit.assetsAudioPlayer.playOrPause();
              },
              icon: Icon(
                cubit.assetsAudioPlayer.isPlaying.value
                    ? Icons.pause_circle_filled_outlined
                    : Icons.play_circle_fill_outlined,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              cubit.assetsAudioPlayer.next();
            },
            icon: const Icon(
              Icons.skip_next,
              color: Colors.white,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
