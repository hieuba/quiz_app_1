class QuestionModel {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  String? imageUrl;
  bool? isSpecial;
  bool? isSaHinh;
  bool? isBienBao;

  QuestionModel({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    this.imageUrl,
    this.isSpecial,
    this.isSaHinh,
    this.isBienBao,
  });
}
