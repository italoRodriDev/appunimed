import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/dropdown_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/inputs/input_app.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get_rx/get_rx.dart';

class InputSuggestionsComponent<T> extends StatefulWidget {
  InputSuggestionsComponent({
    this.selectedItem,
    required this.items,
    this.onTap,
    required this.onChanged,
    this.textEditingController,
    this.onSubmitted,
    this.enabled = true,
    this.errorText,
    this.inputFormatters,
    this.autofillHints,
    this.textInputType,
    this.autoFocus = false,
    this.focusNode,
    this.prefixIconData,
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

  Rx<T>? selectedItem;
  List<MenuItemData<T>> items;
  final Function(T) onChanged;

  final Function()? onTap;
  final Function(String)? onSubmitted;
  final dynamic inputFormatters;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final TextInputType? textInputType;
  final bool autoFocus;
  final FocusNode? focusNode;
  final dynamic prefixIconData;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool? enabled;
  final TextEditingController? textEditingController;

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
  State<InputSuggestionsComponent<T>> createState() =>
      _InputSuggestionsComponentState<T>();
}

class _InputSuggestionsComponentState<T>
    extends State<InputSuggestionsComponent<T>> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();

    textEditingController =
        widget.textEditingController ?? TextEditingController();

    if (widget.selectedItem != null) {
      textEditingController.text = widget.items
          .firstWhere(
            (it) => it.value == widget.selectedItem!.value,
            orElse: () =>
                throw "Selected value doe's not exist in the list items",
          )
          .label;

      ever(widget.selectedItem!, (value) {
        textEditingController.text = widget.items
            .firstWhere(
              (it) => it.value == value,
              orElse: () =>
                  throw "Selected value doe's not exist in the list items",
            )
            .label;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<MenuItemData<T>>(
      controller: textEditingController,
      onSelected: (elem) {
        widget.onChanged(elem.value);
      },
      focusNode: widget.focusNode,
      suggestionsCallback: (search) {
        return widget.items
            .where(
              (it) => it.label.toUpperCase().contains(search.toUpperCase()),
            )
            .toList();
      },

      emptyBuilder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Center(child: Text("Nenhum item encontrado"))),
          ],
        );
      },
      builder: (context, controller, focusNode) {
        return InputTextAppComponent(
          enabled: widget.enabled,
          errorText: widget.errorText,
          textEditingController: controller,
          inputFormatters: widget.inputFormatters,
          autofillHints: widget.autofillHints,
          textInputType: widget.textInputType,
          autoFocus: widget.autoFocus,
          focusNode: focusNode,
          prefixIconData: widget.prefixIconData,
          hintText: widget.hintText,
          labelText: widget.labelText,
          helperText: widget.helperText,
          showLabelAboveTextField: widget.showLabelAboveTextField,
          floatingLabelBehavior: widget.floatingLabelBehavior,
          fillColor: widget.fillColor,
          accentColor: widget.accentColor,
          textColor: widget.textColor,
          borderRadius: widget.borderRadius,
          validator: widget.validator,
          showConfirmation: widget.showConfirmation,
          showError: widget.showError,
          verticalPadding: widget.verticalPadding,
          horizontalPadding: widget.horizontalPadding,
          textInputAction: widget.textInputAction,
          borderColor: widget.borderColor,
          counterText: widget.counterText,
          maxLength: widget.maxLength,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          suffixIcon: GestureDetector(
            onTap: () {
              controller.text = "";
            },
            child: Icon(Icons.close, color: AppColor.textColor),
          ),
        );
      },
      itemBuilder: (context, elem) {
        return ListTile(title: Text(elem.label));
      },
    );
  }
}
