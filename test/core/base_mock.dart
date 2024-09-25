import 'package:kib_challenge/core/data_sources/api_helper/app_api_helper.dart';
import 'package:kib_challenge/core/data_sources/utils/network/base_network_info.dart';
import 'package:mockito/annotations.dart';

import 'base_mock.mocks.dart';

// Base class containing common mocks
@GenerateMocks([AppApiHelper, NetworkInfo])
abstract class BaseMockClass {
  late MockAppApiHelper mockService;
  late MockNetworkInfo mockNetworkInfo;

  void setUpMocks() {
    mockService = MockAppApiHelper();
    mockNetworkInfo = MockNetworkInfo();
  }
}
