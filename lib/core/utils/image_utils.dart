import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:medhavi_app/core/di/injection.dart';
import 'package:path_provider/path_provider.dart';

@Injectable()
class ImagePickerUtil {
  final ImagePicker _picker = getIt<ImagePicker>();

// Pick Single Image
  Future<File?> pickSingleImage({required ImageSource source}) async {
    if (kDebugMode) {
      print('\n\nPick Image From $source');
    }
    final XFile? image = await _picker.pickImage(source: source);
    if (kDebugMode) {
      print('My Picked Image => $image');
    }
    if (image != null && image.path.isEmpty) {
      return null;
    } else {
      File? res;
      if (image!.path.split('.').last.contains('.webp')) {
        res = await compressFile(File(image.path));
      } else {
        res = await compressFile(File(image.path));
      }
      return res;
    }
  }

// Pick Multiple Image
  Future<List<File?>?> pickMultiImage() async {
    List<File>? selectedImage = [];
    final imageList = await _picker.pickMultiImage();
    if (kDebugMode) {
      print('My Picked Image => $imageList');
    }
    if (imageList.isEmpty) {
      selectedImage = null;
    } else {
      for (var e in imageList) {
        File? res;
        // if (!e.path.split('.').last.contains('.webp')) {
        //   res = await compressFile(File(e.path),
        //       imageFormat: CompressFormat.webp);
        // }
        //else {
        res = File(e.path);
        //}
        selectedImage.add(res);
      }
    }
    return selectedImage;
  }

// Generate Random String
  String generateRandomString(int lengthOfString) {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
    final randomString = List.generate(lengthOfString,
        (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString; // return the generated string
  }

  Future<File?> compressFile(File file, {CompressFormat? imageFormat}) async {
    var dir = await getTemporaryDirectory();

    String targetPath = '';

    targetPath =
        '${dir.absolute.path}${generateRandomString(20)}${file.path.toString().split('.').last}';

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      minHeight: 500,
      minWidth: 600,
      quality: 90,
      format: imageFormat ?? CompressFormat.jpeg,
    );
    if (result != null) {
      return File(result.path);
    }
    return null;
  }

  FutureOr<List<MultipartFile>> convertSingleFileToMultipart(
      File? image) async {
    var multipartList = <MultipartFile>[];

    if (image != null) {
      multipartList.add(
        await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      );
    }

    return multipartList;
  }

  FutureOr<List<MultipartFile>> convertMultiImageToMultipart(
      List<File?> image) async {
    var multipartList = <MultipartFile>[];

    for (var e in image) {
      if (e != null) {
        multipartList.add(
          await MultipartFile.fromFile(
            e.path,
            filename: e.path.split('/').last,
          ),
        );
      }
    }
    return multipartList;
  }
}
