import 'dart:async';

import 'package:flutter/material.dart';
import 'package:anilist/widgets/load.dart';
import 'package:anilist/models/anime.dart';
import 'package:anilist/screens/AnimeScreen/index.dart';

class Section extends StatefulWidget {
  final Future<List<DataAnime>>? animeData;
  final Future<List<DataAnime>>? mangaData;
  late final String title;

  Section({super.key, this.animeData, this.mangaData, required this.title});

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  List<DataAnime> sectionList = [];
  late bool loading = true;

  @override
  void initState() {
    if (widget.animeData != null) {
      widget.animeData?.then((anime) => {
            setState(() {
              sectionList = anime;
              loading = false;
            })
          });
    } else if (widget.mangaData != null) {
      widget.mangaData?.then((manga) => {
            setState(() {
              sectionList = manga;
              loading = false;
            })
          });
    }

    if (loading == true) {
      Timer(Duration(seconds: 15), () {
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 5, top: 20, bottom: 5),
            child: Text(widget.title,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: 150,
            child: loading
                ? Load()
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: sectionList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) {
                      return Card(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AnimeScreen(
                                                data: sectionList[index],
                                              )))
                                },
                                child: Image.network(sectionList[index]
                                    .images
                                    .jpg
                                    .imageUrl
                                    .toString()),
                              )));
                    })),
      ],
    );
  }
}
