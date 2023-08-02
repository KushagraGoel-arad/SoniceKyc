
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sonicekyc/device_details.dart';

class permissions extends StatefulWidget {
  const permissions({super.key});

  @override
  State<permissions> createState() => _permissionsState();
}

class _permissionsState extends State<permissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Allow Permissions",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "When prompted, you must enable all",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                "permissions to continue",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  'images/all_Permi.png',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 350,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Container(
                    height: 50,
                    width: 80,
                    color: const Color(0xff302c32be),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            CupertinoIcons.info_circle_fill,
                            color: Color(0xFF2C32BE),
                          ),
                          onPressed: () {},
                        ),
                        const Expanded(
                            child: Text(
                          "We can't perform anything without your permissions",
                          style: TextStyle(fontSize: 16),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    backgroundColor: const Color(0xFF2C32BE),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const dev_details(),
                      ),
                    );
                  },
                  child: const Center(
                      child: Text(
                    "ALLOW PERMISSIONS",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
