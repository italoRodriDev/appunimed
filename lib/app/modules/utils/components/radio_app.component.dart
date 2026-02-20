import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
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
        return InkWell(
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
              Text(option),
            ],
          ),
        );
      }).toList(),
    );
  }
}
