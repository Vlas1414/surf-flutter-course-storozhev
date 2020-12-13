import 'package:flutter/material.dart';
import 'package:places/strings.dart';
import 'package:places/styles.dart';

class SightDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            color: Colors.grey,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 48, left: 16),
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    color: Colors.black,
                    width: 15,
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: 16, right: 16, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.DETAILS_TITLE,
                  style: Styles.DETAILS_TITLE,
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      Strings.DETAILS_TYPE_NAME.toLowerCase(),
                      style: Styles.DETAILS_TYPE_NAME,
                    ),
                    SizedBox(width: 16),
                    Text(
                      Strings.DETAILS_SCHEDULE_INFO.toLowerCase(),
                      style: Styles.DETAILS_SCHEDULE_INFO,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  Strings.DETAILS_DESCRIPTION,
                  style: Styles.DETAILS_DESCRIPTION,
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color.fromARGB(255, 76, 175, 80),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.white,
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Text(
                        Strings.DETAILS_BUILD_ROUTE_TEXT_BUTTON.toUpperCase(),
                        style: Styles.DETAILS_BUILD_ROUTE_TEXT_BUTTON,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Color.fromARGB(70, 124, 126, 146),
                ),
                SizedBox(height: 19),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: Color.fromARGB(70, 124, 126, 146),
                        ),
                        SizedBox(width: 10),
                        Text(
                          Strings.DETAILS_PLAN_TEXT_BUTTON,
                          style: Styles.DETAILS_PLAN_TEXT_BUTTON,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: Color.fromARGB(255, 59, 62, 91),
                        ),
                        SizedBox(width: 10),
                        Text(
                          Strings.DETAILS_LIKE_TEXT_BUTTON,
                          style: Styles.DETAILS_LIKE_TEXT_BUTTON,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
