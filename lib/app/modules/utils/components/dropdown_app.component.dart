import 'package:flutter/material.dart';

import '../../../config/colors/colors.dart';
import '../../../config/fonts/fonts.dart';

class DropDownAppComponent extends StatefulWidget {
  final Function(dynamic)? onChanged;
  final bool? enabled;
  final List<MenuItemData> menuItemData;
  final Color primaryColor;
  final String? labelText;
  final dynamic initialValue;
  final double? width;

  const DropDownAppComponent({
    this.onChanged,
    this.enabled,
    this.menuItemData = const [],
    required this.primaryColor,
    this.labelText,
    this.width,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  _DropDownAppComponentState createState() => _DropDownAppComponentState();
}

class _DropDownAppComponentState extends State<DropDownAppComponent> {
  dynamic value;
  late FocusNode focusNode;
  late bool hasFocus;

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
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            color: AppColor.pantone348C,
            fontFamily: AppFont.UnimedSlab,
            fontWeight: FontWeight.w600,
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
                buildBaseItem(
                  label: data.label,
                  textColor: isSelected ? widget.primaryColor : Colors.black,
                ),
                if (isSelected) ...[
                  const Spacer(),
                  Icon(Icons.check, color: AppColor.pantone382C),
                ],
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

    return Container(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) ...[
            Text(
              widget.labelText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.pantone348C,
                fontFamily: AppFont.UnimedSlab,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Theme(
              data: Theme.of(context).copyWith(
                focusColor: widget.primaryColor,
                shadowColor: Colors.red,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  focusColor: AppColor.pantone348C,
                  focusNode: focusNode,
                  value: value,
                  isExpanded: true,
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
        ],
      ),
    );
  }
}

class MenuItemData<T> {
  final String label;
  final T value;

  const MenuItemData({required this.label, required this.value});
}
