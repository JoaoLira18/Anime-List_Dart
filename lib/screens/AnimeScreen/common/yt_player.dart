import 'package:flutter/material.dart';

class HeaderItem extends StatefulWidget {
  final String image;

  const HeaderItem({super.key, required this.image});

  @override
  State<HeaderItem> createState() => _HeaderItemState();
}

class _HeaderItemState extends State<HeaderItem> {
  late bool loading = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Image.network(
            widget.image,
            fit: BoxFit.cover,
          )),
    );
  }
}
