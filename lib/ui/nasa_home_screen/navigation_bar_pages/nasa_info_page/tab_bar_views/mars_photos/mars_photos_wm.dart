import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/mars_photos/i_mars_photos_model.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/mars_photos/mars_photos_model.dart';
import 'package:nasa_app/ui/nasa_home_screen/navigation_bar_pages/nasa_info_page/tab_bar_views/mars_photos/mars_photos_widget.dart';

class MarsPhotosWM extends WidgetModel<MarsPhotosWidget, MarsPhotosModel>
    implements IMarsPhotosModel {

  @override
  ValueListenable<List<MarsPhoto>> get marsPhotos => model.marsPhotos;


  MarsPhotosWM(MarsPhotosModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getMarsPhotos();
  }
}
