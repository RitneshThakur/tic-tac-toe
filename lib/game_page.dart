import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:tictactoe/controllers/game_controllers.dart';
import 'package:tictactoe/widgets/text_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    GameController controller = Get.put(GameController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          children: [
            MyText(
              "𝗧𝗶𝗰",
              fontSize: 40,
              color: Colors.white,
            ),
            MyText(
              "𝗧𝗮𝗰",
              fontSize: 40,
              color: Colors.red,
            ),
            MyText(
              "𝗧𝗼𝗲",
              fontSize: 40,
              color: Colors.indigo,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(() {
                return controller.isVal.value == false
                    ? AnimatedGradientBorder(
                        gradientColors: const [
                          Colors.purple,
                          Colors.white,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.blueGrey
                        ],
                        borderSize: 2,
                        glowSize: 10,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: controller.isVal.value == true
                                ? Colors.grey
                                : Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                              child: MyText(
                            'O',
                            fontSize: 30,
                          )),
                        ),
                      )
                    : Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: controller.isVal.value == true
                              ? Colors.grey
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                            child: MyText(
                          'O',
                          fontSize: 30,
                        )),
                      );
              }),
              Obx(() {
                return controller.isVal.value == true
                    ? AnimatedGradientBorder(
                        gradientColors: const [
                          Colors.purple,
                          Colors.white,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                          Colors.blueGrey
                        ],
                        borderSize: 2,
                        glowSize: 10,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: controller.isVal == false
                                ? Colors.grey
                                : Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                              child: MyText(
                            'X',
                            fontSize: 30,
                          )),
                        ),
                      )
                    : Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: controller.isVal.value == false
                              ? Colors.grey
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                            child: MyText(
                          'X',
                          fontSize: 30,
                        )),
                      );
              }),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      controller.addValue(index);
                      print(index.toString());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey),
                      child: Center(child: Obx(() {
                        return MyText(
                          controller.gameValue[index],
                          fontSize: 40,
                        );
                      })),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
