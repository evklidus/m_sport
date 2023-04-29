import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insight/common/widgets/boxes/h_box.dart';
import 'package:insight/features/course_page/domain/entities/course_page_entity.dart';
import 'package:insight/features/course_page/presentation/widgets/lesson_widget.dart';

class CoursePageScreenLoaded extends StatefulWidget {
  const CoursePageScreenLoaded({
    Key? key,
    required this.coursePageEntity,
  }) : super(key: key);

  final CoursePageEntity coursePageEntity;

  @override
  State<CoursePageScreenLoaded> createState() => _CoursePageScreenLoadedState();
}

class _CoursePageScreenLoadedState extends State<CoursePageScreenLoaded> {
  @override
  Widget build(BuildContext context) {
    final standartHorizontalPadding = 16.w;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: standartHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HBox(20.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: Image.network(
                widget.coursePageEntity.imageUrl,
                height: 190.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            HBox(20.h),
            Text(
              'Уроки',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            HBox(20.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.coursePageEntity.lessons.length,
              itemBuilder: (context, index) =>
                  LessonWidget(widget.coursePageEntity.lessons[index]),
              separatorBuilder: (context, index) => HBox(20.h),
            ),
          ],
        ),
      ),
    );
  }
}
