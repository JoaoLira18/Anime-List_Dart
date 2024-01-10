import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anilist/models/anime.dart';
import 'package:anilist/screens/AnimeScreen/view_model.dart';

import 'common/header.dart';
// import '../../models/news.dart';
// import '../../widgets/load.dart';
// import '../../models/reviews.dart';
import 'common/toggle_button.dart';

class AnimeScreen extends StatefulWidget {
  final DataAnime data;

  const AnimeScreen({super.key, required this.data});

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  late String youtubeId;
  bool isExpanded = false;
  late final DataAnime item;

  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  final viewModel = AnimeViewModel();

  @override
  void initState() {
    super.initState();
    item = widget.data;
    youtubeId = item.trailer.youtubeId;
    _controller = YoutubePlayerController(
      initialVideoId: youtubeId,
      flags: const YoutubePlayerFlags(
        mute: true,
        autoPlay: true,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            animeHeader(),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  title(),
                  miniCardSection(),
                  synopsis(),
                  Divider(),
                  ToggleButton(viewModel: viewModel, malId: widget.data.malId),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox animeHeader() {
    return SizedBox(
      child: youtubeId == ""
          ? HeaderAnime(
              data: widget.data,
            )
          : YoutubePlayerBuilder(
              onExitFullScreen: () {
                SystemChrome.setPreferredOrientations(DeviceOrientation.values);
              },
              player: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: false,
                progressIndicatorColor: Colors.blueAccent,
              ),
              builder: (context, player) => player),
    );
  }

  Column synopsis() {
    bool synopsisLength = item.synopsis.length < 260 ? true : false;
    return Column(
      children: [
        Text(item.synopsis.substring(
            0, isExpanded || synopsisLength ? item.synopsis.length : 260)),
        TextButton(
            onPressed: () => {
                  setState(
                    () => isExpanded = !isExpanded,
                  )
                },
            child: Text(isExpanded ? "Show less" : "Show more"))
      ],
    );
  }

  SizedBox miniCardSection() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              miniCard(item.year, ''),
              SizedBox(width: 5),
              miniCard(item.rating, ''),
              SizedBox(width: 5),
              miniCard(item.episodes, 'EP'),
              SizedBox(width: 5),
              miniCard(item.status, ''),
            ],
          ),
        ),
      ),
    );
  }

  Text title() {
    return Text(
      widget.data.titleEnglish.toString(),
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      maxLines: 2,
    );
  }

  Container miniCard(dynamic text, String? additionalText) {
    return text == null
        ? Container(
            width: 0,
            height: 0,
            color: Colors.transparent,
          )
        : Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: Expanded(
                  child: Text('${text.toString()} $additionalText',
                      style: TextStyle(color: Colors.white))),
            ),
          );
  }
}
