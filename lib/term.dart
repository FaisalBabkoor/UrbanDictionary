class Term {
  Term({this.word, this.definistion, this.likes, this.dislikes});

  String word;
  String definistion;
  int likes;
  int dislikes;

  String get htmlDefinistion {
    return definistion
    .replaceAll("[", "<b style = 'color: red;'>")
    .replaceAll("]", "</b>");
  }

  Term.fromJOSN(Map<String, dynamic> json)
      : word = json['word'],
        definistion = json['definition'],
        likes = json['thumbs_up'],
        dislikes = json['thumbs_down'];
}
