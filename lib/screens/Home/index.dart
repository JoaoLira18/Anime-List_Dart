import '../../widgets/header.dart';
import '../../widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:anilist/utils/strings.dart';
import 'package:anilist/screens/Home/view_model.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Header(
          clickable: true,
          viewModel: widget.viewModel,
        ),
        Section(
            animeData: widget.viewModel.topAnime,
            title: Strings.getString('top_anime')),
        Section(
            animeData: widget.viewModel.topManga,
            title: Strings.getString('top_manga')),
        Section(
            animeData: widget.viewModel.actualSeason,
            title: Strings.getString('season_now')),
      ]),
    );
  }
}
