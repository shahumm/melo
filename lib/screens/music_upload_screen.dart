import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class MusicUploadScreen extends StatefulWidget {
  @override
  _MusicUploadScreenState createState() => _MusicUploadScreenState();
}

class _MusicUploadScreenState extends State<MusicUploadScreen> {
  List<String> selectedFiles = [];

  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.audio,
    );

    if (result != null) {
      setState(() {
        selectedFiles = result.paths.map((path) => path!).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Music')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickFiles,
              child: Text("Select Music Files"),
            ),
            SizedBox(height: 20),
            selectedFiles.isNotEmpty
                ? Column(
                    children: selectedFiles.map((file) => Text(file)).toList(),
                  )
                : Text('No files selected'),
          ],
        ),
      ),
    );
  }
}
