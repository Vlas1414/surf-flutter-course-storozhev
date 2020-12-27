import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/constants/colorsConstant.dart';
import 'package:places/constants/stringsConstant.dart';
import 'package:places/constants/textStylesConstant.dart';
import 'package:places/ui/components/sight_card.dart';
import 'package:places/ui/utils/default_app_bar.dart';
import 'package:places/ui/utils/default_bottom_navigaion_bar.dart';
import 'package:places/ui/utils/default_list_view.dart';

/// Экран посещённых мест
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: StringsConstant.visitingTitle,
        bottom: _CustomTabIndicator(
          tabController: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          DefaultListView.futureVisite([
            SightCard.futureVisite(mocks[1]),
          ]),
          DefaultListView.pastVisite([]),
        ],
      ),
      bottomNavigationBar: defaultBottomNavigationBar(),
    );
  }
}

/// Макет индикатора
/// tabController - контроллер табов
/// TODO: анимация перехода между табами
/// TODO: обработка нажатий по интдикатору
class _CustomTabIndicator extends StatelessWidget {
  final TabController tabController;

  _CustomTabIndicator({
    Key key,
    this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: ColorsConstant.background,
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: [
              Positioned(
                left: tabController?.index == 0 ? 0 : constraints.maxWidth / 2,
                child: Container(
                  width: constraints.maxWidth / 2,
                  height: constraints.maxHeight,
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: ColorsConstant.secondary,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        StringsConstant.visitingTabTitleFuture,
                        style: TextStylesConstant.visitingTabTitle.copyWith(
                          color: tabController?.index == 0
                              ? ColorsConstant.white
                              : ColorsConstant.inactiveBlack,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        StringsConstant.visitingTabTitlePast,
                        style: TextStylesConstant.visitingTabTitle.copyWith(
                          color: tabController?.index == 1
                              ? ColorsConstant.white
                              : ColorsConstant.inactiveBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
