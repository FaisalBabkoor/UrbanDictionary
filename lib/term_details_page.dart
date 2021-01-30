import 'package:flutter/material.dart';
import 'package:urban_dictionary/term.dart';
import 'package:flutter_html/flutter_html.dart';
class TermDetailsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermDetailsPage');

  TermDetailsPage({Key key, this.term}) : super(key: key);
  final Term term;


  Widget termDeatials() {
    return SafeArea(
      minimum: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Html(data: term.htmlDefinistion),
          Spacer(),
          Row(
            children: [
              Text('Likes: ${term.likes}'),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Text('Dislikes: ${term.dislikes}'),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(term.word),
      ),
      body: termDeatials(),
    );
  }
}
