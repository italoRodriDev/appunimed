import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/data/keys/shared_preferences.keys.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_minimizer_plus/flutter_app_minimizer_plus.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/fonts/fonts.dart';

class ItemData {
  final Color color;
  final Color colorTheme;
  final String logo;
  final String title;
  final String description;

  ItemData({
    required this.color,
    required this.colorTheme,
    required this.logo,
    required this.title,
    required this.description,
  });
}

class IntroAppModal extends StatefulWidget {
  @override
  _IntroAppModalState createState() => _IntroAppModalState();
}

class _IntroAppModalState extends State<IntroAppModal> {
  int page = 0;
  late LiquidController liquidController;

  final List<ItemData> data = [
    ItemData(
      color: Colors.white,
      colorTheme: AppColor.pantone7722C,
      logo: "logo_unimedjp.png",
      title: "Titulo",
      description: "Descrição.",
    ),
    ItemData(
      color: AppColor.success.shade100,
      colorTheme: AppColor.pantone7722C,
      logo: "logo_unimedjp.png",
      title: "Titulo",
      description: "Descrição.",
    ),
  ];

  ValueNotifier<Color> colorThemeEvent = ValueNotifier<Color>(Colors.white);
  ValueNotifier<int> indexPageEvent = ValueNotifier<int>(0);

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  void _pageChangeCallback(int indexPage) {
    setState(() {
      page = indexPage;
      colorThemeEvent.value = data[indexPage].colorTheme;
      indexPageEvent.value = indexPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await FlutterAppMinimizerPlus.minimizeApp();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            LiquidSwipe.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return buildItem(context, data[index], index);
              },
              onPageChangeCallback: _pageChangeCallback,
              liquidController: liquidController,
              waveType: WaveType.liquidReveal,
              slideIconWidget: ValueListenableBuilder(
                valueListenable: indexPageEvent,
                builder: (context, index, child) {
                  return index < data.length - 1
                      ? Icon(
                          Icons.arrow_back_ios,
                          color: index < data.length - 1
                              ? data[index + 1].colorTheme
                              : data[index - 1].colorTheme,
                        )
                      : Container();
                },
              ),
              positionSlideIcon: 0.8,
              enableSideReveal: true,
              enableLoop: false,
              ignoreUserGestureWhileAnimating: true,
            ),
            ValueListenableBuilder(
              valueListenable: colorThemeEvent,
              builder: (context, Color theme, child) {
                return DotsIndicator(
                  currentPage: page,
                  totalPages: data.length,
                  colorTheme: theme,
                );
              },
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40),
              alignment: Alignment.bottomRight,
              child: ValueListenableBuilder(
                valueListenable: colorThemeEvent,
                builder: (context, Color theme, child) {
                  return ValueListenableBuilder(
                    valueListenable: indexPageEvent,
                    builder: (context, index, child) {
                      if (index == data.length - 1) {
                        return SkipButton(
                          colorTheme: theme,
                          text: "Começar",
                          onPressed: () async {
                            await setVisible();
                            Get.toNamed(RoutesApp.LOGIN);
                          },
                        );
                      } else {
                        return SkipButton(
                          colorTheme: theme,
                          text: "Continuar",
                          onPressed: () async {
                            liquidController.animateToPage(
                              duration: 600,
                              page:
                                  (liquidController.currentPage + 1) %
                                  data.length,
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40),
              alignment: Alignment.bottomLeft,
              child: ValueListenableBuilder(
                valueListenable: colorThemeEvent,
                builder: (context, Color theme, child) {
                  return ValueListenableBuilder(
                    valueListenable: indexPageEvent,
                    builder: (context, index, child) {
                      if (index > 0) {
                        return SkipButton(
                          colorTheme: theme,
                          text: "Voltar",
                          onPressed: () async {
                            liquidController.animateToPage(
                              duration: 600,
                              page:
                                  (liquidController.currentPage - 1) %
                                  data.length,
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  setVisible() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.setBool(INTRO_APP_VIEW_KEY, true);
  }

  Widget buildItem(BuildContext context, ItemData item, int index) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 80),
          color: item.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/${item.logo}',
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(22),
                child: Column(
                  children: [
                    TextComponent(
                      value: item.title,
                      fontSize: 22,
                      fontFamily: AppFont.UnimedSlab,
                      fontWeight: FontWeight.w600,
                      color: item.colorTheme,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 14),
                    TextComponent(
                      value: item.description,
                      fontSize: 18,
                      fontFamily: AppFont.UnimedSans,
                      fontWeight: FontWeight.w600,
                      color: item.colorTheme,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Color colorTheme;

  DotsIndicator({
    required this.currentPage,
    required this.totalPages,
    required this.colorTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalPages,
          (index) =>
              Dot(isSelected: index == currentPage, colorTheme: colorTheme),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool isSelected;
  final Color colorTheme;

  Dot({required this.isSelected, required this.colorTheme});

  @override
  Widget build(BuildContext context) {
    double size = isSelected ? 10.0 : 8.0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isSelected ? colorTheme : colorTheme.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  final String text;
  final Color colorTheme;
  final VoidCallback onPressed;

  SkipButton({
    required this.text,
    required this.colorTheme,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(foregroundColor: colorTheme),
        child: TextAppComponent(
          value: text,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColor.pantone7722C,
          fontFamily: AppFont.UnimedSlab,
        ),
      ),
    );
  }
}
