import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isNotChangedPage = true;
  
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (t) {
      isNotChangedPage?Navigator.pushNamedAndRemoveUntil(context, "/",
              (route) => false):null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/splash_bg.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30,right: 30,top: 100),
          child: Column(
            children: [
              Image.asset('assets/logo.png',width: 145,),
              SizedBox(height: 30,),
              Text("Animal Biography",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),
              ),
              SizedBox(height: 180,),
              Text("Ready to watch?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(height: 10,),
              Text("Animal biography is a global leader in real life Entertainment serving a passionate audience superfans around the world with content that inspire informs and entertain.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: (){
                    isNotChangedPage = false;
                    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                  },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 60),
                  padding: EdgeInsets.only(left: 20,right: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Get Started",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                        onPressed: null,
                      mini: true,
                      child: Icon(Icons.navigate_next_rounded),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
