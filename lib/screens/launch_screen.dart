import 'package:flutter/material.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}


class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamed(context, '/azkar_screen');
    });
  }
  @override

  Widget build(BuildContext context) {
    return   Scaffold(
      body:Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.teal.shade700,
            Colors.teal.shade200
          ],
            begin: AlignmentDirectional.bottomEnd,
            end: AlignmentDirectional.topStart
          ),
        ),
        child: const Text('المسبحة الالكترونية',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,),
        ),

      ),
      );



  }
}
