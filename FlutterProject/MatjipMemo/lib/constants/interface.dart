import 'package:matjipmemo/tools/enums.dart';

class OptionSelect{
  void onOptionSelected(OptionType optionType, bool selected){
    print("click!!$optionType -> $selected");
  }
}