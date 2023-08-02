
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonicekyc/camera_access.dart';
import 'package:sonicekyc/pass_camera.dart';

class docs extends StatefulWidget {
  const docs({super.key});

  @override
  State<docs> createState() => _docsState();
}

class _docsState extends State<docs> {
  late bool selectedOption = true;
  List items = ['passport'];
  List items1 = ['myKad'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose your Document",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Select your document from the list",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              height: 20,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                RadioListTile(
                  title: const Text(
                    'Accepted Documents',
                    style: TextStyle(fontSize: 18),
                  ),
                  value: selectedOption,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      !selectedOption;
                    });
                  },
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {

                      return Card(
                        // shape: RoundedRectangleBorder(
                        //   side: BorderSide(
                        //     color: Colors.black,
                        //     width: 2.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        child: ListTile(
                          leading: Image.asset(
                            'images/passport.png',
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            items[index],
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          subtitle: const Text("photo page"),
                          trailing: const Icon(
                            CupertinoIcons.arrow_right_circle,
                            color: Colors.black,
                            size: 30,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CameraScreen(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    // physics: const BouncingScrollPhysics(),
                    itemCount: items1.length,
                    //scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {

                      return Card(
                        // shape: RoundedRectangleBorder(
                        //   side: BorderSide(
                        //     color: Colors.black,
                        //     width: 2.0,
                        //   ),
                        //   borderRadius: BorderRadius.circular(5),
                        // ),
                        child: ListTile(
                          leading: Image.asset(
                            'images/passport.png',
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            items1[index],
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          subtitle: const Text("Front and Back"),
                          trailing: const Icon(
                            CupertinoIcons.arrow_right_circle,
                            color: Colors.black,
                            size: 30,
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 500,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
