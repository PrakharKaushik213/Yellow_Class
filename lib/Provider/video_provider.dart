import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/Video.dart';

class VideoProvider with ChangeNotifier {
  List<Video> videos = [];

  loadData() async {
    print("reached load data");
    final videosJson = await rootBundle.loadString("lib/data/d.json");
    var videosData = await json.decode(videosJson);
    videosData.forEach((value) {
      videos.add(Video(
          id: value['id'].toString(),
          title: value['title'],
          coverPicture: value['coverPicture'],
          videoUrl: value['videoUrl']));
    });
    notifyListeners();
  }
}
