import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

import '../tools/launch_directory_page.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({
    super.key,
    required this.directoryName,
    required this.directoryPath
  });

  final String directoryName;
  final String directoryPath;

  @override
  State<DirectoryPage> createState() => _DirectoryPageState();
}

class _DirectoryPageState extends State<DirectoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.directoryName),
      ),
      body: Center(
        child: ListView(
          children: buildViews()
        )
      ),
    );
  }

  List<Widget> buildViews() {
    List<Widget> listOfFileSystemEntityViews = [];
    List<FileSystemEntity> listOfFileSystemEntities = Directory(widget.directoryPath).listSync();
    listOfFileSystemEntities.sort(((a, b) => a.path.split("/").last.compareTo(b.path.split("/").last)));
    for (FileSystemEntity entity in listOfFileSystemEntities) {
      String directoryName = entity.path.split("/").last;
      listOfFileSystemEntityViews += [
        ListTile(
          title: Text(directoryName),
          leading: entity is Directory ? const Icon(Icons.folder) : const Icon(Icons.file_open),
          onTap: () async {
            if (entity is Directory) {
                launchDirectoryPage(
                context: context,
                directoryName: directoryName,
                directoryPath: entity.path
              );
            }
            else if (entity is File) {
              if (entity.path.endsWith(".apk")) {
                Permission.requestInstallPackages.request();
              }
              OpenFile.open(entity.path);
            }
          },
        )
      ];
    }
    return listOfFileSystemEntityViews;
  }
}