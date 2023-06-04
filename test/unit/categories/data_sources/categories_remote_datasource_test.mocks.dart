// Mocks generated by Mockito 5.4.1 from annotations
// in insight/test/unit/categories/data_sources/categories_remote_datasource_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:insight/core/http/rest_client.dart' as _i3;
import 'package:insight/features/categories/data/models/category_model.dart'
    as _i5;
import 'package:insight/features/course_page/data/models/course_page_model.dart'
    as _i2;
import 'package:insight/features/course_previews/data/models/course_preview_model.dart'
    as _i6;
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

/// A class which mocks [RestClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestClient extends _i1.Mock implements _i3.RestClient {
  MockRestClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.CategoryModel>> getCategories() => (super.noSuchMethod(
        Invocation.method(
          #getCategories,
          [],
        ),
        returnValue:
            _i4.Future<List<_i5.CategoryModel>>.value(<_i5.CategoryModel>[]),
      ) as _i4.Future<List<_i5.CategoryModel>>);
  @override
  _i4.Future<List<_i6.CoursePreviewModel>> getCoursePreviewsByCategoryTag(
          String? categoryTag) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCoursePreviewsByCategoryTag,
          [categoryTag],
        ),
        returnValue: _i4.Future<List<_i6.CoursePreviewModel>>.value(
            <_i6.CoursePreviewModel>[]),
      ) as _i4.Future<List<_i6.CoursePreviewModel>>);
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
