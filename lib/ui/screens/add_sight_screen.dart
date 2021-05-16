import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/constants/assets_app.dart';
import 'package:places/constants/colors_app.dart';
import 'package:places/constants/strings_app.dart';
import 'package:places/constants/text_styles_app.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/utils/action_row.dart';
import 'package:places/ui/utils/default_accept_button.dart';
import 'package:places/ui/utils/default_alert_dialog.dart';
import 'package:places/ui/utils/default_app_bar.dart';
import 'package:places/ui/utils/default_text_input.dart';
import 'package:provider/provider.dart';

/// Экран добавления нового места
class AddSightScreen extends StatelessWidget {
  const AddSightScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _AddSightModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: DefaultAppBar(
            title: StringsApp.addSightTitle,
            leading: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                StringsApp.cancel,
                style: TextStylesApp.size16Weight500.copyWith(
                  color: ColorsApp.secondary2,
                ),
              ),
            ),
            leadingOnPressed: () async {
              final bool? answer = await const DefaultAlertDialog(
                content: Text(StringsApp.addSightAreYouShureToLeave),
              ).showAlertDialog(context);
              if (answer == true) {
                Navigator.of(context).pop();
              }
            },
            leadingWidth: double.infinity,
          ),
          body: Column(
            children: [
              const Expanded(
                child: _Content(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Consumer<_AddSightModel>(
                  builder: (context, addSightModel, child) {
                    return DefaultAcceptButton(
                      text: StringsApp.create,
                      onPressed: () => addSightModel.createSight(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildRow(
      String text,
      Widget child, {
      double spaceBetweenElements = 12,
    }) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              text.toUpperCase(),
              style: TextStylesApp.size12.copyWith(
                color: ColorsApp.inactiveBlack,
              ),
            ),
            SizedBox(height: spaceBetweenElements),
            child,
          ],
        ),
      );
    }

    return Consumer<_AddSightModel>(
      builder: (context, addSightModel, child) {
        final categorySelectInput = ActionRow(
          text: addSightModel.selectedCategory?.text ??
              StringsApp.addSightCategoryNotSelected,
          onTap: () async {
            final result = await Navigator.push(
              context,
              CupertinoPageRoute<TypeOfSight?>(
                builder: (context) => const _CategoryScreen(),
              ),
            );
            addSightModel.selectedCategory = result;
          },
          color: addSightModel.selectedCategory?.text != null
              ? ColorsApp.dark
              : ColorsApp.secondary2,
          action: Transform(
            transform: Matrix4.rotationY(math.pi),
            alignment: FractionalOffset.center,
            child: Image.asset(
              AssetsApp.arrowIcon,
              width: 24,
              height: 24,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        );

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            Container(
              height: 72,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: ColorsApp.inactiveBlack,
              ),
            ),
            buildRow(
              StringsApp.addSightCategory,
              categorySelectInput,
              spaceBetweenElements: 0,
            ),
            buildRow(
              StringsApp.addSightName,
              DefaultTextInput(
                controller: addSightModel.nameController,
                textInputAction: TextInputAction.go,
                hintText: StringsApp.addSightExampleName,
                maxLength: 60,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: buildRow(
                    StringsApp.addSightLat,
                    DefaultTextInput(
                      controller: addSightModel.latController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.go,
                      hintText: StringsApp.addSightExampleLat,
                      maxLength: 15,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validatorRegex: r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?)',
                      validatorErrorMessage: StringsApp.addSightNotCorrectValue,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: buildRow(
                    StringsApp.addSightLon,
                    DefaultTextInput(
                      controller: addSightModel.lonController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.go,
                      hintText: StringsApp.addSightExampleLon,
                      maxLength: 15,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validatorRegex:
                          r'^\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$',
                      validatorErrorMessage: StringsApp.addSightNotCorrectValue,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Text(
                  StringsApp.addSightSetOnMap,
                  style: TextStylesApp.size16Weight500.copyWith(
                    color: ColorsApp.green,
                  ),
                ),
              ),
            ),
            buildRow(
              StringsApp.addSightDesc,
              DefaultTextInput(
                controller: addSightModel.descriptionController,
                maxLines: 3,
                maxLength: 1000,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CategoryScreen extends StatelessWidget {
  const _CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: StringsApp.addSightCategory,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            AssetsApp.arrowIcon,
            width: 24,
            height: 24,
            color: Theme.of(context).textTheme.headline1!.color,
          ),
        ),
        leadingOnPressed: () => Navigator.pop(context),
        leadingWidth: double.infinity,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mocksTypeOfSight.length,
        itemBuilder: (context, index) {
          return ActionRow(
            text: mocksTypeOfSight[index].text,
            onTap: () {
              Navigator.pop(context, mocksTypeOfSight[index]);
            },
          );
        },
      ),
    );
  }
}

class _AddSightModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  TypeOfSight? _selectedCategory;
  TypeOfSight? get selectedCategory => _selectedCategory;

  set selectedCategory(TypeOfSight? choosedCategory) {
    _selectedCategory = choosedCategory;
    notifyListeners();
  }

  void createSight() {
    if (_selectedCategory != null &&
        nameController.value.text.isNotEmpty &&
        latController.value.text.isNotEmpty &&
        lonController.value.text.isNotEmpty) {
      final newSight = Sight(
        url: '',
        type: _selectedCategory!,
        name: nameController.value.text,
        lat: double.tryParse(latController.value.text)!,
        lon: double.tryParse(lonController.value.text)!,
        details: descriptionController.value.text,
      );
      mocksSights.add(newSight);
    }
  }
}
