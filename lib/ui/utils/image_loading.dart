import 'package:flutter/material.dart';
import 'package:places/constants/assetsApp.dart';
import 'package:places/constants/colorsApp.dart';

/// загрузка изображения с прогрес индикатором
/// url - ссылка на изображение
class ImageLoading extends StatelessWidget {
  final String url;
  ImageLoading(this.url);

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
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent loadingProgress,
            ) {
              if (loadingProgress == null) {
                return child;
              }
              return Container(
                alignment: Alignment.bottomCenter,
                child: LinearProgressIndicator(
                  value: loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
