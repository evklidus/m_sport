import 'package:flutter_test/flutter_test.dart';
import 'package:insight/src/features/course_previews/data/course_previews_network_data_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rest_client/rest_client.dart';

import 'course_previews_remote_data_source_test.mocks.dart';

class CoursePreviewDTOFake extends Fake implements CoursePreviewDTO {}

@GenerateMocks([RestClient])
void main() {
  late final CoursePreviewsNetworkDataProviderImpl
      coursePreviewsNetworkDataProvider;
  final MockRestClient mockRestClient = MockRestClient();
  final coursePreviews = [
    CoursePreviewDTOFake(),
    CoursePreviewDTOFake(),
    CoursePreviewDTOFake(),
  ];
  const categoryTag = 'sport';

  setUpAll(() {
    coursePreviewsNetworkDataProvider =
        CoursePreviewsNetworkDataProviderImpl(mockRestClient);
  });

  test(
      'get a Categories if mockRestClient.getCategories completes successfully',
      () {
    when(mockRestClient.getCoursePreviewsByCategoryTag(categoryTag)).thenAnswer(
      (_) async => coursePreviews,
    );
    expect(
      coursePreviewsNetworkDataProvider.getCoursePreviews(categoryTag),
      completion(coursePreviews),
    );
  });

  test(
      'throw an exception if mockRestClient.getCategories completes with error',
      () {
    when(mockRestClient.getCoursePreviewsByCategoryTag(categoryTag)).thenAnswer(
      (_) => throw Exception(),
    );
    expect(
      coursePreviewsNetworkDataProvider.getCoursePreviews(categoryTag),
      throwsException,
    );
  });
}
