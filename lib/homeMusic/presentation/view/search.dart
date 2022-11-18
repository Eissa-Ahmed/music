import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:music/homeMusic/data/songsModel.dart';
import 'package:music/homeMusic/presentation/viewModel/view_model_music_cubit.dart';

class SearchSong extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(FontAwesomeIcons.x),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var cubit = ViewModelMusicCubit.get(context);
    List<SongsModel> songsModel = cubit.songsModel.where((e) {
      return e.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemBuilder: (context, i) {
        return songsModel.isEmpty
            ? Container()
            : Card(
                elevation: 10.0,
                color: const Color(0xff023047),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  children: [
                    const Icon(FontAwesomeIcons.play),
                    Text(
                      songsModel[i].name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
      },
      itemCount: songsModel.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: LottieBuilder.asset("assets/images/search.json"),
    );
  }
}
