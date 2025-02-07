import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/screens/drawer.dart';
import '../utilitis/categorycard.dart';
import 'Task.dart';

class CategoriesPage extends StatelessWidget {
  final String uid;
  CategoriesPage({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          },
          icon: const Icon(Icons.account_circle),
        ),
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: () {}, // Add search functionality later
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 450,
              decoration: BoxDecoration(shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(10),color: Colors.brown),
              child: Row(  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Center(
                    child: const Text(
                      '"The memories is a shield and life helper."',
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _showAddCategoryDialog(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, size: 24, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Add Category',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:  FirebaseFirestore.instance
                    .collection('categories')
                    .where('uid', isEqualTo: uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No categories found.'));
                  }
                  final categories = snapshot.data!.docs;
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return CategoryCard(
                        title: category['title'],
                        taskCount: category['taskCount'],
                        icon: IconData(category['icon'], fontFamily: 'MaterialIcons'),


                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    final TextEditingController categoryController = TextEditingController();
    IconData? selectedIcon;
    final List<IconData> iconList = [
      Icons.folder,
      Icons.work,
      Icons.home,
      Icons.school,
      Icons.shopping_cart,
      Icons.fitness_center,
    ];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Add Category'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(hintText: 'Enter category name'),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    children: iconList.map((icon) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIcon = icon;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: selectedIcon == icon ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(icon, size: 32, color: selectedIcon == icon ? Colors.white : Colors.black),
                        ),
                      );
                    }).toList(),
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
                    if (categoryController.text.isNotEmpty && selectedIcon != null) {
                      FirebaseFirestore.instance.collection('categories').add({
                        'title': categoryController.text,
                        'taskCount': 0,
                        'icon': selectedIcon!.codePoint,
                        'uid': uid,
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
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:todoapp/screens/drawer.dart';
// import '../utilitis/categorycard.dart';
// import 'Task.dart';
//
// class CategoriesPage extends StatelessWidget {
//   final String uid;
//   CategoriesPage({super.key, required this.uid});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
//           },
//           icon: const Icon(Icons.account_circle),
//         ),
//         title: const Text('Categories'),
//         actions: [
//           IconButton(
//             onPressed: () {}, // Add search functionality later
//             icon: const Icon(Icons.search),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 100,
//                   width: 450,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.brown,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.person),
//                       Center(
//                         child: const Text(
//                           '"The memories is a shield and life helper."',
//                           style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Expanded(
//                   child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('categories')
//                         .where('uid', isEqualTo: uid)
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//                       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                         return const Center(child: Text('No categories found.'));
//                       }
//                       final categories = snapshot.data!.docs;
//                       return GridView.builder(
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 16,
//                           mainAxisSpacing: 16,
//                           childAspectRatio: 1.2,
//                         ),
//                         itemCount: categories.length,
//                         itemBuilder: (context, index) {
//                           final category = categories[index];
//                           return CategoryCard(
//                             title: category['title'],
//                             taskCount: category['taskCount'],
//                             icon: IconData(category['icon'], fontFamily: 'MaterialIcons'),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: FloatingActionButton(
//               onPressed: () {
//                 _showAddCategoryDialog(context);
//               },
//               child: const Icon(Icons.add),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showAddCategoryDialog(BuildContext context) {
//     final TextEditingController categoryController = TextEditingController();
//     IconData? selectedIcon;
//     final List<IconData> iconList = [
//       Icons.folder,
//       Icons.work,
//       Icons.home,
//       Icons.school,
//       Icons.shopping_cart,
//       Icons.fitness_center,
//     ];
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               title: const Text('Add Category'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: categoryController,
//                     decoration: const InputDecoration(hintText: 'Enter category name'),
//                   ),
//                   const SizedBox(height: 16),
//                   Wrap(
//                     spacing: 10,
//                     children: iconList.map((icon) {
//                       return GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedIcon = icon;
//                           });
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: selectedIcon == icon ? Colors.blue : Colors.grey[300],
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Icon(icon, size: 32, color: selectedIcon == icon ? Colors.white : Colors.black),
//                         ),
//                       );
//                     }).toList(),
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
//                     if (categoryController.text.isNotEmpty && selectedIcon != null) {
//                       FirebaseFirestore.instance.collection('categories').add({
//                         'title': categoryController.text,
//                         'taskCount': 0,
//                         'icon': selectedIcon!.codePoint,
//                         'uid': uid,
//                       });
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

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'task_list_page.dart';
//
// class CategoriesPage extends StatelessWidget {
//   const CategoriesPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Categories'),
//         actions: [
//           IconButton(
//             onPressed: () {}, // Add search functionality later
//             icon: const Icon(Icons.search),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               '"The memories is a shield and life helper."',
//               style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//             ),
//             const SizedBox(height: 20),
//             // Pinned Add Button
//             GestureDetector(
//               onTap: () {
//                 _showAddCategoryDialog(context);
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.grey[800],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Icon(Icons.add, size: 24, color: Colors.blue),
//                     SizedBox(width: 10),
//                     Text(
//                       'Add Category',
//                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Categories Grid
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance.collection('categories').snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return const Center(child: Text('No categories found.'));
//                   }
//                   final categories = snapshot.data!.docs;
//                   return GridView.builder(
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 16,
//                       childAspectRatio: 1.2,
//                     ),
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       final category = categories[index];
//                       return CategoryCard(
//                         title: category['title'],
//                         taskCount: category['taskCount'],
//                         icon: Icons.folder, // Replace with specific icons
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showAddCategoryDialog(BuildContext context) {
//     final TextEditingController categoryController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Category'),
//           content: TextField(
//             controller: categoryController,
//             decoration: const InputDecoration(hintText: 'Enter category name'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (categoryController.text.isNotEmpty) {
//                   FirebaseFirestore.instance.collection('categories').add({
//                     'title': categoryController.text,
//                     'taskCount': 0,
//                   });
//                   Navigator.pop(context);
//                 }
//               },
//               child: const Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CategoryCard extends StatelessWidget {
//   final String title;
//   final int taskCount;
//   final IconData icon;
//
//   const CategoryCard({
//     required this.title,
//     required this.taskCount,
//     required this.icon,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//       Navigator.push(
//           context,
//           Mat
