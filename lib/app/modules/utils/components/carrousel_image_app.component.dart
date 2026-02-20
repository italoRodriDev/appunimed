import 'dart:io';

import 'package:flutter/material.dart';

import '../../../config/colors/colors.dart';
import '../extensions/convert.extencion.dart';
import 'progress_app.component.dart';

enum IndicatorType { dots, numbered }

class CarrouselImageAppComponent extends StatefulWidget {
  const CarrouselImageAppComponent({
    required this.imageUrls,
    required this.titles,
    this.dotColor = Colors.white,
    this.heightImage,
    this.heightBox,
    this.type = IndicatorType.dots,
    this.pageController,
    this.onPageChanged,
    this.emptyListWidget,
    this.radiusImage,
    this.descriptions,
    required this.onClick,
    super.key,
  });

  final double? radiusImage;
  final double? heightImage;
  final double? heightBox;
  final List<dynamic> imageUrls;
  final List<String> titles;
  final Color dotColor;
  final List<String>? descriptions;
  final IndicatorType type;
  final Widget? emptyListWidget;
  final Function(int)? onPageChanged;
  final PageController? pageController;
  final Function(int) onClick;

  @override
  State<CarrouselImageAppComponent> createState() =>
      _CarrouselImageAppComponentState();
}

class _CarrouselImageAppComponentState
    extends State<CarrouselImageAppComponent> {
  late int activeIndex;
  late PageController _controller;

  static const int _initialPage = 1000;

  @override
  void initState() {
    super.initState();
    activeIndex = 0;

    _controller =
        widget.pageController ?? PageController(initialPage: _initialPage);
  }

  void setActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  int _realIndex(int index) {
    return index % widget.imageUrls.length;
  }

  Widget _buildDottedIndicators() {
    const double radius = 8;

    List<Widget> dots = List.generate(widget.imageUrls.length, (i) {
      return Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: i == activeIndex
              ? widget.dotColor
              : widget.dotColor.withOpacity(.6),
        ),
      );
    });

    dots = intersperse(const SizedBox(width: 6), dots).toList();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: dots),
      ),
    );
  }

  Widget _buildNumberedIndicators() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.33),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Text(
            '${activeIndex + 1} / ${widget.imageUrls.length}',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(dynamic imageData) {
    if (imageData is File) {
      return Image.file(
        imageData,
        fit: BoxFit.cover,
        height: widget.heightImage,
      );
    }

    if (imageData is String && imageData.startsWith('http')) {
      return Image.network(
        imageData,
        fit: BoxFit.cover,
        height: widget.heightImage,
      );
    }

    if (imageData is String && imageData.startsWith('data:image')) {
      return FutureBuilder(
        future: ConvertData.base64ToFile(
          imageData,
          '${DateTime.now().millisecondsSinceEpoch}.jpg',
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: ProgressAppComponent());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, color: Colors.grey),
            );
          }

          return Image.file(
            snapshot.data!,
            fit: BoxFit.cover,
            height: widget.heightImage,
          );
        },
      );
    }

    return Image.asset(
      imageData,
      fit: BoxFit.cover,
      height: widget.heightImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.imageUrls.isNotEmpty
        ? SizedBox(
            height: widget.heightBox ?? 200,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: null,
                  onPageChanged: (value) {
                    final index = _realIndex(value);
                    setActiveIndex(index);
                    widget.onPageChanged?.call(index);
                  },
                  itemBuilder: (context, index) {
                    final realIndex = _realIndex(index);

                    return InkWell(
                      onTap: () => widget.onClick(realIndex),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          widget.radiusImage ?? 0,
                        ),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: _buildImage(widget.imageUrls[realIndex]),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Colors.black, Colors.transparent],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 33,
                              left: 12,
                              right: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    widget.titles[realIndex],
                                    style: TextStyle(
                                      color: AppColor.pantone382C,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      shadows: const [
                                        Shadow(
                                          blurRadius: 4,
                                          color: Colors.black54,
                                          offset: Offset(1, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (widget.descriptions != null)
                                    Text(
                                      widget.descriptions![realIndex],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                            offset: Offset(1, 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (widget.imageUrls.length > 1)
                  widget.type == IndicatorType.dots
                      ? _buildDottedIndicators()
                      : _buildNumberedIndicators(),
              ],
            ),
          )
        : widget.emptyListWidget ?? const SizedBox();
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
