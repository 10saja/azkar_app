import 'package:flutter/material.dart';
class InfoScreen extends StatelessWidget {
   InfoScreen({Key? key}) : super(key: key);
String message = 'defult message';
  @override
  Widget build(BuildContext context) {
    ModalRoute ? modalRoute = ModalRoute.of(context);
    if (modalRoute != null){
      RouteSettings routeSettings = modalRoute.settings;
      if(routeSettings .arguments != null){
        Map<String,dynamic> data = routeSettings .arguments as Map<String,dynamic>;
        if (data.containsKey('message')){
             message= data['message'];
        }
      }

    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon (Icons.arrow_back_ios),),
      ),
      body: Center(
        child: Text(message,style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),),
      ),
    );
  }
}
