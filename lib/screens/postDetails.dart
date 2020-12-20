import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(data["photo"]),
              radius: 50,
            ),
            Image.network(data["postImage"]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                        text: data["userName"],
                        children: [
                          TextSpan(
                              text: '\n${data["postDescription"]}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: '\n${data["postDate"]}',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  height: 2))
                        ]),
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.black),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${data["reacts"]} Likes',
                        style: TextStyle(color: Colors.black)),
                    Text('${data["comments"]} Comments',
                        style: TextStyle(color: Colors.black)),
                    Text('${data["shares"]} Shares',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
                SizedBox(height: 10),
              ],
            )
          ],
        ),
      ),
    );
  }
}
