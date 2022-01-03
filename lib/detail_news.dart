import 'package:flutter/material.dart';

class DetailNews extends StatelessWidget {
   DetailNews({Key? key,required this.imgNetwork,required this.desc}) : super(key: key);
final String imgNetwork;
final String desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraint){
          if(constraint.maxWidth <= 600){
            return Column(
              children: [
                 SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(imgNetwork,fit: BoxFit.fill,),
                ),
                Text(desc)
              ],
            );
          } else if(constraint.maxWidth <= 1200){
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(imgNetwork,fit: BoxFit.fill,),
                  ),
                  Text(desc)
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(imgNetwork,fit: BoxFit.fill,),
                  ),
                  Text(desc)
                ],
              ),
            );

          }
        },
      ),
    );
  }
}
