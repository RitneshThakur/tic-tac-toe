import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tictactoe/widgets/text_widget.dart';

class GameController extends GetxController {
  RxInt count = 0.obs;
  RxList<String> gameValue = ["", "", "", "", "", "", "", "", ""].obs;
  RxBool isVal = false.obs;

  void addValue(int index) {
    if (gameValue[index] == "") {
      if (isVal.value) {
        gameValue[index] = "X";
        isVal.value = !isVal.value;
        count++;
        print("count:$count");
      } else {
        gameValue[index] = "O";
        isVal.value = !isVal.value;
        count++;
        print("count:$count");
      }
    } else {}
    matchWin();

    draw(count);
  }

  void matchWin() {
    if (gameValue[0] == gameValue[1] &&
        gameValue[0] == gameValue[2] &&
        gameValue[0] != "") {
      dialogBox();
    } else if (gameValue[0] == gameValue[4] &&
        gameValue[0] == gameValue[8] &&
        gameValue[0] != "") {
      dialogBox();
    } else if (gameValue[0] == gameValue[3] &&
        gameValue[0] == gameValue[6] &&
        gameValue[0] != "") {
      dialogBox();
    } else if (gameValue[3] == gameValue[4] &&
        gameValue[3] == gameValue[5] &&
        gameValue[3] != "") {
      dialogBox();
    } else if (gameValue[1] == gameValue[4] &&
        gameValue[1] == gameValue[7] &&
        gameValue[1] != "") {
      dialogBox();
    } else if (gameValue[6] == gameValue[7] &&
        gameValue[6] == gameValue[8] &&
        gameValue[6] != "") {
      dialogBox();
    } else if (gameValue[2] == gameValue[5] &&
        gameValue[2] == gameValue[8] &&
        gameValue[2] != "") {
      dialogBox();
    } else if (gameValue[1] == gameValue[4] &&
        gameValue[1] == gameValue[7] &&
        gameValue[1] != "") {
      dialogBox();
    } else if (gameValue[2] == gameValue[4] &&
        gameValue[2] == gameValue[6] &&
        gameValue[2] != "") {
      dialogBox();
    }
  }

  void draw(count) {
    if (count == 9) {
      Get.defaultDialog(
          title: "Match Draw",
          content: const Icon(
            IonIcons.sad,
            size: 40,
            color: Colors.black,
          ),
          confirm: TextButton(
            onPressed: () {
              gameValue.value = ["", "", "", "", "", "", "", "", ""];
              count.value = 0;
              Get.back();
            },
            child: const MyText("Play Again"),
          ),
          cancel: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const MyText('Cancel')));
    }
  }

  void dialogBox() {
    Get.defaultDialog(
        title: isVal.value ? "O win" : "X win",
        content: const Icon(
          FontAwesome.medal_solid,
          size: 40,
          color: Colors.orange,
        ),
        confirm: TextButton(
          onPressed: () {
            gameValue.value = ["", "", "", "", "", "", "", "", ""];
            count.value = 0;
            Get.back();
          },
          child: const MyText("Play Again"),
        ),
        cancel: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const MyText('Cancel')));
  }
}
