import 'package:app_colabora_unimedjp/app/modules/utils/components/inputs/input_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

import '../../../config/colors/colors.dart';

class FilterSelectComponent<T> extends StatefulWidget {
  final String label;
  final int substringLength;
  final List<MenuItemFilterData<T>> itemsData;
  final ValueChanged<String> onChanged;

  const FilterSelectComponent({
    super.key,
    required this.label,
    required this.itemsData,
    required this.substringLength,
    required this.onChanged,
  });

  @override
  State<FilterSelectComponent<T>> createState() =>
      _FilterSelectComponentState<T>();
}

class _FilterSelectComponentState<T> extends State<FilterSelectComponent<T>> {
  String selected = "Todos";

  List<String> get items {
    final data = widget.itemsData
        .map((e) => e.value.toString())
        .toSet()
        .toList();
    data.sort();
    return ["Todos", ...data];
  }

  void _openModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return _FilterModalContent(
          label: widget.label,
          items: items,
          selected: selected,
          onSelect: (value) {
            setState(() {
              selected = value;
            });

            widget.onChanged(value);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openModal,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: AppColor.pantone382C.withOpacity(0.25),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                TextAppComponent(
                  value: widget.label,
                  fontWeight: FontWeight.w800,
                  color: AppColor.pantone7722C,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selected.length > widget.substringLength
                      ? '${selected.substring(0, widget.substringLength)}...'
                      : selected,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterModalContent extends StatefulWidget {
  final List<String> items;
  final String selected;
  final String label;
  final ValueChanged<String> onSelect;

  const _FilterModalContent({
    required this.items,
    required this.label,
    required this.selected,
    required this.onSelect,
  });

  @override
  State<_FilterModalContent> createState() => _FilterModalContentState();
}

class _FilterModalContentState extends State<_FilterModalContent> {
  late List<String> filteredItems;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  void _filter(String query) {
    setState(() {
      filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SizedBox(
        height: 500,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
                SizedBox(width: 8),
                TextAppComponent(
                  value: widget.label,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: AppColor.pantone7722C,
                ),
              ],
            ),
            SizedBox(height: 20),
            InputTextAppComponent(
              textEditingController: controller,
              onChanged: _filter,
              borderRadius: 16,
              borderColor: AppColor.mediumSecondary,
              hintText: 'Buscar...',
              prefixIconData: Icons.search,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          item,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColor.pantone7722C,
                          ),
                        ),
                        trailing: item == widget.selected
                            ? const Icon(
                                Icons.check_circle,
                                color: AppColor.pantone382C,
                              )
                            : null,
                        onTap: () => widget.onSelect(item),
                      ),
                      const Divider(height: 0, color: AppColor.medium),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemFilterData<T> {
  final String label;
  final T value;

  const MenuItemFilterData({required this.label, required this.value});
}
