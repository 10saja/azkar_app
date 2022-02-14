
import 'package:azkar_app/screens/about_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  int _count = 0 ;
  String _content = 'أستغفرالله';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
           elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text('المسبحة الالكترونية',style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/info_screen',arguments: {
              'message':'Info Screen'
            });
          }, icon:Icon(Icons.info) ),
         PopupMenuButton<String>(onSelected: (value){
           if(_content!= value){
             setState(() {
               _content = value ;
               _count = 0;
             });
           }
         },itemBuilder: (context) {
           return [
           PopupMenuItem(child: Text('أستغفرالله'),
           value: 'أستغفر الله',

           ),
             PopupMenuDivider(),
             PopupMenuItem(child: Text('سبحان الله'),
               value: 'سبحان الله',
             ),
             PopupMenuDivider(),
             PopupMenuItem(child: Text('الحمدالله'),
               value: 'الحمدالله',
             )

           ];
         },)
         // IconButton(onPressed: (){
          //  Navigator.push(context,MaterialPageRoute(builder: (context) => AboutScreen(message: 'About Screen',),));
           // Navigator.pushNamed(context, '/about_screen');
        //  }, icon: Icon(Icons.question_answer))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            ++_count;
          });

        }, child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.brown.shade900,
            Colors.brown.shade400
          ])
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
               height:100,
               width: 100,
               decoration: BoxDecoration(
                 color: Colors.teal,
                 shape: BoxShape.circle,

               ),
             ),
            SizedBox(height: 5,)
            ,Card(
                margin: EdgeInsetsDirectional.only(start: 5,end: 5,top: 7,bottom: 15),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(_content,style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25
                    ),),
                  ),
                  Container(color: Colors.teal,
                      height: 50,
                      width: 50,
                      alignment: AlignmentDirectional.center,
                     child: Text(_count.toString(),style: TextStyle(),))
                ],
              ),
            ),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex:2,child: ElevatedButton(onPressed: (){
                    setState(() {
                      _count +=1 ;
                    });
                  }, child: Text('تسبيح'),style: ElevatedButton.styleFrom(primary: Colors.teal,
                      onPrimary: Colors.black,
                   minimumSize: Size(0,50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(12)))
                  ),


                  ),
                  ),
                  Expanded(child: ElevatedButton(onPressed: (){
                    setState(() {
                      _count = 0;
                    });
                  }, child: Text('إعادة'),style: ElevatedButton.styleFrom(primary: Colors.teal,
                      onPrimary: Colors.black,
                  minimumSize: Size(0,50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(12)))
                  ),))
                ],
              )



            ],
          ),
        ),

      ),
    );
  }
}
