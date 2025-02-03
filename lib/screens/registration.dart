// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// void main(){
//   runApp(MaterialApp(home:Login() ,));
// }
// class Login extends StatelessWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text('Mimo'),
//           TextField(
//             decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: "FullName"
//             ),),
//           TextField(
//             decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: "Email"
//             ),),
//           TextField(
//             decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: "Password"
//             ),),
//
//           TextField(
//             decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: "ConfirmPassword"
//             ),),
//           Container(
//             height: 50,
//             margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             decoration: BoxDecoration(
//               color: Colors.teal,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Center(
//                 child: Text(
//                   "CONTINUE",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 )),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Already have an account?'),
//               TextButton(onPressed: (){}, child: Text('Log In'))
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class RegisterPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   void register(BuildContext context) async {
//     if (passwordController.text != confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }
//
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
//       Navigator.pop(context); // Go back to login page
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(e.toString()),
//       ));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(onPressed: (){
//                   Navigator.pop(context);
//                 }, icon: Icon(Icons.arrow_back)),
//                 SizedBox(width: 50,),
//                 Center(child: Text('Create An Account',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
//               ],
//             ),
//             const SizedBox(height: 20),
//             TextField(
//
//               decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: 'Name'),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: 'Email'),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: confirmPasswordController,
//               decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: 'Confirm Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: () => register(context),
//             //   child: const Text('Register'),
//             // ),
//     InkWell(onTap: () => register(context),
//       child: Container(
//               height: 50,
//               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               decoration: BoxDecoration(
//                 color: Colors.teal,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Center(
//                   child: Text(
//                     "CONTINUE",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   )),
//             ),
//     ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Already have an account?'),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Log In'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:hello/navigation/navigation.dart';
// // import 'package:provider/provider.dart';
// // import '../service/firebasehelper.dart';
// //
// //
// //
// // class Regi extends StatefulWidget {
// //   @override
// //   State<Regi> createState() => _RegiState();
// // }
// //
// // class _RegiState extends State<Regi> {
// //
// //
// //
// //
// //
// //
// //
// //   String ? name1;
// //
// //   String ? email;
// //
// //   String ? password;
// //
// //   bool showpass = true;
// //
// //   var formkey = GlobalKey<FormState>();
// //
// //
// //   TextEditingController emailcontroller = TextEditingController();
// //   TextEditingController passwordcontroller = TextEditingController();
// //   TextEditingController namecontroller = TextEditingController();
// //
// //
// //   void showSnackbar(String message) {
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
// //   }
// //
// //   bool _isEmailValid(String email) {
// //     final emailRegex = RegExp(
// //       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
// //     );
// //     return emailRegex.hasMatch(email);
// //   }
// //
// //
// //   // @override
// //   // void initState() {
// //   //   super.initState();
// //   //   firebaseHelper = FirebaseHelper(); // Initialize your firebaseHelper here
// //   // }
// //   // @override
// //   // // void dispose() {
// //   // //  _emailcontroller.dispose();
// //   // //  _passwordcontroller.dispose();
// //   // //   super.dispose();
// //   // // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //   return Scaffold(backgroundColor: Colors.white,
// //
// //     appBar: AppBar(backgroundColor: Colors.white,leading: InkWell(onTap: (){
// //       Navigator.pop(context);
// //     },
// //         child: Icon(Icons.arrow_back_ios_new_sharp,color: Colors.black87,size: 25,)),),
// //
// //
// //     body: Form(
// //       key: formkey,
// //       child: ListView(
// //
// //         children: [SizedBox(height: 40),
// //
// //           Center(
// //             child: Text(
// //               "Hello Again!",
// //               style: TextStyle(
// //                   color: Colors.black,
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 30),
// //             ),
// //           ),
// //           SizedBox(height: 10),
// //           Text(
// //             textAlign: TextAlign.center,
// //             "Welcome Back You’ve\nbeen Missed!",
// //             style: TextStyle(color: Colors.black),
// //           ),
// //
// //       SizedBox(
// //         height: 40),
// //
// //           Padding(
// //             padding: const EdgeInsets.only(right: 26,left: 26),
// //             child: Container(height: 67,width: 377,
// //
// //               child: TextFormField(
// //                 controller: namecontroller,
// //
// //                 textInputAction: TextInputAction.next,
// //                 style: TextStyle(color: Colors.black87),
// //                 decoration: InputDecoration(
// //                   filled: true,
// //                   fillColor: Colors.grey[200],
// //                   hintText: "Enter name",
// //                   border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(15),
// //                       // borderSide: BorderSide(color: Colors.teal),
// //                       borderSide: BorderSide(color: Colors.white)
// //
// //                   ),
// //                 ),
// //
// //                 validator:(name){
// //
// //                   if (name!.isEmpty){
// //                     return "Enter your name";
// //
// //                   }else{
// //
// //                     return null;
// //
// //                   }
// //                 },
// //
// //                 onSaved: (ename){
// //
// //                   name1 = ename;
// //                 },
// //
// //
// //
// //
// //               ),
// //             ),
// //           ),
// //
// //           SizedBox(height: 20),
// //
// //
// //
// //           Padding(
// //             padding: const EdgeInsets.only(right: 26,left: 26),
// //             child: Container(
// //               height: 67,
// //               width: 377,
// //               child: TextFormField(
// //                 controller: emailcontroller,
// //
// //                 textInputAction: TextInputAction.next,
// //                 style: TextStyle(color: Colors.black87),
// //                 decoration: InputDecoration(
// //                   filled: true,
// //                   fillColor: Colors.grey[200],
// //                   hintText: "Enter email",
// //                   border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(15),
// //                       // borderSide: BorderSide(color: Colors.teal),
// //                       borderSide: BorderSide(color: Colors.white)
// //
// //                   ),
// //                 ),
// //
// //                 validator:     (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please enter your email';
// //                   } else if (!_isEmailValid(value)) {
// //                     return 'The email address is badly formatted';
// //                   }
// //                   return null;
// //                 },
// //
// //                 onSaved: (eemail){
// //
// //                   email = eemail;
// //                 },
// //
// //
// //               ),
// //             ),
// //           ),
// //
// //           SizedBox(height: 20),
// //
// //           Padding(
// //             padding: const EdgeInsets.only(right: 26,left: 26),
// //             child: Container(height: 67,width: 377,
// //               child: TextFormField(
// //                 controller: passwordcontroller,
// //
// //                 textInputAction: TextInputAction.next,
// //                 style: TextStyle(color: Colors.black87),
// //                 decoration: InputDecoration(
// //                   filled: true,
// //                   fillColor: Colors.grey[200],
// //                   hintText: " Enter password",
// //                   border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(15),
// //                       borderSide: BorderSide(color: Colors.white)),
// //                 ),
// //
// //
// //                 validator: (password){
// //                   if (password!.isEmpty || password.length <8 ){
// //
// //                     return "Password eg Adacode@123";
// //                   } else{
// //
// //                     return null;
// //                   }
// //                 },
// //                 onSaved: (epass){
// //
// //                   password = epass;
// //                 },
// //
// //
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 30),
// //
// //           Padding(
// //             padding: const EdgeInsets.only(right: 25, left: 25),
// //             child: InkWell(
// //
// //               onTap:() async{
// //                 if (formkey.currentState!.validate())
// //                 {
// //                   formkey.currentState!.save();
// //                   await context.read<FirebaseHelper>()
// //                       .signUp(name: name1!,email: email!, pasword: password!, context:context, )
// //                       .then((value) {
// //                     if (value == null) {
// //                       Get.to(Naviga());
// //                     } else {
// //                       Get.snackbar(
// //                           "Error", "User not found $value");
// //                     }
// //                   });
// //                 }
// //               },
// //
// //
// //               child: Container(height: 50,
// //                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
// //                 ,
// //                 decoration: BoxDecoration(color: Colors.teal,
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //
// //                 child: Center(child: Text("Register",
// //                   style: TextStyle(color: Colors.white, fontSize: 20),)),
// //
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 50),
// //
// //
// //           Padding(
// //             padding: const EdgeInsets.only(left: 45,),
// //             child: Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [SizedBox(width: 7),
// //                 Container(padding: EdgeInsets.all(5),
// //                   height: 40,
// //
// //                   decoration:
// //                   BoxDecoration(color: Colors.grey[200],
// //                       borderRadius: BorderRadius.circular(10)),
// //                   child: Row(
// //                     children: [
// //                       Image(
// //                         image: AssetImage(
// //                             "assets/image/google-logo-9808.png"),
// //                       ),
// //                       Text("   Google   ", style: TextStyle
// //
// //                         (fontWeight: FontWeight.bold),)
// //                     ],
// //                   ),
// //                 ),
// //
// //
// //                 Padding(
// //                   padding: const EdgeInsets.only(left: 93),
// //                   child: Container(padding: EdgeInsets.all(5),
// //                     height: 40,
// //
// //
// //                     decoration:
// //                     BoxDecoration(color: Colors.grey[200],
// //                         borderRadius: BorderRadius.circular(10)),
// //                     child: Row(mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         Image(
// //                           image: AssetImage(
// //                               "assets/image/pngwing.com.png"),
// //                         ),
// //                         Text("   Apple  ", style: TextStyle
// //
// //                           (fontWeight: FontWeight.bold),)
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //
// //
// //               ],
// //             ),
// //           ),
// //
// //
// //         ],
// //
// //       ),
// //     ),
// //
// //
// //
// //   );
// //   }
// //
// //   // void signUpUser() async {
// //   //   print("Signing up user...");
// //   //   try {
// //   //     await context.read<Firebaseauth_method>().Signupemail(
// //   //       email: _emailcontroller.text,
// //   //       password: _passwordcontroller.text,
// //   //       name: _namecontroller.text,
// //   //       context: context,
// //   //     );
// //   //
// //   //     Navigator.pushReplacement(
// //   //         context, MaterialPageRoute(builder: (context) => Naviga()));
// //   //     print("Sign up successful!");
// //   //   } catch (e) {
// //   //     print("Error during sign up: $e");
// //   //   }
// //   // }
// //
// // }
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:provider/provider.dart';
//
// import '../navigation/navigation.dart';
// import '../service/firebasehelper.dart';
//
// class Regi extends StatefulWidget {
//   @override
//   State<Regi> createState() => _RegiState();
// }
//
// class _RegiState extends State<Regi> {
//   String? name1;
//   String? email;
//   String? password;
//   bool showpass = true;
//   var formkey = GlobalKey<FormState>();
//
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   TextEditingController namecontroller = TextEditingController();
//
//   void showSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   bool _isEmailValid(String email) {
//     final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
//     return emailRegex.hasMatch(email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black87, size: 25),
//         ),
//       ),
//       body: Form(
//         key: formkey,
//         child: ListView(
//           children: [
//             SizedBox(height: 40),
//             Center(
//               child: Text(
//                 "Hello Again!",
//                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               textAlign: TextAlign.center,
//               "Welcome Back You’ve\nbeen Missed!",
//               style: TextStyle(color: Colors.black),
//             ),
//             SizedBox(height: 40),
//             Padding(
//               padding: const EdgeInsets.only(right: 26, left: 26),
//               child: Container(
//                 height: 67,
//                 width: 377,
//                 child: TextFormField(
//                   controller: namecontroller,
//                   textInputAction: TextInputAction.next,
//                   style: TextStyle(color: Colors.black87),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     hintText: "Enter name",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   validator: (name) {
//                     if (name!.isEmpty) {
//                       return "Enter your name";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (ename) {
//                     name1 = ename;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(right: 26, left: 26),
//               child: Container(
//                 height: 67,
//                 width: 377,
//                 child: TextFormField(
//                   controller: emailcontroller,
//                   textInputAction: TextInputAction.next,
//                   style: TextStyle(color: Colors.black87),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     hintText: "Enter email",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     } else if (!_isEmailValid(value)) {
//                       return 'The email address is badly formatted';
//                     }
//                     return null;
//                   },
//                   onSaved: (eemail) {
//                     email = eemail;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(right: 26, left: 26),
//               child: Container(
//                 height: 67,
//                 width: 377,
//                 child: TextFormField(
//                   controller: passwordcontroller,
//                   textInputAction: TextInputAction.next,
//                   style: TextStyle(color: Colors.black87),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     hintText: " Enter password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   validator: (password) {
//                     if (password!.isEmpty || password.length < 8) {
//                       return "Password must be at least 8 characters";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (epass) {
//                     password = epass;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.only(right: 25, left: 25),
//               child: InkWell(
//                 onTap: () async {
//                   if (formkey.currentState!.validate()) {
//                     formkey.currentState!.save();
//                     bool userExists = await context.read<FirebaseHelper>().checkIfUserExists(email!);
//                     if (!userExists) {
//                       await context.read<FirebaseHelper>().signUp(name: name1!, email: email!, password: password!, context: context).then((value) {
//                         if (value == null) {
//                           Get.to(Naviga());
//                         } else {
//                           Get.snackbar("Error", "User not found \nUser already exists with this email");
//                         }
//                       });
//                     } else {
//                       showSnackbar("User already exists with this email");
//                     }
//                   }
//                 },
//                 child: Container(
//                   height: 50,
//                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.teal,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 20)),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.only(left: 45),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(width: 7),
//                   InkWell(
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       height: 40,
//                       decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//                       child: Row(
//                         children: [
//                           Image(image: AssetImage("assets/image/google-logo-9808.png")),
//                           Text("   Google   ", style: TextStyle(fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 93),
//                     child: Container(
//                       padding: EdgeInsets.all(5),
//                       height: 40,
//                       decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Image(image: AssetImage("assets/image/pngwing.com.png")),
//                           Text("   Apple  ", style: TextStyle(fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:todoapp/screens/home.dart';
// import 'package:todoapp/screens/llogiin.dart';
//
// import '../utilitis/firbasehelper.dart';
//
// class Regi extends StatefulWidget {
//   @override
//   State<Regi> createState() => _RegiState();
// }
//
// class _RegiState extends State<Regi> {
//   String? name1;
//   String? email;
//   String? password;
//   bool showpass = true;
//   var formkey = GlobalKey<FormState>();
//
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   TextEditingController namecontroller = TextEditingController();
//
//   void showSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
//   }
//
//   bool _isEmailValid(String email) {
//     final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
//     return emailRegex.hasMatch(email);
//   }
//
//   // Future<void> signInWithGoogle() async {
//   //   try {
//   //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   //     final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
//   //     final AuthCredential credential = GoogleAuthProvider.credential(
//   //       accessToken: googleAuth.accessToken,
//   //       idToken: googleAuth.idToken,
//   //     );
//   //     UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//   //     if (userCredential.user != null) {
//   //       Get.to(CategoriesPage());
//   //     }
//   //   } catch (e) {
//   //     showSnackbar("Error signing in with Google: $e");
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//
//     ScreenUtil.init(context);
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       body: Form(
//         key: formkey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               // crossAxisAlignment: CrossAxisAlignment.center,
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(onPressed: (){
//                   Navigator.pop(context);
//                 }, icon: Icon(Icons.arrow_back)),
//                 SizedBox(width: 50,),
//                 Center(child: Text('Create An Account',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
//               ],
//             ),
//
//             SizedBox(height: 10),
//
//
//             Padding(
//               padding: const EdgeInsets.only(right: 26, left: 26),
//               child: Container(
//                 height: 67,
//                 width: 377,
//                 child: TextFormField(
//                   controller: namecontroller,
//                   textInputAction: TextInputAction.next,
//                   style: TextStyle(color: Colors.black87),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     hintText: "Enter name",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   validator: (name) {
//                     if (name!.isEmpty) {
//                       return "Enter your name";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (ename) {
//                     name1 = ename;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.only(right: 26, left: 26),
//               child: Container(
//                 height: 67.h,
//                 width: 377.w,
//                 child: TextFormField(
//                   controller: emailcontroller,
//                   textInputAction: TextInputAction.next,
//                   style: TextStyle(color: Colors.black87),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     hintText: "Enter email",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     } else if (!_isEmailValid(value)) {
//                       return 'The email address is badly formatted';
//                     }
//                     return null;
//                   },
//                   onSaved: (eemail) {
//                     email = eemail;
//                   },
//                 ),
//               ),
//             ),
//
//             Padding(
//               padding: const EdgeInsets.only(right: 25, left: 25),
//               child: Container(
//                 height: 67.h,
//                 width: 377.w,
//                 child: TextFormField(
//                   controller: passwordcontroller,
//                   textInputAction: TextInputAction.next,
//                   style: TextStyle(color: Colors.black87),
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     hintText: " Enter password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                   validator: (password) {
//                     if (password!.isEmpty || password.length < 8) {
//                       return "Password must be at least 8 characters";
//                     } else {
//                       return null;
//                     }
//                   },
//                   onSaved: (epass) {
//                     password = epass;
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.only(right: 25, left: 25),
//               child: InkWell(
//                 onTap: () async {
//                   if (formkey.currentState!.validate()) {
//                     formkey.currentState!.save();
//                     bool userExists = await context.read<FirebaseHelper>().checkIfUserExists(email!);
//                     if (!userExists) {
//                       await context.read<FirebaseHelper>().signUp(name: name1!, email: email!, password: password!, context: context).then((value) {
//                         if (value == null) {
//                           Get.to(Login());
//                           showSnackbar("Registration successful! Please log in.");
//                         } else {
//                           Get.snackbar("Error", "User not found \nUser already exists with this email");
//                         }
//                       });
//                     } else {
//                       showSnackbar("User already exists with this email");
//                     }
//                   }
//                 },
//                 child: Container(
//                   height: 50.h,
//                   margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
//                   decoration: BoxDecoration(
//                     color: Colors.teal,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 20.sp)),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//     Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Already have an account?'),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Log In'),
//                 ),
//               ],
//             ),
//             Text(" "),
//           ],
//
//         ),
//       ),
//     );
//   }
// }

// Registration Page
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'llogiin.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back)),
                SizedBox(width: 50,),
                Center(child: Text('Create An Account',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
              ],
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: 'Name'),
            ),
            SizedBox(height: 10,),

            TextField(
              controller: emailController,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: 'Email'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
    backgroundColor: Colors.green,
    textStyle: const TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontStyle: FontStyle.normal),
    ),
              onPressed: ()async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
                    'name': nameController.text.trim(),
                    'email': emailController.text.trim(),
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration successful. Please log in.')),
                  );
                  Get.off(() => LoginPage());
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Text("CONTINUE"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Log In'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
