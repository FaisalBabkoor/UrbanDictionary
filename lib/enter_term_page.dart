import 'package:flutter/material.dart';

// class EnterTermVC: StatefulWidget
class EnterTermPage extends StatefulWidget {
  static final valueKey = ValueKey("EnterTermPage");
  final ValueChanged<String> searchedTerm;

  EnterTermPage({Key key, this.searchedTerm}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _EnterTermPageState();
}

// private class EnterTermPageState: State<EnterTermPage>
class _EnterTermPageState extends State<EnterTermPage> {
// final == let
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Urban Dictionary"),
      ),
      body: searchForm(),
    );
  }

  void _search() {
    widget.searchedTerm(_textEditingController.text);
    _textEditingController.text = "";
  }

  Widget searchForm() {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: "Enter Term",
                hintStyle: TextStyle(
                  color: Colors.purple,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 15),
            FlatButton(
                minWidth: 200,
                height: 44,
                onPressed: () => _search(),
                color: Colors.purple,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text("Search"))
          ],
        ),
      ),
    );
  }
}
