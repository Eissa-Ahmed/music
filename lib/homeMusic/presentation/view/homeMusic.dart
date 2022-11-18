import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
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
        return Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/essa.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: cubit.assetsAudioPlayer.builderRealtimePlayingInfos(
                      builder: (context, realtimePlayingInfos) {
                    // cubit.nextAutoSongs(realtimePlayingInfos);
                    if (realtimePlayingInfos != null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          animationLottie(context),
                          partOfMusic(cubit, realtimePlayingInfos, context),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      cubit.nextPage();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> searchModalSheet(BuildContext context,
      ViewModelMusicCubit cubit, RealtimePlayingInfos realtimePlayingInfos) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/me.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    cubit.changeMusic(i, context);
                  },
                  child: Card(
                    elevation: 10.0,
                    color: cubit.singleSong != null
                        ? cubit.singleSong!.name == cubit.songsModel[i].name
                            ? Colors.white
                            : const Color(0xff011B28)
                        : realtimePlayingInfos.current!.index == i
                            ? Colors.white
                            : const Color(0xff011B28),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              cubit.puaseOrPlaySingleSong(context, i);
                            },
                            icon: Icon(
                              cubit.singleSong != null
                                  ? cubit.singleSong!.name ==
                                          cubit.songsModel[i].name
                                      ? cubit.assetsAudioPlayer.isPlaying.value
                                          ? FontAwesomeIcons.pause
                                          : FontAwesomeIcons.play
                                      : FontAwesomeIcons.play
                                  : realtimePlayingInfos.current!.index == i
                                      ? cubit.assetsAudioPlayer.isPlaying.value
                                          ? FontAwesomeIcons.pause
                                          : FontAwesomeIcons.play
                                      : FontAwesomeIcons.play,
                              color: cubit.singleSong != null
                                  ? cubit.singleSong!.name ==
                                          cubit.songsModel[i].name
                                      ? const Color(0xff011B28)
                                      : Colors.white
                                  : realtimePlayingInfos.current!.index == i
                                      ? const Color(0xff011B28)
                                      : Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            cubit.songsModel[i].name,
                            style: TextStyle(
                              color: cubit.singleSong != null
                                  ? cubit.singleSong!.name ==
                                          cubit.songsModel[i].name
                                      ? const Color(0xff011B28)
                                      : Colors.white
                                  : realtimePlayingInfos.current!.index == i
                                      ? const Color(0xff011B28)
                                      : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          cubit.singleSong != null
                              ? cubit.singleSong!.name ==
                                      cubit.songsModel[i].name
                                  ? Expanded(
                                      child: LottieBuilder.asset(
                                        "assets/images/play3.json",
                                        width: 40,
                                        height: 40,
                                      ),
                                    )
                                  : Container()
                              : realtimePlayingInfos.current!.index == i
                                  ? Expanded(
                                      child: LottieBuilder.asset(
                                        "assets/images/play3.json",
                                        width: 40,
                                        height: 40,
                                      ),
                                    )
                                  : Container(),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: cubit.songsModel.length,
            ),
          ),
        );
      },
    );
  }

  LottieBuilder animationLottie(BuildContext context) {
    return LottieBuilder.asset(
      "assets/images/play.json",
      width: MediaQuery.of(context).size.width,
    );
  }

  Column partOfMusic(ViewModelMusicCubit cubit,
      RealtimePlayingInfos realtimePlayingInfos, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          realtimePlayingInfos.current == null
              ? "00:00"
              : "${realtimePlayingInfos.current!.audio.audio.metas.artist}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        linearMusic(cubit, realtimePlayingInfos, context),
        const SizedBox(
          height: 20,
        ),
        iconsController(cubit, context, realtimePlayingInfos),
      ],
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

  Stack iconsController(ViewModelMusicCubit cubit, BuildContext context,
      RealtimePlayingInfos realtimePlayingInfos) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  cubit.previousSong();
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
                  cubit.nextSong();
                },
                icon: const Icon(
                  Icons.skip_next,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              searchModalSheet(context, cubit, realtimePlayingInfos);
            },
            icon: const Icon(
              FontAwesomeIcons.list,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
