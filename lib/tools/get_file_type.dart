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
      case "webm":
        return FileType.video;
      case "mp3":
        return FileType.audio;
      case "mp2":
        return FileType.audio;
      case "ogg":
        return FileType.audio;
      case "pdf":
        return FileType.pdf;
      case "zip":
        return FileType.archive;
      case "doc":
        return FileType.wordDocument;
      case "docx":
        return FileType.wordDocument;
      case "odt":
        return FileType.wordDocument;
      case "ppt":
        return FileType.presentationDocument;
      case "pptx":
        return FileType.presentationDocument;
      case "odp":
        return FileType.presentationDocument;
      case "xls":
        return FileType.spreadsheetDocument;
      case "xlsx":
        return FileType.spreadsheetDocument;
      case "ods":
        return FileType.spreadsheetDocument;
      case "apk":
        return FileType.apk;
    }
  }
  return FileType.unknown;
}