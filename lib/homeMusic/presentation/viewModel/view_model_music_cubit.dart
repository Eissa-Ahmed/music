import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'view_model_music_state.dart';

class ViewModelMusicCubit extends Cubit<ViewModelMusicState> {
  ViewModelMusicCubit() : super(ViewModelMusicInitial());

  static ViewModelMusicCubit get(context) => BlocProvider.of(context);

  //Var
  late AssetsAudioPlayer assetsAudioPlayer;

  //List
  List<String> songs = [
    "assets/songs/1.mp3",
    "assets/songs/2.mp3",
    "assets/songs/3.mp3",
    "assets/songs/4.mp3",
    "assets/songs/5.mp3",
    "assets/songs/6.mp3",
    "assets/songs/7.mp3",
    "assets/songs/8.mp3",
    "assets/songs/9.mp3",
    "assets/songs/10.mp3",
    "assets/songs/11.mp3",
    "assets/songs/12.mp3",
    "assets/songs/13.mp3",
    "assets/songs/14.mp3",
    "assets/songs/15.mp3",
    "assets/songs/16.mp3",
    "assets/songs/17.mp3",
    "assets/songs/18.mp3",
    "assets/songs/19.mp3",
    "assets/songs/20.mp3",
    "assets/songs/21.mp3",
  ];
  List<String> songsStrings = [
    "احمد سعد عليكي عيون",
    "اغنية احمد خالد - رسيني",
    "اغنية احمد سعد - وسع وسع",
    "اغنية احمد كامل - 9 أيام",
    "اغنية احمد كامل - أنا رايح",
    "اغنية احمد كامل - جاوبنا ياليل",
    "اغنية احمد كامل - قولي",
    "اغنية احمد كامل - مبقتش اخاف من الليل",
    "اغنية احمد كامل - مراسيل",
    "اغنية احمد كامل - ياليل",
    "اغنية عمرو دياب - دايماً في بالي",
    "اغنية عمرو دياب - قصاد عيني",
    "اغنية عمرو دياب - لفيتها بلاد",
    "اغنية مسلم - اتنسيت",
    "اغنية مسلم - مابهربش",
    "القريب منك بعيد",
    "عيون القلب",
    "نور الدين الطيار - عيونك السود",
    "نور الدين الطيار - ليله من الليالي",
    "نور الدين مرايتي",
    "نور الدين ملكة زماني",
  ];

  //Fun
  init() async {
    assetsAudioPlayer = AssetsAudioPlayer();

    await assetsAudioPlayer.open(
      playInBackground: PlayInBackground.enabled,
      showNotification: true,
      Playlist(audios: [
        Audio(
          songs[0],
          metas: Metas(
            artist: songsStrings[0],
          ),
        ),
        Audio(
          songs[1],
          metas: Metas(
            artist: songsStrings[1],
          ),
        ),
        Audio(
          songs[2],
          metas: Metas(
            artist: songsStrings[2],
          ),
        ),
        Audio(
          songs[3],
          metas: Metas(
            artist: songsStrings[3],
          ),
        ),
        Audio(
          songs[4],
          metas: Metas(
            artist: songsStrings[4],
          ),
        ),
        Audio(
          songs[5],
          metas: Metas(
            artist: songsStrings[5],
          ),
        ),
        Audio(
          songs[6],
          metas: Metas(
            artist: songsStrings[6],
          ),
        ),
        Audio(
          songs[7],
          metas: Metas(
            artist: songsStrings[7],
          ),
        ),
        Audio(
          songs[8],
          metas: Metas(
            artist: songsStrings[8],
          ),
        ),
        Audio(
          songs[9],
          metas: Metas(
            artist: songsStrings[9],
          ),
        ),
        Audio(
          songs[10],
          metas: Metas(
            artist: songsStrings[10],
          ),
        ),
        Audio(
          songs[11],
          metas: Metas(
            artist: songsStrings[11],
          ),
        ),
        Audio(
          songs[12],
          metas: Metas(
            artist: songsStrings[12],
          ),
        ),
        Audio(
          songs[13],
          metas: Metas(
            artist: songsStrings[13],
          ),
        ),
        Audio(
          songs[14],
          metas: Metas(
            artist: songsStrings[14],
          ),
        ),
        Audio(
          songs[15],
          metas: Metas(
            artist: songsStrings[15],
          ),
        ),
        Audio(
          songs[16],
          metas: Metas(
            artist: songsStrings[16],
          ),
        ),
        Audio(
          songs[17],
          metas: Metas(
            artist: songsStrings[17],
          ),
        ),
        Audio(
          songs[18],
          metas: Metas(
            artist: songsStrings[18],
          ),
        ),
        Audio(
          songs[19],
          metas: Metas(
            artist: songsStrings[19],
          ),
        ),
        Audio(
          songs[20],
          metas: Metas(
            artist: songsStrings[20],
          ),
        ),
      ]),
      autoStart: false,
      loopMode: LoopMode.playlist,
    );
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }
}
