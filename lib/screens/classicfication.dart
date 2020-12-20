import 'package:flutter/material.dart';
import 'package:music_classification/provider/classification_provider.dart';
import 'package:provider/provider.dart';

class Classification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F5F8),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 55, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Classifications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<ClassificationData>(
                builder: (context, data, child) {
                  return ListView.separated(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (_, index) => SizedBox(
                      child: Divider(),
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  title: Text('Classification'),
                                  content: Text(
                                    'Classified as ${data.classified[index].classification}',
                                    style: TextStyle(
                                        color: data.classified[index]
                                                    .classification ==
                                                'music'
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/img.png'),
                          ),
                          title: Text(data.classified[index].name),
                          subtitle: Text(
                            'Classified',
                            style: TextStyle(color: Colors.green),
                          ),
                          trailing: Icon(Icons.more_vert),
                        ),
                      );
                    },
                    itemCount: data.classified.length,
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
