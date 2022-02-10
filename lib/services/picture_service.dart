import 'package:dio/dio.dart';
import 'package:nasa_app/ui/nasa_home_screen/tab_bar_views/picture_of_the_day/widgets/picture.dart';
import 'package:nasa_app/utils/const.dart';


class PictureService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Picture> getPictureOfTheDay() {
      return Future.value(Picture());
  }
}