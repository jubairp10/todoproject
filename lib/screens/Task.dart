// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class TaskListPage extends StatelessWidget {
//   final String categoryTitle;
//
//   const TaskListPage({required this.categoryTitle, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection('tasks')
//               .where('category', isEqualTo: categoryTitle)
//               .orderBy('date', descending: false)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return const Center(child: Text('No tasks available.'));
//             }
//
//             final tasks = snapshot.data!.docs;
//
//             return ListView.builder(
//               itemCount: tasks.length,
//               itemBuilder: (context, index) {
//                 final task = tasks[index];
//                 return ListTile(
//                   leading: Icon(
//                     task['isCompleted'] ? Icons.check_circle : Icons.radio_button_unchecked,
//                     color: task['isCompleted'] ? Colors.green : Colors.grey,
//                   ),
//                   title: Text(
//                     task['name'],
//                     style: TextStyle(
//                       decoration: task['isCompleted'] ? TextDecoration.lineThrough : null,
//                     ),
//                   ),
//                   onTap: () {
//                     FirebaseFirestore.instance
//                         .collection('tasks')
//                         .doc(task.id)
//                         .update({'isCompleted': !task['isCompleted']});
//                   },
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete, color: Colors.red),
//                     onPressed: () async {
//                       await FirebaseFirestore.instance
//                           .collection('tasks')
//                           .doc(task.id)
//                           .delete();
//
//                       // Update task count
//                       FirebaseFirestore.instance
//                           .collection('categories')
//                           .where('title', isEqualTo: categoryTitle)
//                           .get()
//                           .then((querySnapshot) {
//                         for (var doc in querySnapshot.docs) {
//                           FirebaseFirestore.instance
//                               .collection('categories')
//                               .doc(doc.id)
//                               .update({'taskCount': FieldValue.increment(-1)});
//                         }
//                       });
//                     },
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddTaskDialog(context);
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//
//   void _showAddTaskDialog(BuildContext context) {
//     final TextEditingController taskController = TextEditingController();
//     DateTime selectedDate = DateTime.now();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: const Text('Add Task'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: taskController,
//                     decoration: const InputDecoration(
//                       hintText: 'Enter task name',
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextButton(
//                     onPressed: () async {
//                       final pickedDate = await showDatePicker(
//                         context: context,
//                         initialDate: selectedDate,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                       );
//                       if (pickedDate != null) {
//                         setState(() {
//                           selectedDate = pickedDate;
//                         });
//                       }
//                     },
//                     child: Text(
//                       'Select Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
//                     ),
//                   ),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('Cancel'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     if (taskController.text.isNotEmpty) {
//                       FirebaseFirestore.instance.collection('tasks').add({
//                         'name': taskController.text,
//                         'category': categoryTitle,
//                         'date': Timestamp.fromDate(selectedDate),
//                         'isCompleted': false,
//                       });
//
//                       // Increment task count
//                       FirebaseFirestore.instance
//                           .collection('categories')
//                           .where('title', isEqualTo: categoryTitle)
//                           .get()
//                           .then((querySnapshot) {
//                         for (var doc in querySnapshot.docs) {
//                           FirebaseFirestore.instance
//                               .collection('categories')
//                               .doc(doc.id)
//                               .update({'taskCount': FieldValue.increment(1)});
//                         }
//                       });
//
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }
/////

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskListPage extends StatelessWidget {
  final String categoryTitle;
  final String uid;
  final String categoryId;

  TaskListPage({required this.categoryTitle, super.key, required this.uid, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        actions: [
          IconButton(
            onPressed: () {}, // Add search functionality later
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('tasks')
              .where('category', isEqualTo: categoryTitle)
              .where('uid', isEqualTo: uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No tasks available.'));
            }

            final tasks = snapshot.data!.docs;

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return TaskItem(
                  taskId: task.id,
                  taskName: task['name'],
                  isCompleted: task['isCompleted'], categoryTitle: 'title',
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: taskController,
                decoration: const InputDecoration(hintText: 'Enter task name'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    selectedDate = pickedDate;
                  }
                },
                child: Text(
                  'Select Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  FirebaseFirestore.instance.collection('tasks').add({
                    'name': taskController.text,
                    'category': categoryTitle,
                    'categoryId': categoryId,
                    'uid': uid,
                    'date': Timestamp.fromDate(selectedDate),
                    'isCompleted': false,
                  });
                  FirebaseFirestore.instance
                      .collection('categories')
                      .where('title', isEqualTo: categoryTitle)

                      .get()
                      .then((querySnapshot) {
                    for (var doc in querySnapshot.docs) {
                      FirebaseFirestore.instance
                          .collection('categories')
                          .doc(doc.id)
                          .update({'taskCount': FieldValue.increment(1)});
                    }
                  });

                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class TaskItem extends StatelessWidget {
  final String taskId;
  final String taskName;
  final bool isCompleted;
  final String categoryTitle;

  const TaskItem({
    required this.taskId,
    required this.taskName,
    required this.isCompleted,
    super.key, required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isCompleted ? Colors.green : Colors.grey,
      ),
      title: Text(
        taskName,
        style: TextStyle(
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      onTap: () {
        FirebaseFirestore.instance
            .collection('tasks')
            .doc(taskId)
            .update({'isCompleted': !isCompleted});

      },
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
          FirebaseFirestore.instance
              .collection('categories')
              .where('title', isEqualTo: categoryTitle)
              .get()
              .then((querySnapshot) {
            for (var doc in querySnapshot.docs) {
              FirebaseFirestore.instance
                  .collection('categories')
                  .doc(doc.id)
                  .update({'taskCount': FieldValue.increment(-1)});
            }
          });
        },
      ),
    );
  }
}
////