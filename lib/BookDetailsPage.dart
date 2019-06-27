import 'package:flutter/material.dart';
import 'Books.dart';

class BookDetailsPage extends StatelessWidget {
  final Books books;
  const BookDetailsPage(this.books);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(books.bookname),
        ),
        body: Column(
          children: <Widget>[
            Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 260.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              books.bookcover)
                      )
                  )
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.only(left: 8.0,right:8.0),
              child:Text(books.bookdetails,style: TextStyle(fontSize: 16.0),)),
          ],),
         
    );
  }
}
