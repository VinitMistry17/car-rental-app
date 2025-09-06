import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C2B34),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/mercedes.webp'),
                    fit: BoxFit.cover,
                    alignment: const FractionalOffset(0.8, 0.5),
                  ),
                )
              ),
            ),
            
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Premium cars. \nEnjoy the luxury',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Premium and prestige car daily rental. \nExperience the thrill at a lower price',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                      onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,   // 👈 background white
                          foregroundColor: Colors.black,
                        ),
                          child: Text("Let's Go"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
