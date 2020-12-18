import 'package:flutter/material.dart';
import 'package:places/customColors.dart';

class ImageLoading extends StatelessWidget {
  final String url;
  ImageLoading(this.url);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20),
          child: Icon(
            Icons.insert_photo,
            size: 60,
            color: CustomColors.background,
          ),
        ),
        Container(
          width: double.infinity,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: (
              BuildContext context,
              Widget child,
              ImageChunkEvent loadingProgress,
            ) =>
                loadingProgress == null
                    ? child
                    : Container(
                        alignment: Alignment.bottomCenter,
                        child: LinearProgressIndicator(
                          value: loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes,
                        ),
                      ),
          ),
        ),
      ],
    );
  }
}
