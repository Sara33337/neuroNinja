class SurvyQuestions {
  
  final String id;
  final String question;
  

  SurvyQuestions({required this.id , required this.question });

  factory SurvyQuestions.fromJson(Map<String, dynamic> json) {
    return SurvyQuestions(
      id: json['id'],
      question: json['text'],
      
    );
  }
}
