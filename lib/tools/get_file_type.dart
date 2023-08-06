import 'enums/file_type.dart';

FileType getFileType(String path) {
  String fileName = path.split("/").last;
  if (fileName.contains(".")) {
    String fileExtension = fileName.toLowerCase().split(".").last;
    switch (fileExtension) {
      case "jpg":
        return FileType.image;
      case "jpeg":
        return FileType.image;
      case "webp":
        return FileType.image;
      case "png":
        return FileType.image;
      case "mp4":
        return FileType.video;
      case "mkv":
        return FileType.video;
      case "m4v":
        return FileType.video;
      case "avi":
        return FileType.video;
      case "pdf":
        return FileType.pdf;
      case "zip":
        return FileType.archive;
    }
  }
  return FileType.unknown;
}