import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../view_model.dart';
import '../../../widgets/load.dart';
import '../../../utils/strings.dart';

class ToggleButton extends StatefulWidget {
  final int malId;
  final AnimeViewModel viewModel;

  const ToggleButton({super.key, required this.viewModel, required this.malId});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isExpanded = false;
  final List<bool> _selected = <bool>[true, false, false];

  bottomListOption() {
    if (_selected[0]) {
      return reviews();
    } else if (_selected[1]) {
      return recommended();
    } else {
      return news();
    }
  }

  _launchURL(String url) async {
    var urlToUri = Uri.parse(url);
    if (await canLaunchUrl(urlToUri)) {
      await launchUrl(urlToUri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
          direction: Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < _selected.length; i++) {
                _selected[i] = i == index;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.red[700],
          selectedColor: Colors.white,
          fillColor: Colors.pink[200],
          color: Colors.red[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          isSelected: _selected,
          children: [Text('Reviews'), Text('Similar'), Text('News')],
        ),
        bottomListOption(),
      ],
    );
  }

  FutureBuilder<dynamic> news() {
    return FutureBuilder(
      future: widget.viewModel.getAnimeNews(widget.malId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data.length == 0
              ? SizedBox(
                  height: 200,
                  child: Center(child: Text(Strings.getString('no_data'))))
              : SizedBox(
                  height: 280,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 10), // Adjust the separator width
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data[index];
                      var image = data.images.jpg.imageUrl;
                      print('print: $data.forumUrl}');

                      return Card(
                        child: ListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(image.toString(),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            title: TextButton(
                              onPressed: () =>
                                  _launchURL(snapshot.data[index].forumUrl),
                              child: Text(data.title,
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                            )),
                      );
                    },
                  ),
                );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Load();
        } else {
          return Text(Strings.getString('no_data'));
        }
      },
    );
  }

  FutureBuilder<dynamic> recommended() {
    return FutureBuilder(
      future: widget.viewModel.getRecommendation(widget.malId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data.length == 0
              ? SizedBox(
                  height: 200,
                  child: Center(child: Text(Strings.getString('no_data'))))
              : SizedBox(
                  height: 270,
                  child: GridView.builder(
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, int index) {
                      return Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            snapshot.data[index].entry.images.jpg.imageUrl
                                .toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Load();
        } else {
          return Text(Strings.getString('no_data'));
        }
      },
    );
  }

  FutureBuilder<List> reviews() {
    return FutureBuilder(
      future: widget.viewModel.getAnimeReviews(widget.malId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data.length == 0
              ? SizedBox(
                  height: 200,
                  child: Center(child: Text(Strings.getString('no_data'))))
              : SizedBox(
                  height: 350,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      // var data = snapshot.data[index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            _showModal(
                              context,
                              snapshot.data[index].review,
                              snapshot.data[index].user.username,
                              snapshot.data[index].user.images.jpg.imageUrl,
                            );
                          },
                          leading: SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                  snapshot.data[index].user.images.jpg.imageUrl
                                      .toString(),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          title: Text(snapshot.data[index].user.username),
                          subtitle: Text(
                            snapshot.data[index].review,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Load();
        } else {
          return Text(Strings.getString('no_data'));
        }
      },
    );
  }

  void _showModal(
      BuildContext context, String review, String username, String userImage) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
            padding: EdgeInsets.all(20),
            height: 450,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(userImage.toString(),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(username, style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    review,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
