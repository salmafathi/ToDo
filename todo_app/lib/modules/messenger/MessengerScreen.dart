import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 16.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                  'https://p1.pxfuel.com/preview/50/701/227/daisy-nature-glower-flora-royalty-free-thumbnail.jpg'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'chats',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {},
                color: Colors.white,
                iconSize: 13.0,
              )),
          SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.blue,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
                color: Colors.white,
                iconSize: 13.0,
              )),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, bottom: 10.0, top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  1- search
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10.0),
                    Text('Search')
                  ],
                ),
              ),

              SizedBox(
                height: 10.0,
              ),

              //stories
              Container(
                height: 100.0,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index)=> buildStoryItem(),
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5.0 ,),

                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              //chat list
              ListView.separated(
                itemBuilder: (BuildContext context, int index)=> buildChatItem(),
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 7.0 ,),

              ),


            ],
          ),
        ),
      ),
    );
  }

// build chat item
  Widget buildChatItem ()=> Row(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                'https://p1.pxfuel.com/preview/50/701/227/daisy-nature-glower-flora-royalty-free-thumbnail.jpg'),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 7.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 1.0, bottom: 1.0),
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 5.0,
            ),
          ),
        ],
      ),
      SizedBox(width: 20.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Salm Fathi',maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(child: Text('Hello Salma My mssg is here',maxLines: 1,overflow: TextOverflow.ellipsis,)),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            color: Colors.green,
            shape:BoxShape.circle ,
          ) ,
        ),
      ),
      Text('11:30AM'),

    ],
  ) ;

  //build story item
  Widget buildStoryItem ()=> Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://p1.pxfuel.com/preview/50/701/227/daisy-nature-glower-flora-royalty-free-thumbnail.jpg'),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 7.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 1.0, bottom: 1.0),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 5.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Salma Fathi',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

}
