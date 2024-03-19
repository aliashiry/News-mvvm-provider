// import 'package:flutter/material.dart';
// import 'package:news/core/api/api_manager.dart';
// import 'package:news/core/theme/theme.dart';
// import 'package:news/model/SourceResponse.dart';
// import 'package:news/model/category.dart';
//
// class Fu extends StatefulWidget {
//   CategoryDM category;
//
//   Fu({required this.category});
//
//   @override
//   State<Fu> createState() => _FuState();
// }
//
// class _FuState extends State<Fu> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<SourceResponse>(
//         future: ApiManager.getSources(widget.category.id),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(
//                 backgroundColor: MyTheme.primaryLightColor,
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Column(
//               children: [
//                 const Text(' Something went wrong'),
//                 ElevatedButton(
//                   onPressed: () {
//                     ApiManager.getSources(widget.category.id);
//                     setState(() {});
//                   },
//                   child: const Text('Try again'),
//                 ),
//               ],
//             );
//           }
//           if (snapshot.data?.status != 'ok') {
//             return Column(
//               children: [
//                 Text(snapshot.data!.message!),
//                 ElevatedButton(
//                   onPressed: () {
//                     ApiManager.getSources(widget.category.id);
//                     setState(() {});
//                   },
//                   child: const Text('Try again'),
//                 ),
//               ],
//             );
//           }
//           var sourcesList = snapshot.data?.sources ?? [];
//           return TabWidget(sourcesList: sourcesList);
//         });
//   }
// }
