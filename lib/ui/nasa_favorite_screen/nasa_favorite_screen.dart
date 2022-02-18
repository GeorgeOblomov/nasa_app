import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/generated/l10n.dart';
import 'package:nasa_app/ui/nasa_favorite_screen/i_favorite_screen_wm.dart';
import 'package:nasa_app/ui/widgets/i_navigation_item_data.dart';
import 'package:nasa_app/ui/widgets/network_image_widget.dart';
import 'package:nasa_app/utils/app_text_styles.dart';

class NasaFavoriteScreen extends ElementaryWidget<IFavoriteScreenWM>
    implements INavigationItemData {
  final bool isTest;

  const NasaFavoriteScreen({
    WidgetModelFactory wmFactory = createNasaFavoriteWM,
    Key? key,
    this.isTest = false,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFavoriteScreenWM wm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            wm.favoriteTitle,
            style: AppTextStyles.screenHeader,
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ValueListenableBuilder<List<String>>(
            valueListenable: wm.favoritePhotos,
            builder: (_, data, ___) {
              return data.isEmpty
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error, color: Colors.red),
                          const SizedBox(height: 16),
                          Text(
                            wm.favoriteEmptyText,
                            style: AppTextStyles.description,
                          ),
                        ],
                      ),
                  )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return NetworkImageWidget(
                          url: data[index],
                          margin: const EdgeInsets.all(16),
                          isTest: isTest,
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }

  @override
  IconData getIcon() => Icons.thumb_up_off_alt;

  @override
  String getLabel(BuildContext context) => S.current.favoriteTitle;
}
