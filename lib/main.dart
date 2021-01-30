import 'package:flutter/material.dart';
import 'package:urban_dictionary/enter_term_page.dart';
import 'package:urban_dictionary/term_details_page.dart';
import 'package:urban_dictionary/terms_page.dart';
import 'package:urban_dictionary/term.dart';
import 'package:urban_dictionary/networking_service.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String _searchedTerm;
  Term _selectedTerm;
  List<Term> _terms;
  final _networkingService = NetworkingService();

  void _onSearchedTerm(String term) async {
    final terms = await _networkingService.defineTerm(term);
    setState(() {
      this._terms = terms;
      this._searchedTerm = term;
    });
  }

  void _didSelectTerm(Term selectedTerm) {
    setState(() {
      _selectedTerm = selectedTerm;
      print(_selectedTerm.word);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Dictinary App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigator(
        pages: [
          // show enter term page
          MaterialPage(
              key: EnterTermPage.valueKey,
              child: EnterTermPage(
                key: EnterTermPage.valueKey, searchedTerm: _onSearchedTerm),
          ),

          // show terms page if searched term has value
          if (_searchedTerm != null && _searchedTerm.isNotEmpty)
            MaterialPage(
                key: TermsPage.valueKey,
                child: TermsPage(
                  title: _searchedTerm,
                  terms: this._terms,
                  didSelectTerm: _didSelectTerm,
                )),

          // show term details page
          if (_selectedTerm != null)
            MaterialPage(
                key: TermDetailsPage.valueKey,
                child: TermDetailsPage(
                  term: _selectedTerm,
                ))
        ],
        onPopPage: (route, result) {
          final materialPage = route.settings as MaterialPage;
          final pageKey = materialPage.key;

          if (pageKey == TermsPage.valueKey) {
            this._searchedTerm = null;
          }

          if (pageKey == TermDetailsPage.valueKey) {
            this._selectedTerm = null;
          }

          return route.didPop(result);
        },
      ),
    );
  }
}
