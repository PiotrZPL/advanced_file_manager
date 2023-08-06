import 'package:flutter/material.dart';

import '../pages/directory_page.dart';

void launchDirectoryPage({
  required String directoryName,
  required String directoryPath,
  required BuildContext context
}) {
  Navigator.of(context).push(PageRouteBuilder(pageBuilder: (context, animation1, animation2) => DirectoryPage(
    directoryName: directoryName,
    directoryPath: directoryPath,
  ),
  transitionDuration: Duration.zero,
  reverseTransitionDuration: Duration.zero));
}