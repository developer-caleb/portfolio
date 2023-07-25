// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventModel _$$_EventModelFromJson(Map<String, dynamic> json) =>
    _$_EventModel(
      type: Serializable.fromEvent(json['type']),
      remains: json['remains'] as int,
      earnedStamps: json['earnedStamps'] as int,
      isEnded: json['isEnded'] as bool,
      isCompleted: json['isCompleted'] as bool,
      isReceived: json['isReceived'] as bool,
    );

Map<String, dynamic> _$$_EventModelToJson(_$_EventModel instance) =>
    <String, dynamic>{
      'type': _$EventTypeEnumMap[instance.type]!,
      'remains': instance.remains,
      'earnedStamps': instance.earnedStamps,
      'isEnded': instance.isEnded,
      'isCompleted': instance.isCompleted,
      'isReceived': instance.isReceived,
    };

const _$EventTypeEnumMap = {
  EventType.normal: 'normal',
  EventType.giveaway: 'giveaway',
  EventType.stamp: 'stamp',
};
