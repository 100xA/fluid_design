import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const ExersiceSelection());
}

class ExersiceSelection extends StatelessWidget {
  const ExersiceSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "exersice1" : (context) => const Exersice1(),
          "exersice2" : (context) => const Exersice2(),
            "exersice3" : (context) => const Exersice3(),
      } , 
        builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
        home: const LandingPage());


        
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, "exersice1");
                  },
                  child: const Text("Exersice 1"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, "exersice2");
                  },
                  child: const Text("Exersice 2"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "exersice3");
                  },
                  child: const Text("Exersice 3"),
                ),
              ],
            ),
          ),
        );
  }
}

class Exersice1 extends StatelessWidget {

  const Exersice1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: size.height * 0.4),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: size.height * 0.05,
              ),
              SizedBox(width: size.width * 0.02),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      "Flutter McFlutter",
                      style: TextStyle(fontSize: size.height * 0.028),
                    ),
                    Text(
                      "Experienced App Developer",
                      style: TextStyle(fontSize: size.height * 0.020),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "123 Main Street",
                  style: TextStyle(fontSize: size.height * 0.02),
                ),
              ),
              Flexible(
                child: Text(
                  "(415) 555-0198",
                  style: TextStyle(fontSize: size.height * 0.02),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: size.height * 0.01),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(child: Icon(Icons.man)),
            Flexible(
              child: Icon(Icons.punch_clock),
            ),
            Flexible(child: Icon(Icons.phone_android)),
            Flexible(child: Icon(Icons.phone_iphone)),
          ],
        ),
      ],
    ));
  }
}

class Exersice2 extends StatelessWidget {
  const Exersice2({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: calculateCrossAxisCount(context),
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.primaries[index % Colors.primaries.length],
        );
      },
    );
  }

  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 600) {
      return 4;
    } else {
      return 2;
    }
  }
}

class Exersice3 extends StatelessWidget {
  const Exersice3({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: calculateBreakPoint(context),
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.primaries[index % Colors.primaries.length],
        );
      },
    );
  }

  int calculateBreakPoint(BuildContext context) {
    if (ResponsiveBreakpoints.of(context).largerThan(MOBILE)) {
      return 4;
    } else {
      return 2;
    }
  }
}
