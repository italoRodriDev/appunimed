import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

class RadioGroupApp extends StatefulWidget {
  final List<String> options; // lista de opções
  final String? initialValue; // valor inicial
  final ValueChanged<String>? onChanged; // callback opcional

  const RadioGroupApp({
    super.key,
    required this.options,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<RadioGroupApp> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroupApp> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map((option) {
        return Container(
          margin: EdgeInsetsGeometry.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.neutral2.withAlpha(100)),
          ),
          padding: EdgeInsetsGeometry.only(
            top: 10,
            bottom: 10,
            left: 5,
            right: 5,
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedValue = option;
              });
              widget.onChanged?.call(option);
            },
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.neutral2.withAlpha(100),
                      width: 2,
                    ),
                    color: _selectedValue == option
                        ? AppColor.highlight1
                        : Colors.white,
                  ),
                  child: _selectedValue == option
                      ? Center(
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.highlight1,
                            ),
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                TextAppComponent(
                  value: option.length > 30
                      ? '${option.substring(0, 30)}...'
                      : option,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.pantone7722C,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
