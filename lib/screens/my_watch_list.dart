// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:mywatchlist/helpers/database_helper.dart';
// import 'package:mywatchlist/models/task_model.dart';
// import 'package:mywatchlist/screens/add_movie_screen.dart';

// class MyWatchListScreen extends StatefulWidget {
//   const MyWatchListScreen({Key? key}) : super(key: key);

//   @override
//   _MyWatchListScreenState createState() => _MyWatchListScreenState();
// }

// class _MyWatchListScreenState extends State<MyWatchListScreen> {
//   late Future<List<Task>> _taskList;

//   @override
//   void initState() {
//     super.initState();
//     _updateTaskList();
//   }

//   _updateTaskList() {
//     setState(() {
//       _taskList = DatabaseHelper.instance.getTaskList();
//     });
//   }

//   Widget _buildTask(Task task) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 25.0),
//       child: Column(
//         children: [
//           ListTile(
//             title: Text(
//               task.title,
//               style: TextStyle(
//                   fontSize: 18.0,
//                   decoration: task.status == 0
//                       ? TextDecoration.none
//                       : TextDecoration.lineThrough),
//             ),
//             //subtitle: Text('Hi'),
//             trailing: Checkbox(
//               onChanged: (value) {
//                 if (value != null) {
//                   task.status = value ? 1 : 0;
//                   DatabaseHelper.instance.updateTask(task);
//                   _updateTaskList();
//                 }
//               },
//               activeColor: Theme.of(context).primaryColor,
//               value: true,
//             ),
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (_) => AddMovieScreen(
//                   updateTaskList: _updateTaskList(),
//                   task: task,
//                 ),
//               ),
//             ),
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         child: Icon(Icons.add),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => AddMovieScreen(
//               updateTaskList: _updateTaskList(),
//             ),
//           ),
//         ),
//       ),
//       body: FutureBuilder(
//         future: _taskList,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           final int completedTaskCount = snapshot.data
//               .where((Task task) => task.status = 1)
//               .toList()
//               .length;

//           return ListView.builder(
//             padding: EdgeInsets.symmetric(vertical: 80.0),
//             itemCount: 1 + snapshot.data.length,
//             itemBuilder: (BuildContext context, int index) {
//               if (index == 0) {
//                 return Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'My List',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 40.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Text(
//                         '$completedTaskCount of ${snapshot.data?.length}',
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                 );
//               }

//               return _buildTask(snapshot.data[index - 1]);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
