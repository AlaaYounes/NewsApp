//https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=9eb4b145df4b4e2da1d7d615c360ac21
// base url: https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=us&category=business&apiKey=9eb4b145df4b4e2da1d7d615c360ac21
// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a643b8950bce47c18dcd164a835d3117

import 'package:flutter/material.dart';

Widget buildArticleItem(Map article, context,isdark)
{
 return Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
   children: [
    Container(
     height: 120,
     width: 120,
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
       image: NetworkImage(
           '${article['urlToImage']}'
       ),
       fit: BoxFit.cover,
      ),
     ),
    ),
    SizedBox(
     width: 20,
    ),
    Expanded(
     child: Container(
      height: 120,
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
        Text('${article['title']}',
         style:TextStyle(
             fontSize: 18,
             color: isdark==true?Colors.white:Colors.black,
             fontWeight: FontWeight.w600
         ),
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
         ),
        Text(
         '${article['publishedAt']}',
         style: TextStyle(
          color: Colors.grey,
         ),
        )
       ],
      ),
     ),
    )

   ],
  ),
 );
}
Widget dividor(BuildContext context)=>  Padding(
 padding: const EdgeInsets.only(left: 20.0, right: 20),
 child: Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey,
 ),
);
