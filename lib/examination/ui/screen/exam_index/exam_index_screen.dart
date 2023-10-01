import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_natures_app/examination/model/examination_category.dart';
import 'package:the_natures_app/examination/ui/four_choice_question.dart';
import 'package:the_natures_app/examination/ui/screen/exam/exam_screen.dart';

import 'package:the_natures_app/resource/intl_resource.dart';

part 'exam_index_scaffold.dart';
part 'exam_index_content_list.dart';

class ExamIndexScreen extends StatelessWidget {
  const ExamIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Scaffold();
  }
}
