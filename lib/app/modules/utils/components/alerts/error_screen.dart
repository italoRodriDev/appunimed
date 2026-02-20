import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    this.title = "Não foi possivel carregar essa função",
    required this.tryAgainFunction,
    this.showButtonBack,
  });

  final String title;
  final Function tryAgainFunction;
  final bool? showButtonBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 1,
                child: SvgPicture.asset(
                  'assets/svg/feedback_status_image_very_bad.svg',
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 30),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 270),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFont.UnimedSans,
                    color: AppColor.highlight9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 42,
          child: ButtonAppComponent(
            padding: const EdgeInsets.all(0),
            label: "Tentar novamente",
            onPressed: () {
              tryAgainFunction();
            },
          ),
        ),
        const SizedBox(height: 16),
        showButtonBack == true
            ? SizedBox(
                width: double.infinity,
                height: 42,
                child: ButtonOutlineAppComponent(
                  padding: const EdgeInsets.all(0),
                  label: "Voltar",
                  onPressed: () {
                    Get.back();
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
