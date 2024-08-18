import 'package:acote_task/models/user_detail_model.dart';
import 'package:acote_task/repositories/detail_repository.dart';
import 'package:acote_task/services/acote_api_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'detail_repository_test.mocks.dart';

@GenerateMocks([AcoteApiService, DetailRepository])
void main() {
  late AcoteApiService mockAcoteApiService;
  late DetailRepository detailRepository;

  setUp(() {
    mockAcoteApiService = MockAcoteApiService();
    detailRepository = DetailRepository(acoteApiService: mockAcoteApiService);
  });
  test('유저의 디테일 정보를 가져오는지 테스트', () async {
    const login = 'char-null';
    final mockUserDetailList = [
      UserDetailModel(name: 'acote-task', stargazersCount: 0),
      UserDetailModel(name: 'daily_jlpt_word', stargazersCount: 0),
    ];

    when(mockAcoteApiService.get(
      '/users/$login/repos',
      UserDetailModel.fromJson,
    )).thenAnswer((_) async => mockUserDetailList);

    final result = await detailRepository.getUserDetailInfo(login: login);
    expect(result, mockUserDetailList);

    verify(mockAcoteApiService.get(
      '/users/$login/repos',
      UserDetailModel.fromJson,
    )).called(1);
  });
}
