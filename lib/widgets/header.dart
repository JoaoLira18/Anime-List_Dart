import 'package:anilist/models/anime.dart';
import 'package:anilist/widgets/load.dart';

import 'package:flutter/material.dart';
import '../screens/Home/view_model.dart';
import '../utils/strings.dart';

class Header extends StatefulWidget {
  final bool clickable;
  final HomeViewModel viewModel;

  Header({super.key, this.clickable = false, required this.viewModel});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: headerBuilder()),
    );
  }

  FutureBuilder<DataAnime> headerBuilder() {
    return FutureBuilder(
      future: widget.viewModel.getRandomAnime(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
              color: Theme.of(context).cardColor,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    snapshot.data.images.jpg.largeImageUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.transparent],
                              begin: Alignment.topRight))),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: SizedBox(
                        width: 370,
                        height: 75,
                        child: Text(
                          snapshot.data.title.toString(),
                          maxLines: 2,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 15)
                            ],
                          ),
                        )),
                  )
                ],
              ));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Load();
        } else if (snapshot.hasError) {
          return Text(Strings.getString('error'));
        } else {
          return Text(Strings.getString('no_data'));
        }
      },
    );
  }
}
