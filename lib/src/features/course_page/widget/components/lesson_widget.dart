import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insight/src/common/constants/base_constants.dart';
import 'package:insight/src/common/utils/extensions/go_relative_named.dart';
import 'package:insight/src/common/widgets/insight_list_tile.dart';

import 'package:insight/src/features/course_page/model/lesson.dart';

class LessonWidget extends StatelessWidget {
  const LessonWidget(this.lesson, {super.key});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    return InsightListTile(
      onTap: () => context.goRelativeNamed(
        'video',
        pathParameters: {
          'coursePageTitle': lesson.name,
        },
        queryParams: {
          'videoUrl': lesson.videoUrl,
        },
      ),
      title: Text(lesson.name),
      trailing: Icon(
        isNeedCupertino ? CupertinoIcons.play_fill : Icons.play_arrow_rounded,
        size: 30,
      ),
    );
  }
}
