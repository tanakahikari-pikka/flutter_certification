import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_natures_app/class/examination.dart';
import 'package:the_natures_app/examination/model/examination.dart';
import 'package:the_natures_app/examination/ui/result_dialog.dart';
import 'package:the_natures_app/resource/intl_resource.dart';

part 'exam_scaffold.dart';
part 'exam_content.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Scaffold();
  }
}
