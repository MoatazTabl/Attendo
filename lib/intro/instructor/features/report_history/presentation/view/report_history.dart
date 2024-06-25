import 'package:flutter/material.dart';

class ReportHistory extends StatelessWidget {
  const ReportHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
          children: [
            Expanded(
              child: ListView.separated(separatorBuilder: (context, index) {
                return Divider();
              },itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {

                  },
                  title: Text("Ai"),
                  trailing: Text("Ai"),
                  leading: Text("Ai"),
                );
              },itemCount: 5,),
            )
          ],
        ),
    );

  }
}
