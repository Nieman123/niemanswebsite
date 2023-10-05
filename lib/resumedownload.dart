import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;

class ResumeDownloadButton extends StatefulWidget {
  @override
  _ResumeDownloadButtonState createState() => _ResumeDownloadButtonState();
}

class _ResumeDownloadButtonState extends State<ResumeDownloadButton> {
  Future<void> _downloadFile() async {
    final byteData =
        await rootBundle.load('assets/Jonathan-Nieman-Resume-10-2-2023.pdf');
    final buffer = byteData.buffer.asUint8List();

    // Convert buffer to blob and trigger a download
    final blob = html.Blob([buffer]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'Jonathan-Nieman-Resume-10-2-2023.pdf'
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
            return null; // Use the component's default.
          },
        ),
      ),
      onPressed: _downloadFile,
      child: Text("Click to Save Resume"),
    );
  }
}
