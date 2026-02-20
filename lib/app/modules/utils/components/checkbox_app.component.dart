import 'package:flutter/material.dart';

class CheckboxAppComponent extends StatefulWidget {
  const CheckboxAppComponent({
    this.initialValue = false,
    this.iconColor = Colors.black,
    this.checkedBorderColor = Colors.black,
    this.checkedFillColor = Colors.white,
    this.iconData = Icons.check,
    this.onChanged,
    Key? key,
  }) : super(key: key);
  final bool initialValue;
  final Color checkedBorderColor;
  final Color iconColor;
  final Color checkedFillColor;
  final IconData iconData;
  final void Function(bool)? onChanged;

  @override
  State<CheckboxAppComponent> createState() => _CheckboxComponentState();
}

class _CheckboxComponentState extends State<CheckboxAppComponent> {
  late bool checked;

  @override
  void initState() {
    checked = widget.initialValue;
    super.initState();
  }

  setChecked(bool val) {
    setState(() {
      checked = val;
    });
    if (widget.onChanged != null) widget.onChanged!(val);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setChecked(!checked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: checked ? widget.checkedFillColor : Colors.white,

          border: Border.all(
            color: checked
                ? widget.checkedBorderColor
                : widget.checkedBorderColor.withAlpha(100),
            width: 2,
          ),
        ),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 50),
          opacity: checked ? 1 : 0,
          curve: Curves.easeIn,
          child: Icon(widget.iconData, color: widget.iconColor),
        ),
      ),
    );
  }
}
