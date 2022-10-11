import 'package:flutter/material.dart';
import 'package:plants_app/core/components/component.dart';
import 'package:plants_app/core/utils/media_quary.dart';
import 'package:plants_app/core/widgets/custom_button.dart';
import 'package:plants_app/view/scan/widgets/custom_list_tail.dart';

import 'blogs_screen.dart';

class ScanDetails extends StatelessWidget {
  const ScanDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/img_4.png',
              width: context.width,
              height: context.height * 0.5,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.4),
              colorBlendMode: BlendMode.darken,
            ),
            Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: context.height * 0.04,
              ),
              CustomListTail(
                text: '78 %',
                image: 'assets/images/sun.png',
                subtext: 'sun light',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomListTail(
                text: '10 %',
                image: 'assets/images/water.png',
                subtext: 'water capacity',
              ),
              const SizedBox(
                height: 5,
              ),
              CustomListTail(
                text: '29 c',
                image: 'assets/images/temp.png',
                subtext: 'temperature',
              ),
              const SizedBox(
                height: 25,
              ),
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SNAKE PLANT (SANSEVIERIA)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                       Text(
                        'Native to southern Africa, '
                        'snake plants are well adapted to conditions similar to '
                        'those in southern regions of the United States. '
                        'Because of this, they may be grown outdoors for part'
                        ' of all of the year in USDA zones 8 and warmer',
                        style: TextStyle(
                          color: Colors.grey[400]!,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Common Snake Plant Diseases',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const  SizedBox(height: 7),
                      Text(
                        'A widespread problem with snake plants is root rot.'
                            ' This results from over-watering the soil of the'
                            ' plant and is most common in the colder months of '
                            'the year. When room rot occurs, the plant roots can'
                            ' die due to a lack of oxygen and an overgrowth of fungus '
                            'within the soil. If the snake plant\'s soil is soggy, certain '
                            'microorganisms such as ,',
                        style: TextStyle(
                          color: Colors.grey[400]!,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomButton(
                        text: 'Go To Blog',
                        onTab: (){
                          navPush(
                              context: context,
                              page: BlogsScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
