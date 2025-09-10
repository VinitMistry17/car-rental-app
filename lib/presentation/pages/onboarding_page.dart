import 'package:flutter/material.dart';
import 'car_list_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C2B34), // Dark background
      body: SafeArea(
        child: Column(
          children: [
            // Image section (top 2/3 of the screen)
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/mercedes.webp'),
                    fit: BoxFit.cover,
                    alignment: FractionalOffset(0.8, 0.5), // Left part inside screen
                  ),
                ),
              ),
            ),

            // Text and button section (bottom 1/3 of the screen)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), // horizontal padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const Text(
                      'Premium cars. \nEnjoy the luxury',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Subtitle
                    const Text(
                      'Premium and prestige car daily rental. \nExperience the thrill at a lower price',
                      style: TextStyle(
                        color: Colors.grey, // Can use Colors.grey[400] for more contrast
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // "Let's Go" button
                    SizedBox(
                      width: double.infinity, // full width minus padding
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to CarListScreen on button tap
                          //pushAndRemoveUntil() - Nayi screen par navigate
                          // karta hai aur previous screens ko remove kar deta hai
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => CarListScreen())
                              //(route) => false - Yeh condition hai jo kehti hai ki
                              // koi bhi previous route stack mein nahi rehna chahiye
                              ,(route) => false);

                          //Result: CarListScreen par jaayega aur back button dab kar
                          // user kisi previous screen par nahi ja sakta
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // button background
                          foregroundColor: Colors.black, // text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // rounded corners
                          ),
                        ),
                        child: const Text(
                          "Let's Go",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}