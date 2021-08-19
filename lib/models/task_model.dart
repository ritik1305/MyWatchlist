// class Task {
//   int id;
//   String title;
//   String director;
//   int status;

//   Task(
//       {required this.id,
//       required this.title,
//       required this.director,
//       required this.status});
//   Task.withID(
//       {required this.id,
//       required this.title,
//       required this.director,
//       required this.status});

//   Map<String, dynamic> toMap() {
//     final map = Map<String, dynamic>();
//     //map['id'] = id;

//     map['id'] = id;
//     map['title'] = title;
//     map['director'] = director;
//     map['status'] = status;
//     return map;
//   }

//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task.withID(
//       id: map['id'],
//       title: map['title'],
//       director: map['director'],
//       status: map['status'],
//     );
//   }
// }
