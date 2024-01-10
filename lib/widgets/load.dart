import 'package:flutter/material.dart';

class Load extends StatelessWidget {
  const Load({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: const SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
