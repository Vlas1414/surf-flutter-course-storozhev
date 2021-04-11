import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';

/// загрузка изображения с прогрес индикатором
/// url - ссылка на изображение
class ImageLoading extends StatelessWidget {
  const ImageLoading(this.url, {Key? key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 35, bottom: 10),
          child: Image.asset(
            AssetsApp.photoIcon,
            color: ColorsApp.background,
            height: 100,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (
              context,
              child,
              loadingProgress,
            ) {
              if (loadingProgress == null) {
                return child;
              }
              return Container(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                  value: loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
