
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
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/info_screen',arguments: {
              'message':'Info Screen'
            });
          }, icon:const Icon(Icons.info) ),
         PopupMenuButton<String>(onSelected: (value){
           if(_content!= value){
             setState(() {
               _content = value ;
               _count = 0;
             });
           }
         },itemBuilder: (context) {
           return [
           const PopupMenuItem(child: Text('أستغفرالله'),
           value: 'أستغفر الله',

           ),
             const PopupMenuDivider(),
             const PopupMenuItem(child: Text('سبحان الله'),
               value: 'سبحان الله',
             ),
             const PopupMenuDivider(),
             const PopupMenuItem(child: Text('الحمدالله'),
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
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.brown.shade900,
        onPressed: (){
          setState(() {
            ++_count;
          });

        }, child: const Icon(Icons.add),
      ),
      body: Stack(children: [
         Image.asset('images/azkar.jpg',height: double.infinity,fit: BoxFit.cover,),

          const Align(alignment: AlignmentDirectional.bottomStart,

              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                child: Text('Saja Ghazi Jebril',style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold,
                  color: Colors.white
                ),

          ),
              ))
          ,  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height:100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,

                  ),
                ),
                const SizedBox(height: 5,)
                ,Card(
                  margin: const EdgeInsetsDirectional.only(start: 5,end: 5,top: 7,bottom: 15),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(_content,style: const TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                      ),
                      Container(color: Colors.brown,
                          height: 50,
                          width: 50,
                          alignment: AlignmentDirectional.center,
                          child: Text(_count.toString(),style: const TextStyle(),))
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
                    }, child: const Text('تسبيح'),style: ElevatedButton.styleFrom(primary: Colors.brown,
                        onPrimary: Colors.black,
                        minimumSize: const Size(0,50),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(12)))
                    ),


                    ),
                    ),
                    Expanded(child: ElevatedButton(onPressed: (){
                      setState(() {
                        _count = 0;
                      });
                    }, child: const Text('إعادة'),style: ElevatedButton.styleFrom(primary: Colors.brown,
                        onPrimary: Colors.black,
                        minimumSize: const Size(0,50),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(12)))
                    ),))
                  ],
                )



              ],
            ),
          ),
      ]
        )



    );
  }
}
