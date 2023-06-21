import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper/model/photo_model.dart';

class ApiOperation{
  static List<PhotoModel> trendingPhotosWl = [];
  static List<PhotoModel> serachWallpaper = [];

  static Future<List<PhotoModel>> getTrendingWallpapers() async{
    await http.get(Uri.parse('https://api.pexels.com/v1/curated'), headers: {
      "Authorization":
      "OujDB1axKg4h2boAMZZwoQV0r9tA5H674z7DTZEvU4ptU2myKzMk0YK7"
    }).then((value){
      // Map<String, dynamic> jsonData = jsonDecode(value.body);
      // List photos = jsonData['photos'];
      // photos.forEach((element) {
      //   Map<String, dynamic> src = element["src"];
      //   print(src["portrait"]);
      // });

      Map<String , dynamic> jsonD= jsonDecode(value.body);
      List photos = jsonD["photos"];
      photos.forEach((element) {
        trendingPhotosWl.add(PhotoModel.fromApitoApp(element));
      });
    });
    return trendingPhotosWl;
  }

  static Future<List<PhotoModel>> searchWallpaper(String query)async{

    await http.get(Uri.parse('https://api.pexels.com/v1/curated/search?query=$query&per_page=30&page=1'), headers: {
      "Authorization":
      "OujDB1axKg4h2boAMZZwoQV0r9tA5H674z7DTZEvU4ptU2myKzMk0YK7"
    }).then((value){
      // Map<String, dynamic> jsonData = jsonDecode(value.body);
      // List photos = jsonData['photos'];
      // photos.forEach((element) {
      //   Map<String, dynamic> src = element["src"];
      //   print(src["portrait"]);
      // });

      Map<String , dynamic> jsonD= jsonDecode(value.body);
      List photos = jsonD["photos"];
      serachWallpaper.clear();
      photos.forEach((element) {
        serachWallpaper.add(PhotoModel.fromApitoApp(element));
      });
    });
    return serachWallpaper;
  }
}