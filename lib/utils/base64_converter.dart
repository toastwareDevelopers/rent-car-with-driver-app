import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

class Base64Converter {
  static String encodeImage64(String imagePath) {
    File imageFile = File(imagePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);
    return (base64Image);
  }

  static Uint8List decodeImage64(String base64Image) {
    return (base64Decode(base64Image));
  }
}