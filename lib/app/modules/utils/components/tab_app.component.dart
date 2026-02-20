import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';

class TabsAppComponent extends StatefulWidget {
  final List<String> titlesTabs;
  final List<Widget> contentTabs;
  final double fontSize;
  final Function(int) onChangeIndex;

  const TabsAppComponent({
    Key? key,
    required this.fontSize,
    required this.titlesTabs,
    required this.contentTabs,
    required this.onChangeIndex,
  }) : super(key: key);

  @override
  _TabsAppComponentState createState() => _TabsAppComponentState();
}

class _TabsAppComponentState extends State<TabsAppComponent> {
  late int tabIndex;

  @override
  void initState() {
    super.initState();
    tabIndex = 0;
  }

  setTabIndex(int value) {
    setState(() {
      tabIndex = value;
      widget.onChangeIndex(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: TextTabs(
                labels: widget.titlesTabs,
                onTabChange: setTabIndex,
                fontSize: widget.fontSize,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        widget.contentTabs[tabIndex],
      ],
    );
  }
}

class TextTabs extends StatefulWidget {
  const TextTabs({
    required this.labels,
    this.onTabChange,
    required this.fontSize,
    Key? key,
  }) : super(key: key);
  final double fontSize;
  final List<String> labels;
  final Function(int)? onTabChange;

  @override
  _TextTabsState createState() => _TextTabsState();
}

class _TextTabsState extends State<TextTabs> {
  late int selectedIndex;
  late String selectedTitle;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  callback() {
    if (widget.onTabChange != null) widget.onTabChange!(selectedIndex);
  }

  setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    callback();
  }

  Widget _buildIndividualTab({required String label, Function()? onTap}) {
    int indexOfLabel = widget.labels.indexOf(label);
    bool isActive = selectedIndex == indexOfLabel;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setSelectedIndex(indexOfLabel);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        width: 162,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: isActive ? AppColor.primary : AppColor.neutral4,
          /*border: isActive
              ? Border(
                  bottom: BorderSide(
                    width: 2,
                  ),
                )
              : null,*/
        ),
        child: Text(
          (label.length > 17) ? ('${label.substring(0, 17)}...') : label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? AppColor.background : AppColor.tertiary,
            fontSize: widget.fontSize ?? 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextTabs() {
    return widget.labels.map((label) {
      return _buildIndividualTab(
        label: label,
        onTap: () {
          setSelectedIndex(widget.labels.indexOf(label));
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: intersperse(
            const SizedBox(width: 20),
            _buildTextTabs(),
          ).toList(),
        ),
        const Divider(height: 0, thickness: 1),
      ],
    );
  }
}

Iterable<T> intersperse<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}
