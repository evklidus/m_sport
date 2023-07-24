import 'package:flutter/material.dart';

import 'package:insight/src/common/widgets/boxes/h_box.dart';
import 'package:insight/src/features/course_previews/model/course_preview.dart';
import 'package:insight/src/features/course_previews/widget/components/course_preview_widget.dart';

class CoursePreviewsScreenLoaded extends StatelessWidget {
  const CoursePreviewsScreenLoaded({
    Key? key,
    required this.coursePreviews,
  }) : super(key: key);

  final List<CoursePreview> coursePreviews;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: coursePreviews.length,
      itemBuilder: (context, index) => CoursePreviewWidget(
        coursePreview: coursePreviews[index],
      ),
      separatorBuilder: (context, index) => const HBox(20),
    );
  }
}