import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hanaromart/data/helper/serialiazable.dart';
import 'package:hanaromart/tools/enums.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  factory EventModel({
    @JsonKey(
      fromJson: Serializable.fromEvent,
    )
    required EventType type,
    required int remains,
    required int earnedStamps,
    required bool isEnded,
    required bool isCompleted,
    required bool isReceived,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
}
