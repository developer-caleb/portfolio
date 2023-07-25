import 'package:freezed_annotation/freezed_annotation.dart';

part 'volume_model_res.freezed.dart';

part 'volume_model_res.g.dart';

@freezed
class VolumeModelRes with _$VolumeModelRes {
  const factory VolumeModelRes({
    int? diaryVolumeSeq,
    int? creatorSeq,
    List<Member>? memberList,
    Map<String, Object?>? groupingWriteDate,
  }) = _VolumeModelRes;

  factory VolumeModelRes.fromJson(Map<String, Object?> json) =>
      _$VolumeModelResFromJson(json);
}

@freezed
class Member with _$Member {
  const factory Member({
    int? userSeq,
    String? role,
  }) = _Member;

  factory Member.fromJson(Map<String, Object?> json) =>
      _$MemberFromJson(json);
}