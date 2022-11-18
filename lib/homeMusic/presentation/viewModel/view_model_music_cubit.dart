import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music/homeMusic/data/quranModel.dart';
import 'package:music/homeMusic/data/songsModel.dart';
import 'package:music/homeMusic/presentation/view/homeMusic.dart';
import 'package:music/homeMusic/presentation/view/homeQuran.dart';
import 'package:music/homeMusic/presentation/view/search.dart';

part 'view_model_music_state.dart';

class ViewModelMusicCubit extends Cubit<ViewModelMusicState> {
  ViewModelMusicCubit() : super(ViewModelMusicInitial());

  static ViewModelMusicCubit get(context) => BlocProvider.of(context);

  //Var
  late AssetsAudioPlayer assetsAudioPlayer;
  late AssetsAudioPlayer assetsQuranPlayer;
  SongsModel? singleSong;
  PageController pageController = PageController();

  //List
  List<SongsModel> songsModel = [
    SongsModel(
      song: "assets/songs/1.mp3",
      image: "assets/images/me2.jpg",
      name: "احمد سعد عليكي عيون",
    ),
    SongsModel(
      song: "assets/songs/2.mp3",
      image: "assets/images/me3.jpg",
      name: "اغنية احمد خالد - رسيني",
    ),
    SongsModel(
      song: "assets/songs/3.mp3",
      image: "assets/images/me.jpg",
      name: "اغنية احمد سعد - وسع وسع",
    ),
    SongsModel(
      song: "assets/songs/4.mp3",
      image: "assets/images/me2.jpg",
      name: "اغنية احمد كامل - 9 أيام",
    ),
    SongsModel(
      song: "assets/songs/5.mp3",
      image: "assets/images/me3.jpg",
      name: "اغنية احمد كامل - أنا رايح",
    ),
    SongsModel(
      song: "assets/songs/6.mp3",
      image: "assets/images/me.jpg",
      name: "اغنية احمد كامل - جاوبنا ياليل",
    ),
    SongsModel(
      song: "assets/songs/7.mp3",
      image: "assets/images/me3.jpg",
      name: "اغنية احمد كامل - قولي",
    ),
    SongsModel(
      song: "assets/songs/8.mp3",
      image: "assets/images/me2.jpg",
      name: "اغنية احمد كامل - مبقتش اخاف من الليل",
    ),
    SongsModel(
      song: "assets/songs/9.mp3",
      image: "assets/images/me.jpg",
      name: "اغنية احمد كامل - مراسيل",
    ),
    SongsModel(
      song: "assets/songs/10.mp3",
      image: "assets/images/me3.jpg",
      name: "اغنية احمد كامل - ياليل",
    ),
    SongsModel(
      song: "assets/songs/11.mp3",
      image: "assets/images/me2.jpg",
      name: "اغنية عمرو دياب - دايماً في بالي",
    ),
    SongsModel(
      song: "assets/songs/12.mp3",
      image: "assets/images/me2.jpg",
      name: "اغنية عمرو دياب - قصاد عيني",
    ),
    SongsModel(
      song: "assets/songs/13.mp3",
      image: "assets/images/me2.jpg",
      name: "اغنية عمرو دياب - لفيتها بلاد",
    ),
    SongsModel(
      song: "assets/songs/14.mp3",
      image: "assets/images/me.jpg",
      name: "اغنية مسلم - اتنسيت",
    ),
    SongsModel(
      song: "assets/songs/15.mp3",
      image: "assets/images/me3.jpg",
      name: "اغنية مسلم - مابهربش",
    ),
    SongsModel(
      song: "assets/songs/16.mp3",
      image: "assets/images/me.jpg",
      name: "القريب منك بعيد",
    ),
    SongsModel(
      song: "assets/songs/17.mp3",
      image: "assets/images/me3.jpg",
      name: "عيون القلب",
    ),
    SongsModel(
      song: "assets/songs/18.mp3",
      image: "assets/images/me.jpg",
      name: "نور الدين الطيار - عيونك السود",
    ),
    SongsModel(
      song: "assets/songs/19.mp3",
      image: "assets/images/me2.jpg",
      name: "نور الدين الطيار - ليله من الليالي",
    ),
    SongsModel(
      song: "assets/songs/20.mp3",
      image: "assets/images/me2.jpg",
      name: "نور الدين مرايتي",
    ),
    SongsModel(
      song: "assets/songs/21.mp3",
      image: "assets/images/me.jpg",
      name: "نور الدين ملكة زماني",
    ),
  ];
  List<QuranModel> quranModel = [
    QuranModel(
      image: "assets/images/me.jpg",
      name: "سورة - أل عمران",
      quran: "assets/quran/1.mp3",
    ),
    QuranModel(
      image: "assets/images/me2.jpg",
      name: "سورة - البقرة",
      quran: "assets/quran/2.mp3",
    ),
    QuranModel(
      image: "assets/images/me3.jpg",
      name: "سورة - الجن",
      quran: "assets/quran/3.mp3",
    ),
    QuranModel(
      image: "assets/images/me.jpg",
      name: "سورة - المسد",
      quran: "assets/quran/4.mp3",
    ),
    QuranModel(
      image: "assets/images/me2.jpg",
      name: "سورة - المعارج",
      quran: "assets/quran/5.mp3",
    ),
    QuranModel(
      image: "assets/images/me3.jpg",
      name: "سورة - النساء",
      quran: "assets/quran/6.mp3",
    ),
    QuranModel(
      image: "assets/images/me.jpg",
      name: "سورة - تبارك",
      quran: "assets/quran/7.mp3",
    ),
    QuranModel(
      image: "assets/images/me.jpg",
      name: "سورة - نوح",
      quran: "assets/quran/8.mp3",
    ),
  ];

  List<Widget> pages = [
    const HomeMusic(),
    const HomeQuran(),
  ];

  //Fun
  init() async {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsQuranPlayer = AssetsAudioPlayer();
    if (singleSong != null) {
      await assetsAudioPlayer.open(
        autoStart: true,
        loopMode: LoopMode.single,
        showNotification: true,
        playInBackground: PlayInBackground.enabled,
        Audio(
          singleSong!.song,
          metas: Metas(
            artist: singleSong!.name,
            image: MetasImage.asset(singleSong!.image),
          ),
        ),
      );
    } else {
      await assetsAudioPlayer.open(
        playInBackground: PlayInBackground.enabled,
        showNotification: true,
        Playlist(audios: [
          Audio(
            songsModel[0].song,
            metas: Metas(
              artist: songsModel[0].name,
              image: MetasImage.asset(songsModel[0].image),
            ),
          ),
          Audio(
            songsModel[1].song,
            metas: Metas(
              artist: songsModel[1].name,
              image: MetasImage.asset(songsModel[1].image),
            ),
          ),
          Audio(
            songsModel[2].song,
            metas: Metas(
              artist: songsModel[2].name,
              image: MetasImage.asset(songsModel[2].image),
            ),
          ),
          Audio(
            songsModel[3].song,
            metas: Metas(
              artist: songsModel[3].name,
              image: MetasImage.asset(songsModel[3].image),
            ),
          ),
          Audio(
            songsModel[4].song,
            metas: Metas(
              artist: songsModel[4].name,
              image: MetasImage.asset(songsModel[4].image),
            ),
          ),
          Audio(
            songsModel[5].song,
            metas: Metas(
              artist: songsModel[5].name,
              image: MetasImage.asset(songsModel[5].image),
            ),
          ),
          Audio(
            songsModel[6].song,
            metas: Metas(
              artist: songsModel[6].name,
              image: MetasImage.asset(songsModel[6].image),
            ),
          ),
          Audio(
            songsModel[7].song,
            metas: Metas(
              artist: songsModel[7].name,
              image: MetasImage.asset(songsModel[7].image),
            ),
          ),
          Audio(
            songsModel[8].song,
            metas: Metas(
              artist: songsModel[8].name,
              image: MetasImage.asset(songsModel[8].image),
            ),
          ),
          Audio(
            songsModel[9].song,
            metas: Metas(
              artist: songsModel[9].name,
              image: MetasImage.asset(songsModel[9].image),
            ),
          ),
          Audio(
            songsModel[10].song,
            metas: Metas(
              artist: songsModel[10].name,
              image: MetasImage.asset(songsModel[10].image),
            ),
          ),
          Audio(
            songsModel[11].song,
            metas: Metas(
              artist: songsModel[11].name,
              image: MetasImage.asset(songsModel[11].image),
            ),
          ),
          Audio(
            songsModel[12].song,
            metas: Metas(
              artist: songsModel[12].name,
              image: MetasImage.asset(songsModel[12].image),
            ),
          ),
          Audio(
            songsModel[13].song,
            metas: Metas(
              artist: songsModel[13].name,
              image: MetasImage.asset(songsModel[13].image),
            ),
          ),
          Audio(
            songsModel[14].song,
            metas: Metas(
              artist: songsModel[14].name,
              image: MetasImage.asset(songsModel[14].image),
            ),
          ),
          Audio(
            songsModel[15].song,
            metas: Metas(
              artist: songsModel[15].name,
              image: MetasImage.asset(songsModel[15].image),
            ),
          ),
          Audio(
            songsModel[16].song,
            metas: Metas(
              artist: songsModel[16].name,
              image: MetasImage.asset(songsModel[16].image),
            ),
          ),
          Audio(
            songsModel[17].song,
            metas: Metas(
              artist: songsModel[17].name,
              image: MetasImage.asset(songsModel[17].image),
            ),
          ),
          Audio(
            songsModel[18].song,
            metas: Metas(
              artist: songsModel[18].name,
              image: MetasImage.asset(songsModel[18].image),
            ),
          ),
          Audio(
            songsModel[19].song,
            metas: Metas(
              artist: songsModel[19].name,
              image: MetasImage.asset(songsModel[19].image),
            ),
          ),
          Audio(
            songsModel[20].song,
            metas: Metas(
              artist: songsModel[20].name,
              image: MetasImage.asset(songsModel[20].image),
            ),
          ),
        ]),
        autoStart: false,
        loopMode: LoopMode.playlist,
      );
    }

    await assetsQuranPlayer.open(
      autoStart: false,
      playInBackground: PlayInBackground.enabled,
      showNotification: true,
      Playlist(
        audios: [
          Audio(
            quranModel[0].quran,
            metas: Metas(
              artist: quranModel[0].name,
              image: MetasImage.asset(quranModel[0].image),
            ),
          ),
          Audio(
            quranModel[1].quran,
            metas: Metas(
              artist: quranModel[1].name,
              image: MetasImage.asset(quranModel[1].image),
            ),
          ),
          Audio(
            quranModel[2].quran,
            metas: Metas(
              artist: quranModel[2].name,
              image: MetasImage.asset(quranModel[2].image),
            ),
          ),
          Audio(
            quranModel[3].quran,
            metas: Metas(
              artist: quranModel[3].name,
              image: MetasImage.asset(quranModel[3].image),
            ),
          ),
          Audio(
            quranModel[4].quran,
            metas: Metas(
              artist: quranModel[4].name,
              image: MetasImage.asset(quranModel[4].image),
            ),
          ),
          Audio(
            quranModel[5].quran,
            metas: Metas(
              artist: quranModel[5].name,
              image: MetasImage.asset(quranModel[5].image),
            ),
          ),
          Audio(
            quranModel[6].quran,
            metas: Metas(
              artist: quranModel[6].name,
              image: MetasImage.asset(quranModel[6].image),
            ),
          ),
          Audio(
            quranModel[7].quran,
            metas: Metas(
              artist: quranModel[7].name,
              image: MetasImage.asset(quranModel[7].image),
            ),
          ),
        ],
      ),
    );
  }

  nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    if (assetsAudioPlayer.isPlaying.value) {
      assetsAudioPlayer.pause();
    }
    emit(ChangeCurrentIndexState());
  }

  previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    if (assetsQuranPlayer.isPlaying.value) {
      assetsQuranPlayer.pause();
    }
    emit(ChangeCurrentIndexState());
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  buildSearch(BuildContext context) async {
    await showSearch(
      context: context,
      delegate: SearchSong(),
      query: "",
    );
  }

  changeMusic(int i, BuildContext context) async {
    await assetsAudioPlayer.pause();
    singleSong = songsModel[i];
    await init();
    Navigator.of(context).pop();
    emit(ChangeMusicState());
  }

  nextSong() async {
    if (singleSong != null) {
      await assetsAudioPlayer.pause();
      int randomSong = Random().nextInt(songsModel.length);
      singleSong = songsModel[randomSong];
      init();
      emit(ChangeMusicState());
    } else {
      assetsAudioPlayer.next();
    }
  }

  nextQuran() {
    assetsQuranPlayer.next();
  }

  previousQuran() {
    assetsQuranPlayer.previous();
  }

  previousSong() async {
    if (singleSong != null) {
      await assetsAudioPlayer.pause();
      int randomSong = Random().nextInt(songsModel.length);
      singleSong = songsModel[randomSong];
      init();
      emit(ChangeMusicState());
    } else {
      assetsAudioPlayer.previous();
    }
  }

  puaseOrPlaySingleSong(BuildContext context, int i) async {
    if (singleSong != null) {
      if (singleSong!.name == songsModel[i].name) {
        if (assetsAudioPlayer.isPlaying.value) {
          await assetsAudioPlayer.pause();
          emit(PuaseSingleSongState());
        } else {
          await assetsAudioPlayer.play();
          emit(PlaySingleSongState());
        }
        Navigator.of(context).pop();
      } else {
        changeMusic(i, context);
      }
    } else {
      changeMusic(i, context);
    }
  }
  // nextAutoSongs(RealtimePlayingInfos realtimePlayingInfos) async {
  //   if (singleSong != null) {
  //     if (realtimePlayingInfos.currentPosition.inSeconds == 5) {
  //       await assetsAudioPlayer.pause();
  //       int randomSong = Random().nextInt(songsModel.length);
  //       singleSong = songsModel[randomSong];
  //       init();
  //       emit(ChangeMusicState());
  //     }
  //   }
  // }
}
