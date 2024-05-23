class FaqsModel {
  int? faqsId;
  String? faqsQuestion;
  String? faqsQuestionAr;
  String? faqsAnswer;
  String? faqsAnswerAr;

  FaqsModel(
      {this.faqsId,
        this.faqsQuestion,
        this.faqsQuestionAr,
        this.faqsAnswer,
        this.faqsAnswerAr});

  FaqsModel.fromJson(Map<String, dynamic> json) {
    faqsId = json['faqs_id'];
    faqsQuestion = json['faqs_question'];
    faqsQuestionAr = json['faqs_question_ar'];
    faqsAnswer = json['faqs_answer'];
    faqsAnswerAr = json['faqs_answer_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faqs_id'] = this.faqsId;
    data['faqs_question'] = this.faqsQuestion;
    data['faqs_question_ar'] = this.faqsQuestionAr;
    data['faqs_answer'] = this.faqsAnswer;
    data['faqs_answer_ar'] = this.faqsAnswerAr;
    return data;
  }
}