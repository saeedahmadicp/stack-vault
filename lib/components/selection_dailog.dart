// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:file_picker/file_picker.dart';
//
// class Testing extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }
//
// class _AppState extends State<Testing> {
//   String data;
//   String dirPath;
//   FilePickerResult result;
//   List<FileSystemEntity> file = new List<FileSystemEntity>();
//
//   Future<String> getStoragePath() async {
//     final directory = await getApplicationDocumentsDirectory();
//     //final directory = await getApplicationDocumentsDirectory();
//     print(directory.path);
//     dirPath = directory.path;
//     return dirPath;
//   }
//
//   // void getAllFiles() async {
//   //   //  final path = await _localPath;
//   //   result = await FilePicker.platform.pickFiles(
//   //       allowMultiple: true, withData: true, allowedExtensions: ['.txt']);
//   // }
//
//   void getAllFiles() async {
//     Directory dir = new Directory(dirPath);
//     List<File> files = dir.listSync();
//
//     for (FileSystemEntity file in files) {
//       FileStat f1 = file.statSync();
//       print(f1.toString());
//     }
//   }
//
//   // void readContent() async {
//   //   try {
//   //     final file = await _localFile;
//   //     // Read the file
//   //     String contents = await file.readAsString();
//   //     print(contents);
//   //   } catch (e) {
//   //     // If encountering an error, return
//   //   }
//   // }
//
//   // List<Text> showFileName() {
//   //   List<Text> textWidgets = List<Text>();
//   //   textWidgets.add(
//   //     new Text(result.files[0].name.toString()),
//   //   );
//   //   return textWidgets;
//   // }
//   //
//   Future<void> writeContent() async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     // String appDocPath = "${appDocDir.path}/encrypt";
//     Directory encryptDir = Directory('${appDocDir.path}/encrypt');
//     //File ourFile = File('$appDocPath/greeting.txt');
//     //ourFile.writeAsString('Hello, Flutter Buddy');
//     setState(() {
//       // textContent = 'File was written';
//     });
//
//     print(appDocDir.listSync());
//     print(encryptDir.listSync());
//     // FilePickerResult result = await FilePicker.platform.pickFiles(
//     //     type: FileType.custom,
//     //     allowedExtensions: ['.txt'],
//     //     allowMultiple: true);
//     //  print()
//     //print("FileName is: " + appDocDir.listSync()[2].toString());
//   }
//
//   Future<String> createDirectory() async {
//     // Creates dir/ and dir/subdir/.
//     Directory dir = await getApplicationDocumentsDirectory();
//     dirPath = dir.path;
//     var directory = await Directory('$dirPath/decrypt').create(recursive: true);
//     print(directory.path);
//     dirPath = directory.path;
//     return directory.path;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     //  getStoragePath();
//   }
//
//   // void getFiles() async {
//   //   result = await FilePicker.platform.pickFiles(allowedExtensions: ['.txt']);
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Reading and Writing data')),
//       body: Column(
//         children: [
//           Center(
//             child: RaisedButton(
//               child: Text('Click Me'),
//               onPressed: () {
//                 //  createDirectory();
//                 writeContent();
//
//                 //  print(file);
//                 //print(result);
//                 // writeContent();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
