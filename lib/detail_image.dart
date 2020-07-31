import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowImageDetail extends StatefulWidget {
  String imageFull;

  ShowImageDetail(this.imageFull);

  @override
  State<StatefulWidget> createState() {
    return _ShowImageDetailState(imageFull);
  }
}

class _ShowImageDetailState extends State<ShowImageDetail> {
  // ignore: non_constant_identifier_names
  String imageFull;

  _ShowImageDetailState(this.imageFull);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail image'),
        ),
        body: Scaffold(
          body: new Image.network(
            imageFull ??
                'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjMyNDU2fQ',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ));
  }
}
