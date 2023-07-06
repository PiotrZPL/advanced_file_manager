import 'dart:io';

import 'package:flutter/material.dart';

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
        title: const Text("OK"),
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
      listOfFileSystemEntityViews += [
        ListTile(
          title: Text(entity.path.split("/").last),
          leading: entity is Directory ? const Icon(Icons.folder) : const Icon(Icons.file_open),
        )
      ];
    }
    return listOfFileSystemEntityViews;
  }
}