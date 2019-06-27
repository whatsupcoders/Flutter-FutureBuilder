import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'BookDetailsPage.dart';
import 'Books.dart';
class BookDetails extends StatelessWidget {
   Books index;
   String bookname;
   String bookauthor;
   String bookcover;
   int bookrating;
   int bookviews;

BookDetails(this.index,this.bookname,this.bookauthor,this.bookcover,this.bookrating,this.bookviews);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Stack(
      children: <Widget>[
      Container(
        width: 250.0,
        height: 270.0,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          image: DecorationImage(
            image: new NetworkImage(bookcover),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Positioned(
        left: 140.0,
        top: 70.0,
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              width: 230.0,
              height: 150.0,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(
                      child: Center(
                          child: Text(bookname,
                              style: TextStyle(
                                  color: Color(0xff07128a),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Center(
                        child: Text(bookauthor,
                            style: TextStyle(
                                color: Color(0xff2da9ef),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(bookviews.toString() + " views",
                          style: TextStyle(
                              color: Color(0xffff6f00), fontSize: 16.0)),
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.angleRight,
                            color: Color(0xffff6f00),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsPage(index)));
                          }),
                    ],
                  )),
                ],
              ),
            )),
      ),
    ]),
  );
  }
}