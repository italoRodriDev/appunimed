import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';

class FilterItem<T> {
  final String label;
  final T value;

  FilterItem({required this.label, required this.value});
}

class FilterSearch<T> extends StatelessWidget {
  const FilterSearch({
    super.key,
    required this.listItems,
    required this.selectedValue,
    required this.onPress,
  });

  final T selectedValue;
  final Function(String value) onPress;
  final List<FilterItem> listItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsGeometry.only(left: 5, right: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (index > 0) SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    onPress(listItems[index].value);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: selectedValue == listItems[index].value
                            ? AppColor.pantone1585C
                            : Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      listItems[index].label,
                      style: TextStyle(
                        color: selectedValue == listItems[index].value
                            ? AppColor.pantone1585C
                            : Color(0xFF9BD4BE),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
