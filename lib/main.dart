// import 'package:anilist/screens/AnimeScreen/anime.dart';
import 'package:flutter/material.dart';
import 'package:anilist/screens/settings.dart';
import 'package:anilist/screens/Home/index.dart';
import 'package:anilist/theme/theme_manager.dart';
import 'package:anilist/theme/theme_constants.dart';
import 'package:anilist/screens/Home/view_model.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();
HomeViewModel _viewModel = HomeViewModel();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  @override
  void dispose() {
    _themeManager.removeListener(() {
      themeListener();
    });
    super.dispose();
  }

  @override
  void initState() {
    _viewModel.initViewModel();
    _themeManager.addListener(() {
      themeListener();
    });

    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  final tabs = [
    HomeScreen(viewModel: _viewModel),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AniList",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      debugShowCheckedModeBanner: false,
      // routes: {'anime': (context) => const Anime()},
      home: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: Builder(builder: (context) {
          return bottomBar();
        }),
      ),
    );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.play_circle)),
        BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings))
      ],
      onTap: (index) => {
        setState(() {
          _currentIndex = index;
        })
      },
    );
  }
}
