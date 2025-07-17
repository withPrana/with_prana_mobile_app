// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';

class InitialOption {
  String optionName;
  // int index;
  bool isSelected;

  InitialOption({
    required this.optionName,
    // required this.index,
    required this.isSelected,
  });
}

class InitialQuestionOptionController extends GetxController {
  final options =
      <InitialOption>[
        InitialOption(optionName: "🌙 Sleep better", isSelected: false),
        InitialOption(optionName: "🌿 Manage anxiety", isSelected: false),
        InitialOption(optionName: "✨ Reconnect spiritually", isSelected: false),
        InitialOption(optionName: "💓 Heal emotionally", isSelected: false),
      ].obs;
  final optionsTwo =
      <InitialOption>[
        InitialOption(optionName: "🌅 In the morning", isSelected: false),
        InitialOption(optionName: "🌞 Midday", isSelected: false),
        InitialOption(optionName: "🌙 Before bed", isSelected: false),
        InitialOption(optionName: "🔄 It varies", isSelected: false),
      ].obs;

  void selectOption(index) {
    final selectedOption = options.value[index];
    if (selectedOption.isSelected) {
      options[index].isSelected = false;
    } else {
      options[index].isSelected = true;
    }
    options.refresh();
  }

  void selectOptionTwo(index) {
    final selectedOption = optionsTwo.value[index];
    if (selectedOption.isSelected) {
      optionsTwo[index].isSelected = false;
    } else {
      optionsTwo[index].isSelected = true;
    }
    optionsTwo.refresh();
  }
}
