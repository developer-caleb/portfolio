import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matjipmemo/constants/firestore_keys.dart';

part 'writer.freezed.dart';
part 'writer.g.dart';

@freezed
class Writer with _$Writer {
  factory Writer(
      {@Default('') @JsonKey(name: KEY_WRITERIMG) String img, // = map[KEY_WRITERIMG],
      @Default('') @JsonKey(name: KEY_MAKERUID) String uid, // = map[KEY_MAKERUID],
      @Default('') @JsonKey(name: KEY_MAKERNAME) String name, //= map[KEY_MAKERNAME],
      @Default([]) @JsonKey(name: KEY_MAKER_FOLLOWERS) List<dynamic> followers, // = map[KEY_MAKER_FOLLOWERS] ?? [],
      @Default(false) @JsonKey(name: KEY_WRITERPRIVATE) bool private, // = map[KEY_WRITERPRIVATE] ?? false,
      @Default(false) @JsonKey(name: KEY_WRITER_BANNED) bool banned,
      @JsonKey(name: KEY_USER_LOCATION_CODE) String? locationCode,
      @JsonKey(name: KEY_USER_LANGUAGE_CODE) String? languageCode,
      @Default(true) @JsonKey(name: KEY_IS_WRITER_IMG_CIRCLE) bool isImgCircle, // = map[KEY_IS_WRITER_IMG_CIRCLE] ?? true,
      @Default(4294967295) @JsonKey(name: KEY_WRITER_BACKGROUND_COLOR) int backgroundColor //=Color(map[KEY_WRITER_BACKGROUND_COLOR] ?? 4294967295),
      }) = _Writer;

  factory Writer.fromJson(Map<String, dynamic> json) => _$WriterFromJson(json);
}
