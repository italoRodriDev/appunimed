import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_loader_flutter/image_loader_flutter.dart';

class AvatarAppComponent extends StatelessWidget {
  final double radius;
  final String? imageUrl;
  final String? base64;
  final Color? borderColor;
  final Color notificationColor;
  final int? notificationCount;
  final File? imageFile;

  const AvatarAppComponent({
    this.imageUrl,
    this.base64,
    this.radius = 36,
    this.borderColor,
    this.notificationCount,
    this.notificationColor = Colors.red,
    this.imageFile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (base64 == null && imageUrl == null && imageFile == null) {
      throw "Unnable to load image: imageUrl, base64 and imageFile both is null";
    }

    Uint8List? iconBytes;

    if (base64 != null) {
      iconBytes = base64Decode(base64!);
    }

    double size = radius * 2;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size,
          width: size,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: borderColor != null
                ? Border.all(color: borderColor!, width: size * .033)
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: iconBytes != null
                ? Image.memory(iconBytes, fit: BoxFit.cover)
                : imageFile != null
                ? Image.file(imageFile!, fit: BoxFit.cover)
                : ImageLoaderFlutterWidgets(
                    onTap: false,
                    circle: true,
                    radius: 100,
                    image: imageUrl,
                    fit: BoxFit.cover,
                    bgColor: AppColor.neutral3,
                    placeHolderWidget: Image.asset('assets/images/avatar.png'),
                  ),
          ),
        ),
        if (notificationCount != null) ...[
          Positioned(
            top: size / -50,
            right: size / -50,
            child: Container(
              width: size / 3.33,
              height: size / 3.33,
              decoration: ShapeDecoration(
                color: notificationColor,
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Text(
                  // Could use package such as AutoSizeText to accommodate larger numbers
                  notificationCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size / 5,
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
