import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllStudentsScreen extends StatelessWidget {
  const AllStudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 50,
              mainAxisSpacing: 30,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                height: 50,
                width: 50,
              );
            },
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}
