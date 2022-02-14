import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:nasa_app/services/models/mars_photo.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/i_mars_photos_wm.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/mars_photos_model.dart';
import 'package:nasa_app/ui/nasa_feed_screen/tabs/mars_photos/mars_photos_widget.dart';

class MarsPhotosWM extends WidgetModel<MarsPhotosWidget, MarsPhotosModel>
    implements IMarsPhotosWM {

  @override
  ValueListenable<List<MarsPhoto>> get marsPhotos => model.marsPhotos;

  MarsPhotosWM(MarsPhotosModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getMarsPhotos();
  }
}
