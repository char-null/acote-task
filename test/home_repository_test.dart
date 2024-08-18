import 'package:acote_task/models/user_model.dart';
import 'package:acote_task/repositories/home_repository.dart';
import 'package:acote_task/services/acote_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'detail_repository_test.mocks.dart';

@GenerateMocks([AcoteApiService, HomeRepository])
void main() {
  late AcoteApiService mockAcoteApiService;
  late HomeRepository homeRepository;

  setUp(() {
    mockAcoteApiService = MockAcoteApiService();
    homeRepository = HomeRepository(acoteApiService: mockAcoteApiService);
  });
  test('유저리스트 가져오는지 테스트', () async {
    const perPage = 30;
    const since = 0;
    final mockUserList = [
      UserModel(login: 'test', id: 1, avatarUrl: 'testurl')
    ];

    when(mockAcoteApiService.get(
      '/users?since=$since&per_page=$perPage',
      UserModel.fromJson,
    )).thenAnswer((_) async => mockUserList);

    final result = await homeRepository.getUserLists(since: 0);
    expect(result, mockUserList);

    verify(mockAcoteApiService.get(
      '/users?since=$since&per_page=$perPage',
      UserModel.fromJson,
    )).called(1);
  });
}
