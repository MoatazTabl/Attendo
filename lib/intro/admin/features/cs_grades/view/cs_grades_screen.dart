import 'package:flutter/material.dart';

class CsGradesScreen extends StatelessWidget {
  CsGradesScreen({Key? key}) : super(key: key);
  List<String> grades = ["First", "Second", "Third", "Fourth"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  child: Center(child: Text(grades[index])),
                );
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
