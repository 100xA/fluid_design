import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ExersiceSelection()));
}

class ExersiceSelection extends StatelessWidget {
  const ExersiceSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const Exersice1()));
              },
              child: const Text("Exersice 1"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Exersice2()));
              },
              child: const Text("Exersice 2"),
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
          width: size.width,
          
          child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Icon(
              Icons.person,
              size: size.height * 0.05,
            ),
            SizedBox(width: size.width * 0.02),
            Flexible(child: 
            Column(
              children: [
             Text(
                    "Flutter McFlutter",
                    style: TextStyle(fontSize: size.height * 0.028),
                
                
                 ),
                
                 
                Text("Experienced App Developer",
                    style: TextStyle(fontSize: size.height * 0.020),),
                 
                 
              ],
            ),
        ),
            
          ],
        ),
        ),
        SizedBox(height: size.height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height * 0.04),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child:
              Text("123 Main Street",
                    style: TextStyle(fontSize: size.height * 0.02),),), Flexible(child: Text("(415) 555-0198",
                    style: TextStyle(fontSize: size.height * 0.02),),)],
          ),
        ),
        SizedBox(height: size.height * 0.01),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(child: Icon(Icons.man)),
            Flexible(child:    Icon(Icons.punch_clock),),
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
          margin: const EdgeInsets.all(8.0),
          height: 100.0,
          width: 100.0,
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
