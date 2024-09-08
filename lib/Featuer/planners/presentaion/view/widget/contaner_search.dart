import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/Featuer/planners/presentaion/view/widget/search_view.dart';
import 'package:flutter/material.dart';

class ContanerSearch extends StatelessWidget {
  const ContanerSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SearchPage()),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // تغيير موقع الظل
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color:
                    Colors.deepPurpleAccent, // تغيير اللون لتناسب طابع الحفلات
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'search_places'.tr(),
                    style: const TextStyle(
                      color: Colors.deepPurpleAccent, // تغيير لون النص
                      fontSize: 16.0, // تغيير حجم النص
                      fontWeight:
                          FontWeight.w500, // تغيير وزن النص لجعله أكثر أناقة
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
