import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';

class ToolbarAppComponent extends StatefulWidget {
  final String title;
  final Color? colorText;
  final Color? colorIcon;
  final Function? onPressedBack;
  final bool showBackButton;
  final Function onPressedMenu;
  final bool? showMenu;

  const ToolbarAppComponent({
    super.key,
    required this.onPressedMenu,
    required this.title,
    this.colorIcon,
    this.colorText,
    this.onPressedBack,
    this.showBackButton = true,
    this.showMenu,
  });

  @override
  State<ToolbarAppComponent> createState() => _ToolbarAppComponentState();
}

class _ToolbarAppComponentState extends State<ToolbarAppComponent>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: widget.showBackButton
                  ? IconButton(
                      iconSize: 20,
                      onPressed: () {
                        if (widget.onPressedBack != null) {
                          widget.onPressedBack!();
                        } else {
                          Get.back();
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: widget.colorText ?? AppColor.pantone348C,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),

            // Título realmente centralizado
            Expanded(
              child: Center(
                child: TextComponent(
                  value: widget.title,
                  textAlign: TextAlign.center,
                  fontSize: 14,
                  color: widget.colorText ?? AppColor.pantone348C,
                ),
              ),
            ),

            // Lado direito (ações) — mesma largura do esquerdo
            SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.showMenu == false
                      ? Container()
                      : Padding(
                          padding: EdgeInsetsGeometry.only(right: 15),
                          child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/menu.svg',
                              width: 15,
                              height: 15,
                              colorFilter: ColorFilter.mode(
                                widget.colorIcon ?? AppColor.pantone348C,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
        Container(color: AppColor.neutral4, height: 1),
      ],
    );
  }
}
