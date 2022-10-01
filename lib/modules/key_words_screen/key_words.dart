import 'package:flutter/material.dart';

class KeyWordsScreen extends StatelessWidget {
  KeyWordsScreen({Key? key}) : super(key: key);
  final List<String> modelKeyWords = <String>[
    'chronic water stress',
    'water stress',
    'temperate forest biome',
    'chronic water',
    'Monroe State Forest',
    'water availability',
    'tree species',
    'rising atmospheric',
    'tree',
    'tree growth',
    'gains in carbon',
    'nitrogen deposition',
    'phenology trends',
    'increasing water stress',
    'water stress decreased',
    'water stress induced',
    'forest biome',];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/Space2.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: modelKeyWords.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                margin: EdgeInsets.all(5),
                // color: msgCount[index]>=10? Colors.blue[400] msgCount[index]>3? Colors.blue[100]: Colors.grey,
                child: Container(
                  child: Padding(
                    padding:EdgeInsets.fromLTRB(3, 0,0,0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:[
                          Expanded(
                            child: TextButton(

                              onPressed: () {

                                print("Do something!");

                              },
                              style: ButtonStyle(
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,


                                  minimumSize:MaterialStateProperty.all(Size(double.infinity, 14)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40.0)),
                                  ),


                                  backgroundColor:
                                  MaterialStateProperty.all(

                                      Colors.black26

                                  )),

                              child:Text('${modelKeyWords[index]} ',
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.left,


                              ),
                            ),

                          ),
                        ]

                    ),
                  ),
                ),
              );
            }
        ),
      ]),
    );
  }
}

