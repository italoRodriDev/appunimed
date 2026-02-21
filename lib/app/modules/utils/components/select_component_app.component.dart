import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectAppComponent extends StatefulWidget {
  final Function(dynamic)? onChanged;
  final bool? enabled;
  final bool? enabledBorder;
  final Color? borderColor;
  final bool centerSelectedValue;
  final List<MenuItemData> menuItemData;
  final Color primaryColor;
  final String? labelText;
  final dynamic initialValue;
  final double? width;

  const SelectAppComponent({
    this.onChanged,
    this.enabled,
    this.enabledBorder,
    this.borderColor,
    this.menuItemData = const [],
    required this.primaryColor,
    this.centerSelectedValue = false,
    this.labelText,
    this.width,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  _SelectAppComponentState createState() => _SelectAppComponentState();
}

class _SelectAppComponentState extends State<SelectAppComponent> {
  dynamic value;
  late FocusNode focusNode;
  late bool hasFocus;

  final double CONSTANT_WIDTH_SELECT = 0.7129761662;

  @override
  void initState() {
    super.initState();
    hasFocus = false;
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasPrimaryFocus;
      });
    });
    value = widget.initialValue ?? widget.menuItemData.first.value;
  }

  setValue(dynamic val) {
    setState(() {
      value = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildBaseItem({required String label, Color? textColor}) {
      return SizedBox(
        width: Get.width * CONSTANT_WIDTH_SELECT,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    List<DropdownMenuItem> buildMenuItems() {
      return widget.menuItemData.map((data) {
        bool isSelected = value == data.value;
        return DropdownMenuItem(
          enabled: widget.enabled ?? true,
          value: data.value,
          child: FocusScope(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      buildBaseItem(
                        label: data.label,
                        textColor: isSelected
                            ? AppColor.pantone382C
                            : Colors.black,
                      ),
                      if (isSelected) ...[
                        const Spacer(),
                        Icon(Icons.check, color: AppColor.pantone382C),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList();
    }

    List<Widget> buildSelectedMenuItems(BuildContext context) {
      return widget.menuItemData
          .map((data) => buildBaseItem(label: data.label))
          .toList();
    }

    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) ...[
            Text(
              widget.labelText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: AppFont.UnimedSans,
                color: AppColor.pantone7722C,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Container(
            width: widget.centerSelectedValue ? double.infinity : null,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              border: widget.enabledBorder == true
                  ? Border.all(
                      width: 1.25,
                      color: widget.borderColor ?? Colors.grey,
                    )
                  : null,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                focusColor: widget.primaryColor,
                shadowColor: Colors.red,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    focusColor: AppColor.pantone7722C,
                    focusNode: focusNode,
                    value: value,
                    isExpanded: widget.centerSelectedValue ? false : true,
                    icon: Icon(
                      value == widget.menuItemData.first.value
                          ? Icons.keyboard_arrow_down_rounded
                          : value == widget.menuItemData.last.value
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.unfold_more_rounded,
                      color: AppColor.pantone382C,
                    ),
                    selectedItemBuilder: buildSelectedMenuItems,
                    onChanged: (dynamic val) {
                      setValue(val);
                      if (widget.onChanged != null) {
                        widget.onChanged!(val);
                      }
                    },
                    items: buildMenuItems(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemData {
  final String label;
  final dynamic value;

  const MenuItemData({required this.label, required this.value});
}
