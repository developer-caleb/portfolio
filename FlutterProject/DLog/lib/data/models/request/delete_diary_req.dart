import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_diary_req.freezed.dart';

part 'delete_diary_req.g.dart';

@freezed
class DeleteDiaryReq with _$DeleteDiaryReq {
  const factory DeleteDiaryReq({
    required int diarySeq,
    required int diaryVolumeSeq,
    required int userSeq,
  }) = _DeleteDiaryReq;

  factory DeleteDiaryReq.fromJson(Map<String, Object?> json) =>
      _$DeleteDiaryReqFromJson(json);
}
