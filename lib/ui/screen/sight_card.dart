import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  SightCard({this.sight});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 188,
      margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 16,
                    child: Text(
                      sight.type.toLowerCase(),
                      style: Styles.SIGHT_CARD_TYPE_NAME,
                    ),
                  ),
                  Positioned(
                      right: 16,
                      top: 16,
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: Color.fromARGB(255, 245, 245, 245),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      sight.name,
                      style: Styles.SIGHT_CARD_TITLE,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    sight.details.toLowerCase(),
                    style: Styles.SIGHT_CARD_SUBTITLE,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
