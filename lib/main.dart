import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yelloclass/Screens/home_screen.dart';

import 'Provider/video_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VideoProvider>(
          create: (context) {
            return VideoProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: 'YC Prakhar Kaushik',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
