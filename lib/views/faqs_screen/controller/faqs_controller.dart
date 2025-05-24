import 'package:get/get.dart';

class FaqsController extends GetxController {
  var faqs = <FaqItem>[
    FaqItem(
        question: "How to reset my password?",
        answer: "Go to profile → settings → “Change Password.”"),
    FaqItem(
        question: "How to contact support?",
        answer: "Email us at support@example.com or go to Help > Contact Us."),
    FaqItem(
        question: "How to update my address?",
        answer: "Go to profile → Edit Profile → Update Address."),
  ].obs;

}

class FaqItem {
  final String question;
  final String answer;
  RxBool isExpanded;

  FaqItem({required this.question, required this.answer, bool expanded = false})
      : isExpanded = expanded.obs;
}