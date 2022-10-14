import 'package:flutter/material.dart';
import 'package:random_animation/page_route_transition/navigator/src/TransitionType.dart';

class NavigatorMenu extends StatelessWidget {

  const NavigatorMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: TransitionType.values.length,
          itemBuilder: (context, index){
            return  TransitionTypeWidget(index: index, type: TransitionType.values[index].name );
          },
        ),
      ),
    );
  }
}

class TransitionTypeWidget extends StatelessWidget {
  final int index;
  final String type;

  const TransitionTypeWidget({
    required this.index,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "NavigatorReturn", arguments: {"EFFECT": TransitionType.values[index], "CHILD_WIDGET": this });
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text( type, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal)),
      ),
    );
  }
}
