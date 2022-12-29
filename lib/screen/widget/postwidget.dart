import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubwiru/screen/homepage/model/postmodel.dart';

class PostWidget extends StatelessWidget{

  PostWidget({ @required this.profilePic,this.postedDate,this.postedTime,this.postBody,this.postedBy,this.image});
  final profilePic;
  final postedDate;
  final postedTime;
  final postBody;
  final postedBy;
  final image;

  @override
  Widget build(BuildContext context) {
   return Column(
    children: [
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 30,
        ),

        title:Text(postedBy),
        subtitle: Text('bb'),
        trailing: Icon(Icons.more_vert),
      ),

      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(postBody),
              ],
            ),
            image != null ?
            Image.network(image)
            : SizedBox()
          ],
        ),
      )
    ],
   );
  }

}