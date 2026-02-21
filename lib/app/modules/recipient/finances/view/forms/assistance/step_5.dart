import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

class Step5FormAssistence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Center(
                child: Icon(
                  Icons.check_circle,
                  size: 80,
                  color: AppColor.pantone382C,
                ),
              ),
              SizedBox(height: 10),
              TextAppComponent(
                value: 'Solicitação enviado com sucesso!',
                fontSize: 22,
                color: AppColor.pantone348C,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),
              TextAppComponent(
                value:
                    'Agora é só aguardar, fique a vontade para continuar navegando no app.',
                fontSize: 16,
                height: 1.5,
                textAlign: TextAlign.center,
              ),

              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ButtonStylizedAppComponent(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: TextAppComponent(
                        value: "Voltar ao menu",
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.pantone7722C,
                      ),
                      color: AppColor.pantone382C,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
