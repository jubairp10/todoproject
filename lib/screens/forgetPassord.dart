import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forgetpassord extends StatelessWidget {
  const Forgetpassord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
              SizedBox(width: 50,),
              Center(child: Text('Forgot Passsword',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            ],
          ),
          SizedBox(width: 20,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(1)),labelText: "Email"
              ),),
          ),
          Text('Enter the email you used to create your and \n we will email you a link to reset your password',style: TextStyle(),textAlign: TextAlign.center,),
          SizedBox(height: 20,),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Center(
                child: Text(
                  "CONTINUE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have a account?'),
              TextButton(onPressed: (){}, child: Text('Register'))
            ],
          )
        ],
      ),
    );
  }
}
