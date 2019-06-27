import 'package:flutter/material.dart';
import 'Books.dart';
import 'CustomAppBar.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'BookDetails.dart';

class BookDashboard extends StatefulWidget {
  BookDashboard({Key key}) : super(key: key);

  _BookDashboardState createState() => _BookDashboardState();
}

class _BookDashboardState extends State<BookDashboard> {
  List<Books> bookdetails = [];
  Future<List<Books>> _bookDetails() async {
    var data =await http.get("https://my.api.mockaroo.com/books.json?key=API KEY");
    var jsonData = json.decode(data.body);
    
    for (var bookval in jsonData) {
      Books books = Books(bookval['bookname'], bookval['bookauthor'], bookval['bookcover'],
          bookval['bookrating'], bookval['bookviews'],bookval['bookdetails']);
      bookdetails.add(books);
    }
    return bookdetails;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomAppBar(),
              FutureBuilder(
                future: _bookDetails(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      color: Color(0xfffF7F7F7),
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return BookDetails(
                              snapshot.data[index],
                              snapshot.data[index].bookname,
                              snapshot.data[index].bookauthor,
                              snapshot.data[index].bookcover,
                              snapshot.data[index].bookrating,
                              snapshot.data[index].bookviews,     
                              );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Text("Loading"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
    );
  }
}
