import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

import '../tools/launch_directory_page.dart';
import '../tools/get_icon_for_entity.dart';

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
  String? selectedFile = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.directoryName),
      ),
      body: Center(
        child: FutureBuilder<List<Widget>>(
          future: buildViews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!
              );
            }
            else if (snapshot.hasError) {
              if (snapshot.error is PathAccessException) {
                return const Text("Cannot access this location: permission denied.");
              }
              return const Text("ERROR 101");
            }
            return const CircularProgressIndicator();
          }
        )
      ),
      bottomNavigationBar: selectedFile != null ? BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copy
                    ),
                    Text(
                      "Copy",
                    ),
                  ],
                ),
              )
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cut
                    ),
                    Text(
                      "Move",
                    )
                  ]
                )
              )
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit
                    ),
                    Text(
                      "Rename",
                    )
                  ]
                )
              )
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete
                    ),
                    Text(
                      "Delete",
                    )
                  ]
                )
              )
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.more_vert
                    ),
                    Text(
                      "More",
                    )
                  ]
                )
              )
            )
          ],
        )
      ) : null
    );
  }

  Future<List<Widget>> buildViews() async {
    List<Widget> listOfFileSystemEntityViews = [];
    List<FileSystemEntity> listOfFileSystemEntities = await Directory(widget.directoryPath).list().toList();
    listOfFileSystemEntities.sort(((a, b) => a.path.split("/").last.compareTo(b.path.split("/").last)));
    for (FileSystemEntity entity in listOfFileSystemEntities) {
      String directoryName = entity.path.split("/").last;
      listOfFileSystemEntityViews += [
        ListTile(
          title: Text(directoryName),
          leading: getIconForEntity(entity),
          selected: selectedFile == entity.path ? true : false,
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
          onLongPress: () {
            setState(() {
              if (selectedFile == entity.path) {
                selectedFile = null;
              }
              else {
                selectedFile = entity.path;
              }
            });
          },
        )
      ];
    }
    return listOfFileSystemEntityViews;
  }
}