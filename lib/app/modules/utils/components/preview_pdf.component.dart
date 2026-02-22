import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'toolbars/toolbar_app.component.dart';

class PreviewPDFComponent extends StatefulWidget {
  String? title;
  String? url;
  bool isNetwork;

  PreviewPDFComponent({
    super.key,
    required this.title,
    required this.url,
    required this.isNetwork,
  });

  @override
  State<PreviewPDFComponent> createState() => _PreviewPDFComponentState();
}

class _PreviewPDFComponentState extends State<PreviewPDFComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            onPressedBack: () {
              Navigator.pop(context);
            },
            showMenu: false,
            title: widget.title ?? 'Leitor de PDF',
          ),
        ),
      ),
      body: SafeArea(
        child: widget.isNetwork
            ? SfPdfViewer.network(widget.url.toString())
            : SfPdfViewer.asset(widget.url.toString()),
      ),
    );
  }
}
