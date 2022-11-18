part of 'view_model_music_cubit.dart';

@immutable
abstract class ViewModelMusicState {}

class ViewModelMusicInitial extends ViewModelMusicState {}

class ChangeMusicState extends ViewModelMusicState {}

class PuaseSingleSongState extends ViewModelMusicState {}

class PlaySingleSongState extends ViewModelMusicState {}

class ChangeCurrentIndexState extends ViewModelMusicState {}
