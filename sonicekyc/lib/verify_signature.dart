
// import 'package:flutter/material.dart';
// import 'package:sonicekyc/kyc_completed.dart';

// class verify_signature extends StatefulWidget {
//   const verify_signature({super.key});

//   @override
//   State<verify_signature> createState() => _verify_signatureState();
// }

// class _verify_signatureState extends State<verify_signature> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Verify Signature",
//               style: TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               "Please verify taken image",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[500],
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Center(
//               child: Container(
//                 width: 300,
//                 height: 300,

//                 child: Image.network(
//                   pictureFile!.path,
//                   fit: BoxFit.cover,
//                 ),
//                 // decoration: BoxDecoration(
//                 //   borderRadius: BorderRadius.circular(10),
//                 //   image: DecorationImage(
//                 //     image: FileImage(File(imagePath)),
//                 //     fit: BoxFit.cover,
//                 //   ),
//                 // ),
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             const Text(
//               "   Make sure your details are clear and unobstructed ",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(
//               height: 300,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(5))),
//                   backgroundColor: const Color(0xFF2C32BE),
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const kyc_completed(),
//                     ),
//                   );
//                 },
//                 child: const Center(
//                     child: Text(
//                   "SUBMIT PHOTO",
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 )),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                   ),
//                   backgroundColor: Colors.white,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     showFirstScreen = !showFirstScreen;
//                   });
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => verify_doc(),
//                   //   ),
//                   // );
//                 },
//                 child: const Center(
//                     child: Text(
//                   "RETAKE PHOTO",
//                   style: TextStyle(color: Color(0xFF2C32BE), fontSize: 18),
//                 )),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
