import 'package:flutter/material.dart';
import 'package:nasa_app/services/http_clients/dio_http_client.dart';
import 'package:nasa_app/services/http_clients/i_http_client.dart';
import 'package:nasa_app/services/mars_photo_service.dart';
import 'package:nasa_app/services/picture_service.dart';

// ignore: must_be_immutable
class InjectorWidget extends InheritedWidget {
  late IHttpClient httpClient;

  late MarsPhotoService marsPhotoService;
  late PictureService pictureService;

  InjectorWidget({required Widget child, Key? key})
      :
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static InjectorWidget? maybeOf(BuildContext context) {
      return context.dependOnInheritedWidgetOfExactType<
          InjectorWidget>();
  }


  void init() {
    httpClient = DioHttpClient();
    marsPhotoService = MarsPhotoService(httpClient);
    pictureService = PictureService(httpClient);
  }
}