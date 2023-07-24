import 'dart:async';

import 'package:database/insight_db.dart';
import 'package:insight/src/features/auth/data/auth_network_data_provider.dart';
import 'package:auth_client/auth_client.dart';
import 'package:dio/dio.dart';
import 'package:insight/src/features/auth/data/auth_repository.dart';
import 'package:insight/src/features/auth/data/auth_storage_data_provider.dart';
import 'package:insight/src/features/categories/data/categories_network_data_provider.dart';
import 'package:insight/src/features/categories/data/categories_repository.dart';
import 'package:insight/src/features/course_page/data/course_page_network_data_provider.dart';
import 'package:insight/src/features/course_page/data/course_page_repository.dart';
import 'package:insight/src/features/course_previews/data/course_previews_network_data_provider.dart';
import 'package:insight/src/features/course_previews/data/courses_preview_repository.dart';
import 'package:insight/src/features/profile/data/profile_network_data_provider.dart';
import 'package:insight/src/features/profile/data/profile_repository.dart';
import 'package:rest_client/rest_client.dart';

final class DIContainer {
  DIContainer._();

  factory DIContainer() => _instance ??= DIContainer._();

  static DIContainer? _instance;

  // DB
  late final InsightDB insightDB;

  // Network
  late final AuthClient authClient;
  late final RestClient restClient;

  // Data Providers
  late final AuthNetworkDataProvider authNetworkDataProvider;
  late final AuthStorageDataProvider authStorageDataProvider;
  late final CategoriesNetworkDataProvider categoriesNetworkDataProvider;
  late final CoursePreviewsNetworkDataProvider
      coursePreviewsNetworkDataProvider;
  late final CoursePageNetworkDataProvider coursePageNetworkDataProvider;
  late final ProfileNetworkDataProvider profileNetworkDataProvider;

  // Repositories
  late final AuthRepository authRepository;
  late final CategoriesRepository categoriesRepository;
  late final CoursesPreviewRepository coursesPreviewRepository;
  late final CoursePageRepository coursePageRepository;
  late final ProfileRepository profileRepository;

  Future<void> initDeps() async {
    // DB
    insightDB = await InsightDB.getInstance();

    // Network
    authClient = AuthClient(Dio());

    // Возможно странноватое решение, но рабочее
    final isAuthenticatedController = StreamController<bool>();
    Stream<bool> isAuthenticatedStream =
        isAuthenticatedController.stream.asBroadcastStream(
      onListen: (subscription) => isAuthenticatedController.add(
        insightDB.isAuthorized() as bool,
      ),
    );

    final dioForRestClient = Dio()
      ..interceptors.add(
        AuthInterceptor(
          isAuthorizedFromDB: insightDB.isAuthorized,
          getTokenFromDB: insightDB.getToken,
          signOut: () => isAuthenticatedController.add(false),
        ),
      );

    restClient = RestClient(dioForRestClient);

    // Data Providers
    authNetworkDataProvider = AuthNetworkDataProviderImpl(authClient);
    authStorageDataProvider = AuthStorageDataProviderImpl(insightDB);
    categoriesNetworkDataProvider =
        CategoriesNetworkDataProviderImpl(restClient);
    coursePreviewsNetworkDataProvider =
        CoursePreviewsNetworkDataProviderImpl(restClient);
    coursePageNetworkDataProvider =
        CoursePageNetworkDataProviderImpl(restClient);
    profileNetworkDataProvider = ProfileNetworkDataProviderImpl(restClient);

    // Repositories
    authRepository = AuthRepositoryImpl(
      networkDataProvider: authNetworkDataProvider,
      storageDataProvider: authStorageDataProvider,
      isAuthenticatedStream: isAuthenticatedStream,
    );
    categoriesRepository = CategoriesRepositoryImpl(
      networkDataProvider: categoriesNetworkDataProvider,
    );
    coursesPreviewRepository = CoursesPreviewRepositoryImpl(
      networkDataProvider: coursePreviewsNetworkDataProvider,
    );
    coursePageRepository = CoursePageRepositoryImpl(
      networkDataProvider: coursePageNetworkDataProvider,
    );
    profileRepository = ProfileRepositoryImpl(
      profileNetworkDataProvider,
    );
  }
}