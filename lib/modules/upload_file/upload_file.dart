import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nasa_space_apps_2022/shared/components/components.dart';
import 'package:nasa_space_apps_2022/shared/network/remote/dio_helper.dart';

import '../../layout/shop_app/app_layout.dart';
import '../../shared/constants/my_colors.dart';

class UploadFiles extends StatefulWidget {
  const UploadFiles({Key? key}) : super(key: key);

  @override
  State<UploadFiles> createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {
  String _fileText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/Space2.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  defaultButton(function: () async {
                    File ?file = await _pickFile();
                    uploadImage(
                        file!);

                  }, text: 'Upload Files',color: Colors.white54,width: 200)
                ],
              ),
            ),
          ),
        ],
      )


    );
  }

  Future<File?>? _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      // allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    File? file;

    if (result != null && result.files.single.path != null) {
      /// Load result and file details
      PlatformFile doc = result.files.first;
      print(doc.name);
      print(doc.bytes);
      print(doc.size);
      print(doc.extension);
      print(doc.path);

      /// normal file
       file = File(result.files.single.path!);
      setState(() {
        _fileText = file!.path;
      });
      return file;
    } else {
      return file;
    }
  }

  void uploadImage(File file) async {
    DioHelper dioHelper = DioHelper();
    String fileName = file.path.split('/').last;
    dio.FormData formData = dio.FormData.fromMap({
      "filename":
      await dio.MultipartFile.fromFile(file.path, filename:fileName),
    });
    dio.Response response = await dio.Dio().post("http://b54c-213-181-229-223.ngrok.io/predict", data: formData);
    print(response.data);
    navigateTo(context, HomeLayout());



  }
}
