// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Drawing App"),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             CustomPaint(
//               foregroundPainter: Mypainter(),
//               child: const SizedBox(
//                 height: 350,
//                 width: double.infinity,
//                 // color: Colors.amber,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Mypainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint brush = Paint()
//       ..color = Colors.redAccent
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 5;
//
//     Path path = Path();
//
//     path.moveTo(0, size.height * 0.75);
//     path.quadraticBezierTo(
//       size.width * 0.25,
//       size.height * 0.50,
//       size.width * 0.50,
//       size.height * 0.75,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.75,
//       size.height,
//       size.width,
//       size.height * 0.75,
//     );
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     canvas.drawPath(path, brush);
//
//     Paint brush2 = Paint()
//       ..color = Colors.transparent
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 5;
//
//     Path path1 = Path();
//
//     path.moveTo(0, size.height * 0.80);
//     path.quadraticBezierTo(
//       size.width * 0.25,
//       size.height * 0.65,
//       size.width * 0.40,
//       size.height * 0.75,
//     );
//     path.quadraticBezierTo(
//       size.width * 0.80,
//       size.height,
//       size.width,
//       size.height * 0.55,
//     );
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//
//     canvas.drawPath(path, brush);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

import 'dart:math';

import 'package:animation/newpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "NewPage": (context) => const NewPage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Map> planets = [
    {
      "name": "Mercury",
      'km': "108.6 km",
      'de': "8.87m/s2",
      'nickname': "Milkyway Galaxy",
      'image': 'assets/images/download__5_-removebg-preview.png',
      'description':
          'Mercury is hard to study because it is so close to the sun. People have never gone to Mercury. Spacecraft without people have gone. Mariner 10 was the first to visit Mercury. It flew by in 1974 and 1975. Not even half of Mercury was seen then.',
    },
    {
      "name": "Venus",
      'km': "108.6 km",
      'de': "8.87m/s2",
      'nickname': "Milkyway Galaxy",
      'image': 'assets/images/download-removebg-preview.png',
      'description':
          'Some of the Russian Venera probes did, indeed, detect particles in Venus’ lower atmosphere about a micron in length – roughly the same size as a bacterium on Earth.',
    },
    {
      "name": "Earth",
      'km': "108.6 km",
      'de': "8.87m/s2",
      'nickname': "Milkyway Galaxy",
      'image': 'assets/images/download__2_-removebg-preview.png',
      'description':
          'Earth is the third planet from the Sun and the only astronomical object known to harbor life. While large volumes of water can be found throughout the Solar System, only Earth sustains liquid surface water. About 71% of Earths surface is made up of the ocean, dwarfing Earths polar ice, lakes, and rivers. The remaining 29% of Earths surface is land, consisting of continents and islands',
    },
    {
      "name": "Mars",
      'km': "108.6 km",
      'de': "8.87m/s2",
      'nickname': "Milkyway Galaxy",
      'image': 'assets/images/download__4_-removebg-preview.png',
      'description':
          'Mars is rocky with canyons, volcanoes and craters all over it. Red dust covers almost all of Mars. It has clouds and wind, just as Earth does. Sometimes the wind blows the red dust into a dust storm. Tiny dust storms can look like tornados, and large ones can cover the whole planet! Mars has about one-third the gravity of Earth. A rock dropped on Mars would fall slower than a rock dropped on Earth.',
    },
    {
      "name": "Jupiter",
      'km': "108.6 km",
      'de': "8.87m/s2",
      'nickname': "Milkyway Galaxy",
      'image': 'assets/images/download__1_-removebg-preview.png',
      'description':
          'Jupiter is the fifth planet from the sun. From Earth, it is almost always the second brightest planet in the night sky. Venus is brighter. The planet is named after another Jupiter. He was the king of the gods in old Roman stories.  ',
    },
    {
      "name": "Saturn",
      'km': "108.6 km",
      'de': "8.87m/s2",
      'nickname': "Milkyway Galaxy",
      'image': 'assets/images/download__3_-removebg-preview.png',
      'description':
          'Some of the rings are close together. Others have large gaps between them. The rings do not sit still. They circle around Saturn at very high speeds. A closer look shows that each large ring is made up of many small rings. The small rings are sometimes called ringlets. More rings and ringlets could still be discovered',
    },
  ];

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      lowerBound: 0,
      upperBound: pi * 2,
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GALAXY PLANETS"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.search)],
      ),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: planets
              .map(
                (e) => Stack(
                  alignment: const Alignment(-0.80, 0),
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 90, bottom: 20, top: 20),
                      height: 150,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "${e['name']}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: animationController,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .popAndPushNamed("NewPage", arguments: e);
                        },
                        child: Image(
                          image: AssetImage('${e['image']}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      builder: (context, widget) {
                        return Transform.rotate(
                          angle: animationController.value,
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: widget,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
