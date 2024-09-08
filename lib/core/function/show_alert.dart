import 'package:flutter/material.dart';

void showCustomAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  List<Widget>? actions, // قائمة الأزرار كمعامل اختياري
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Color.fromARGB(255, 106, 50, 116),
            width: 2,
          ),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 28,
              color: Color.fromARGB(255, 106, 50, 116),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
        content: RichText(
          text: TextSpan(
            style: const TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: content),
            ],
          ),
        ),
        actions: actions ??
            <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Colors.purple, // لون النص والأيقونات على الزر
                    shadowColor: Colors.purple, // لون الظل
                    elevation: 5, // ارتفاع الظل خلف الزر
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // تقريب حواف الزر
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15), // التبطين الداخلي للزر
                  ),
                  child: const Text(
                    'حسنا',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // إغلاق الحوار
                  },
                ),
              ),
            ],
        actionsPadding: const EdgeInsets.only(bottom: 10, right: 10),
      );
    },
  );
}
