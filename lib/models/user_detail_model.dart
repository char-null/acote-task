import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_model.g.dart';
part 'user_detail_model.freezed.dart';

@freezed
class UserDetailModel with _$UserDetailModel {
  const UserDetailModel._();

  const factory UserDetailModel({
    required String name,
    String? description,
    String? language,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
  }) = _UserDetailModel;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);
}
