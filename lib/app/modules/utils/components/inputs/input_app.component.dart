import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputTextAppComponent extends StatefulWidget {
  const InputTextAppComponent({
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onChangeObscureText,
    this.enabled = true,
    this.errorText,
    this.textEditingController,
    this.inputFormatters,
    this.autofillHints,
    this.obscureText,
    this.textInputType,
    this.autoFocus = false,
    this.focusNode,
    this.prefixIconData,
    this.suffixIcon,
    this.hintText,
    this.labelText,
    this.helperText,
    this.showLabelAboveTextField = true,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.fillColor,
    this.accentColor,
    this.textColor = Colors.black,
    this.borderRadius = 12,
    this.validator,
    this.showConfirmation = true,
    this.showError = true,
    this.verticalPadding = 12,
    this.horizontalPadding = 16,
    this.textInputAction,
    this.borderColor = Colors.grey,
    this.counterText = '',
    this.maxLength = 100,
    this.minLines,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(bool)? onChangeObscureText;
  final Function(String)? onSubmitted;
  final dynamic inputFormatters;
  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final TextInputType? textInputType;
  final bool autoFocus;
  final FocusNode? focusNode;
  final dynamic prefixIconData;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool? obscureText;
  final bool? enabled;

  /// Text placed below the text field
  final String? helperText;
  final bool showLabelAboveTextField;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Color? fillColor;
  final Color? accentColor;
  final Color? borderColor;
  final Color textColor;
  final double borderRadius;
  final bool Function(String)? validator;
  final bool showConfirmation;
  final bool showError;
  final double verticalPadding;
  final double horizontalPadding;
  final String? counterText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;

  @override
  State<InputTextAppComponent> createState() => _InputTextComponentState();
}

class _InputTextComponentState extends State<InputTextAppComponent> {
  FocusNode? focusNode;
  TextEditingController? textEditingController;
  late bool hasConfirmation;
  late bool hasError;
  late bool hasFocus;
  late bool obscureText;

  @override
  void initState() {
    hasFocus = false;
    textEditingController =
        widget.textEditingController ?? TextEditingController();
    hasConfirmation = isValid;
    hasError = textEditingController != null ? !isValid : false;
    focusNode = widget.focusNode ?? FocusNode();
    obscureText = widget.obscureText ?? false;

    focusNode!.addListener(() {
      setState(() {
        hasFocus = focusNode!.hasPrimaryFocus;
        bool valid = isValid;
        hasConfirmation = valid;
        hasError = !valid;
      });
    });
    super.initState();
  }

  bool get isValid {
    if (hasValidator) {
      return widget.validator!(textEditingController!.text);
    }
    return false;
  }

  bool get hasValidator {
    return widget.validator != null;
  }

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
      widget.onChangeObscureText?.call(
        obscureText,
      ); // Chama a função apenas se ela não for null
    });
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder buildFocusedBorder() {
      if (hasValidator) {
        if (hasConfirmation && widget.showConfirmation) {
          return OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 1.25),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        } else if (hasError) {
          return OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.25),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        }
      }
      return OutlineInputBorder(
        borderSide: BorderSide(
          color: widget.accentColor ?? Theme.of(context).primaryColor,
          width: 1.25,
        ),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
    }

    OutlineInputBorder buildEnabledBorder() {
      if (hasValidator) {
        if (hasConfirmation) {
          return OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        } else if (hasError) {
          return OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          );
        }
      }
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(
          color: widget.borderColor ?? Theme.of(context).primaryColor,
        ),
      );
    }

    TextStyle? buildLabelStyle() {
      if (hasFocus) {
        return TextStyle(color: widget.textColor);
      } else {
        return null;
      }
    }

    IconButton? buildSuffixIcon() {
      if (widget.obscureText != null && widget.obscureText!) {
        return IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: widget.accentColor,
            size: 25,
          ),
          onPressed: toggleObscureText,
        );
      }
      return null;
    }

    return TextSelectionTheme(
      data: TextSelectionThemeData(
        selectionColor:
            widget.accentColor?.withOpacity(.33) ??
            Theme.of(context).primaryColor.withOpacity(.33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null && widget.showLabelAboveTextField) ...[
            Text(
              widget.labelText!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: AppFont.UnimedSans,
                color: AppColor.pantone7722C,
              ),
            ),
            const SizedBox(height: 6),
          ],
          TextField(
            onSubmitted: (dynamic val) {
              if (val != null) {
                if (widget.onSubmitted != null) {
                  widget.onSubmitted!(val);
                }
              }
            },
            enabled: widget.enabled,
            focusNode: focusNode,
            maxLength: widget.maxLength ?? 100,
            minLines: widget.minLines ?? 1,
            maxLines: widget.maxLines ?? 1,
            inputFormatters: widget.inputFormatters ?? [],
            obscureText: obscureText,
            controller: textEditingController,
            autofillHints: widget.autofillHints,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            autofocus: widget.autoFocus,
            onTap: widget.onTap,
            onChanged: (val) {
              setState(() {
                hasError = false;
                hasConfirmation = isValid;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(val);
              }
            },
            style: TextStyle(color: widget.textColor),
            cursorColor: AppColor.pantone382C,
            decoration: InputDecoration(
              counterText: widget.counterText ?? '',
              errorText: widget.errorText,
              contentPadding: EdgeInsets.symmetric(
                vertical: widget.verticalPadding,
                horizontal: widget.horizontalPadding,
              ),
              isDense: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: widget.enabled == true 
                ? Colors.grey.withOpacity(.6)
                : AppColor.primary
              ),
              labelText: widget.showLabelAboveTextField
                  ? null
                  : widget.labelText,
              labelStyle: buildLabelStyle(),
              floatingLabelBehavior: widget.floatingLabelBehavior,
              fillColor: widget.fillColor,
              filled: widget.fillColor != null,
              focusedBorder: buildFocusedBorder(),
              enabledBorder: buildEnabledBorder(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              prefixIcon: widget.prefixIconData != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      child: widget.prefixIconData is IconData
                          ? Icon(
                              widget.prefixIconData,
                              color: hasFocus
                                  ? widget.accentColor
                                  : widget.textColor.withOpacity(.6),
                              size: 25,
                            )
                          : SvgPicture.asset(
                              widget.prefixIconData,
                              color: hasFocus
                                  ? widget.accentColor
                                  : widget.textColor.withOpacity(.6),
                            ),
                    )
                  : null,
              prefixIconConstraints: const BoxConstraints(
                minHeight: 24,
                minWidth: 24,
              ),
              suffixIcon: widget.suffixIcon ?? buildSuffixIcon(),
            ),
          ),
          if (widget.helperText != null) ...[
            const SizedBox(height: 6),
            Text(widget.helperText!, style: TextStyle(color: Colors.grey[600])),
          ],
        ],
      ),
    );
  }
}
