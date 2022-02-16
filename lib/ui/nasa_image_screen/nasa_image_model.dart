import 'package:elementary/elementary.dart';
import 'package:gallery_saver/gallery_saver.dart';

class NasaImageModel extends ElementaryModel {

  Future<bool?> saveImageToGallery(String url) {
    return GallerySaver.saveImage(url);
  }
}