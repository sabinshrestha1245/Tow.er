import 'package:flutter/material.dart';

class CustomerCheckHistory extends StatefulWidget {
  const CustomerCheckHistory({Key? key}) : super(key: key);

  @override
  State<CustomerCheckHistory> createState() => _CustomerCheckHistoryState();
}

class _CustomerCheckHistoryState extends State<CustomerCheckHistory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check History"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            /*Positioned(
              top: 0,
              width: size.width,
              child: const Center(
                  child: Text(
                "Recipe of UoB",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),*/
            /*Positioned(
              top: 30,
              child: Row(
                children: [
                  SizedBox(
                    height: size.height / 3,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      //   crossAxisCount: 2,
                      //   childAspectRatio: 1,
                      //   // crossAxisSpacing: 10,
                      // ),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          // color: Colors.blue,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.network(
                                    "https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg",
                                    height: size.height / 3.2,
                                    width: size.width / 1.1,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  const Positioned(
                                      top: 5,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Most reputed menu",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      )),
                                  const Positioned(
                                      top: 20,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Price fixed from UK",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  const Positioned(
                                      bottom: 50,
                                      right: 20,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Managed by PCPS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  const Positioned(
                                      right: 20,
                                      bottom: 20,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Ajay Sharma",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ],
                                // child: Image.network("https://cdn.vox-cdn.com/thumbor/9qN-DmdwZE__GqwuoJIinjUXzmk=/0x0:960x646/1200x900/filters:focal(404x247:556x399)/cdn.vox-cdn.com/uploads/chorus_image/image/63084260/foodlife_2.0.jpg"),
                              ),

                              // Text("Most reputed menu"),
                              // Text("Price fixed from UK"),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),*/
            Positioned(
              // top: size.height / 2.6,
              top: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        const Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: size.height,
                          width: size.width,
                          child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        "https://cdn2.iconfinder.com/data/icons/avatars-60/5985/36-Grandfather-1024.png",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),

                                    // Image.network("https://patancollege.edu.np/wp-content/uploads/2018/03/ajaya-sharma.jpg", height: 50, width: 50,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: const [
                                        Text("Slow delivery as "),//add from database
                                        Text(
                                          "10 min ago",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /* Positioned(
                bottom: 0,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.network("https://cdn2.iconfinder.com/data/icons/picons-basic-2/57/basic2-158_home_house-1024.png", height: 25, width: 25,),
                            const Text("Home"),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network("https://cdn2.iconfinder.com/data/icons/picons-basic-2/57/basic2-158_home_house-1024.png", height: 25, width: 25,),
                            const Text("Home"),
                          ],
                        ),
                        Column(
                          children: [
                            Image.network("https://cdn2.iconfinder.com/data/icons/picons-basic-2/57/basic2-158_home_house-1024.png", height: 25, width: 25,),
                            const Text("Home"),
                          ],
                        ),




                      ],
                    ),
                  ),
                ))*/
          ],
        ),
      ),
    );
  }
}
