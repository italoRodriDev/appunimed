import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:flutter/material.dart';

class ButtonAppComponent extends StatelessWidget {
  const ButtonAppComponent({
    required this.label,
    this.textColor,
    this.color,
    this.onPressed,
    this.borderRadius = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
    Key? key,
  }) : super(key: key);
  final Color? color;
  final Color? textColor;
  final String label;
  final Function? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: Text(
        label!,
        style: TextStyle(
          fontFamily: AppFont.UnimedSans,
          fontSize: 14,
          color: textColor,
        ),
      ),
    );
  }
}

class ButtonOutlineAppComponent extends StatelessWidget {
  const ButtonOutlineAppComponent({
    required this.label,
    this.textColor,
    this.outlineColor,
    required this.onPressed,
    this.borderRadius = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
    Key? key,
  }) : super(key: key);
  final String? label;
  final Function onPressed;
  final double borderRadius;
  final Color? outlineColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor ?? outlineColor ?? currentTheme.primaryColor,
        padding: padding,
        textStyle: TextStyle(color: currentTheme.primaryColor),
        side: BorderSide(color: outlineColor ?? currentTheme.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: Text(
        label!,
        style: TextStyle(
          fontFamily: AppFont.UnimedSans,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

class ButtonIconAppComponent extends StatelessWidget {
  const ButtonIconAppComponent({
    required this.label,
    this.color,
    this.iconData,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    Key? key,
  }) : super(key: key);
  final Widget label;
  final Color? color;
  final IconData? iconData;
  final Function onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed as void Function()?,
      icon: Icon(iconData),
      label: label,
      style: ElevatedButton.styleFrom(backgroundColor: color, padding: padding),
    );
  }
}

class ButtonIconCircularAppComponent extends StatelessWidget {
  const ButtonIconCircularAppComponent({
    this.fillColor = Colors.transparent,
    required this.iconData,
    this.iconColor = Colors.blue,
    this.outlineColor = Colors.transparent,
    this.notificationFillColor = Colors.red,
    this.notificationCount,
    this.onPressed,
    this.radius = 48.0,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final Color fillColor;
  final Color outlineColor;
  final Color iconColor;
  final Color notificationFillColor;
  final int? notificationCount;
  final Function? onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Ink(
          width: radius,
          height: radius,
          decoration: ShapeDecoration(
            color: fillColor,
            shape: CircleBorder(side: BorderSide(color: outlineColor)),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: radius / 2,
            iconSize: radius / 2,
            icon: Icon(iconData, color: iconColor),
            splashColor: iconColor.withOpacity(.4),
            onPressed: onPressed as void Function()?,
          ),
        ),
        if (notificationCount != null) ...[
          Positioned(
            top: radius / -14,
            right: radius / -14,
            child: Container(
              width: radius / 2.2,
              height: radius / 2.2,
              decoration: ShapeDecoration(
                color: notificationFillColor,
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Text(
                  notificationCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: radius / 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class ButtonStylizedAppComponent extends StatelessWidget {
  const ButtonStylizedAppComponent({
    required this.label,
    this.color,
    this.onPressed,
    this.borderRadius = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
    Key? key,
  }) : super(key: key);
  final Color? color;
  final Widget? label;
  final Function? onPressed;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: padding,
        backgroundColor: color ?? currentTheme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: label,
    );
  }
}

class ButtonStylizedOutlineAppComponent extends StatelessWidget {
  const ButtonStylizedOutlineAppComponent({
    required this.label,
    this.textColor,
    this.outlineColor,
    required this.onPressed,
    this.borderRadius = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
    Key? key,
  }) : super(key: key);
  final Widget label;
  final Function onPressed;
  final double borderRadius;
  final Color? outlineColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: textColor ?? outlineColor ?? currentTheme.primaryColor,
        padding: padding,
        textStyle: TextStyle(color: currentTheme.primaryColor),
        side: BorderSide(color: outlineColor ?? currentTheme.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: label,
    );
  }
}

class ButtonModalAppComponent extends StatelessWidget {
  const ButtonModalAppComponent({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColor.pantone348C, width: 2),
        backgroundColor: AppColor.pantone348C,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      ),
      child: child,
    );
  }
}

class ButtonModalOutlineAppComponent extends StatelessWidget {
  const ButtonModalOutlineAppComponent({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColor.pantone348C, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      ),
      child: child,
    );
  }
}
