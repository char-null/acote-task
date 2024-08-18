import 'package:acote_task/models/user_detail_model.dart';
import 'package:acote_task/repositories/detail_repository.dart';
import 'package:acote_task/services/acote_api_service.dart';
import 'package:acote_task/viewmodels/home_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'detail_view_model.g.dart';

@riverpod
class DetailViewModel extends _$DetailViewModel {
  @override
  Future<List<UserDetailModel>> build() {
    return getUserDetailInfo();
  }

  Future<List<UserDetailModel>> getUserDetailInfo() async {
    final login = ref.watch(userLoginProvider);
    final detailRepository =
        DetailRepository(acoteApiService: AcoteApiService());
    return await detailRepository.getUserDetailInfo(login: login);
  }
}
