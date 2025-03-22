import 'package:skyyoga/gen/assets.gen.dart';

class VideoList {
  String title;
  String image;
  String videoUrl;
  VideoList({
    required this.title,
    required this.image,
    required this.videoUrl,
  });
}

class CategoryList {
  String title;
  bool timer;
  CategoryList({
    required this.title,
    required this.timer,
  });
}

class AppDataBase {
  static List<CategoryList> categoryList = [
    CategoryList(
      title: 'Hip flexbilty',
      timer: false,
    ),
    CategoryList(
      title: 'Yoga black for test',
      timer: false,
    ),
    CategoryList(
      title: '30 min',
      timer: true,
    ),
  ];
  static List<VideoList> videoList = [
    VideoList(
      title: 'Black yoga',
      image: 'assets/img/png/videotest2.png',
      videoUrl: Assets.video.video1,
    ),
    VideoList(
      title: 'Black yoga',
      image: 'assets/img/png/videotest1.png',
      videoUrl: Assets.video.video2,
    ),
  ];
}
