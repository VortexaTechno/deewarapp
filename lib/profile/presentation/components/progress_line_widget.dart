import 'package:ahlachat/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = Colors.lightBlueAccent,
    required this.sum,
    required this.total,

  }) : super(key: key);

  final Color color;

  final int sum;
  final int total;
  @override
  Widget build(BuildContext context) {
print(sum);
print(total-sum);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 8,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * ((total-sum)*100)/1000,
            height: 8,
            decoration: BoxDecoration(
              gradient: VipGradiant,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        // Container(
        //   width: double.infinity,
        //   height: 8,
        //   // child: Center(child:Text('$sum/$total',style: TextStyle(fontSize: 10,color: Colors.white),)),
        //   decoration: BoxDecoration(
        //     color: Colors.transparent,
        //     gradient: VipGradiant,
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //   ),
        // ),
      ],
    );
  }
}