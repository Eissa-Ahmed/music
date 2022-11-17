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
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3",
  ];

  //Fun
  init() async {
    assetsAudioPlayer = AssetsAudioPlayer();

    await assetsAudioPlayer.open(
      Playlist(audios: [
        Audio.network(songs[0]),
        Audio.network(songs[1]),
        Audio.network(songs[2]),
        Audio.network(songs[3]),
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
