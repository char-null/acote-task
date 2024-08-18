import 'package:acote_task/models/user_detail_model.dart';
import 'package:acote_task/services/acote_api_service.dart';
import 'package:flutter/material.dart';

class DetailRepository {
  final AcoteApiService acoteApiService;

  DetailRepository({required this.acoteApiService});

  Future<List<UserDetailModel>> getUserDetailInfo(
      {required String login}) async {
    final List<UserDetailModel> detailInfoList = await acoteApiService
        .get<UserDetailModel>('/users/$login/repos', UserDetailModel.fromJson);
    return detailInfoList;
  }
}
