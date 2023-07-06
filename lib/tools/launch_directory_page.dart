import 'package:flutter/material.dart';

import '../pages/directory_page.dart';

void launchDirectoryPage({
  required String directoryName,
  required String directoryPath,
  required BuildContext context
}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DirectoryPage(
    directoryName: directoryName,
    directoryPath: directoryPath,
  )));
}