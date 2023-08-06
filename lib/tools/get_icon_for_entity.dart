import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'get_file_type.dart';
import 'enums/file_type.dart';

Widget getIconForEntity(FileSystemEntity entity) {
  if (entity is File) {
    FileType fileType = getFileType(entity.path);
    switch (fileType) {
      case FileType.apk:
        return SvgPicture.asset("assets/icons/file-apk.svg");
      case FileType.archive:
        return SvgPicture.asset("assets/icons/file-archive.svg");
      case FileType.audio:
        return SvgPicture.asset("assets/icons/file-audio.svg");
      case FileType.document:
        return SvgPicture.asset("assets/icons/file-document-word.svg");
      case FileType.image:
        return SvgPicture.asset("assets/icons/file-image.svg");
      case FileType.pdf:
        return SvgPicture.asset("assets/icons/file-pdf.svg");
      case FileType.video:
        return SvgPicture.asset("assets/icons/file-video.svg");
      default:
        return SvgPicture.asset("assets/icons/file-text.svg");
    }
  }
  return SvgPicture.asset("assets/icons/folder.svg");
}