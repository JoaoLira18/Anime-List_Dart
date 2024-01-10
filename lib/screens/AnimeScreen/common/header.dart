import '../../../models/anime.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderAnime extends StatefulWidget {
  final DataAnime data;

  HeaderAnime({super.key, required this.data});

  @override
  State<HeaderAnime> createState() => _HeaderAnimeState();
}

class _HeaderAnimeState extends State<HeaderAnime> {
  late final DataAnime animeData = widget.data;

  @override
  Widget build(BuildContext context) {
    final image = animeData.images.jpg.largeImageUrl.toString();

    return SizedBox(
      height: 400,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
        child: Container(
            color: Theme.of(context).cardColor,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.topRight))),
              ],
            )),
      ),
    );
  }
}
