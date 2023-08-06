import 'dart:io';

import 'package:flutter/material.dart';

import 'get_file_type.dart';
import 'enums/file_type.dart';

Widget getIconForEntity(FileSystemEntity entity) {
  if (entity is File) {
    FileType fileType = getFileType(entity.path);
    switch (fileType) {
      case FileType.apk:
        return const Icon(Icons.android);
      case FileType.archive:
        return const Icon(Icons.archive, size: 40,);
      case FileType.audio:
        return const Icon(Icons.music_note, size: 40,);
      case FileType.document:
        return const Icon(Icons.edit_document, size: 40,);
      case FileType.image:
        return const Icon(Icons.image, size: 40,);
      case FileType.pdf:
        return const Icon(Icons.picture_as_pdf, size: 40,);
      case FileType.video:
        return const Icon(Icons.movie, size: 40,);
      default:
        return const Icon(Icons.file_present, size: 40,);
    }
  }
  return const Icon(Icons.folder, size: 40,);
}