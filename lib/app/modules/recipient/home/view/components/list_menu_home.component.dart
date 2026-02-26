import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/controller/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';

import '../../../../../config/colors/colors.dart';

class AnimatedCardsListHome extends StatefulWidget {
  HomeController controller;

  AnimatedCardsListHome({super.key, required this.controller});

  @override
  State<AnimatedCardsListHome> createState() => _AnimatedCardsListState();
}

class _AnimatedCardsListState extends State<AnimatedCardsListHome>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final double cardHeight = 60;
  final double spacing = 50;
  int cardCount = 13;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // iniciar animação
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget card({
    required IconData icon,
    required String label,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Container(
          height: 90,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColor.pantone382C.withAlpha(60),
            border: Border.all(color: AppColor.pantone382C),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Icon(icon, color: AppColor.pantone7722C, size: 25),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextComponent(
                      textAlign: TextAlign.left,
                      value: label,
                      fontWeight: FontWeight.w800,
                      color: AppColor.pantone7722C,
                      fontFamily: AppFont.UnimedSans,
                      fontSize: 15,
                    ),
                    const SizedBox(height: 4),
                    TextComponent(
                      textAlign: TextAlign.left,
                      value: subtitle,
                      fontWeight: FontWeight.w600,
                      color: AppColor.pantone7722C,
                      fontFamily: AppFont.UnimedSans,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.pantone348C,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (cardHeight + spacing) * cardCount,
      child: Stack(
        children: List.generate(cardCount, (index) {
          var startTop = 0.0;
          final endTop = index * (cardHeight + spacing);

          final double animationStep = 1 / cardCount;

          final startInterval = index * animationStep;
          final endInterval = (startInterval + 0.4).clamp(0.0, 1.0);

          if (widget.controller.stopHomeAnimations.value) {
            startTop = endTop;
          }

          final animation = Tween<double>(begin: startTop, end: endTop).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(
                startInterval,
                endInterval,
                curve: Curves.easeOut,
              ),
            ),
          );

          var startOpacity = 0.0;

          if (widget.controller.stopHomeAnimations.value) {
            startOpacity = 1;
          }

          final opacity = Tween<double>(begin: startOpacity, end: 1).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Interval(
                startInterval,
                endInterval,
                curve: Curves.easeOut,
              ),
            ),
          );

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              CardModel data = widget.controller.itemsMenu[index];
              return Positioned(
                top: animation.value,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: opacity.value,
                  child: card(
                    icon: data.icon,
                    label: data.title,
                    subtitle: data.subtitle,
                    onPressed: () {
                      Get.toNamed(data.router);
                    },
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class CardModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String router;

  CardModel(this.icon, this.title, this.subtitle, this.router);
}
