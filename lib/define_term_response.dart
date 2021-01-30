import 'term.dart';

class DefineTermResponse {
  DefineTermResponse ({this.list});
  List <Term> list;

  factory DefineTermResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] is List) {
      final list = json['list'] as List;
      final objsectList = list.cast<Map<String, dynamic>>();
      final termsList = objsectList.map((e) => Term.fromJOSN(e));
      return DefineTermResponse(list: termsList.toList());
    } else {
      throw Exception('Faidl');
    }
  }
}