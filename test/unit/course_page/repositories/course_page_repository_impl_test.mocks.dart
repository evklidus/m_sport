// Mocks generated by Mockito 5.4.1 from annotations
// in insight/test/unit/course_page/repositories/course_page_repository_impl_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:insight/features/course_page/data/data_sources/course_page_remote_data_source.dart'
    as _i3;
import 'package:insight/features/course_page/data/models/course_page_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeCoursePageModel_0 extends _i1.SmartFake
    implements _i2.CoursePageModel {
  _FakeCoursePageModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CoursePageRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCoursePageRemoteDataSource extends _i1.Mock
    implements _i3.CoursePageRemoteDataSource {
  MockCoursePageRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CoursePageModel> getCoursePage(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getCoursePage,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.CoursePageModel>.value(_FakeCoursePageModel_0(
          this,
          Invocation.method(
            #getCoursePage,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.CoursePageModel>);
}
