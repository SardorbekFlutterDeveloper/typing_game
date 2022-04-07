import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  AnimationController? animationController;
  String tx =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do laborum. ";
  List gap = [];
  bool col = true;

  List l = [];

  @override
  void initState() {
    super.initState();
    gap = tx.split('');
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
      lowerBound: 0,
      upperBound: 400,
    );
    animationController!.addListener(() {
      setState(() {});
    });
    animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: col ? Colors.yellow : Colors.red,
        title: Text(
          "Typing Game",
          style: TextStyle(color: Colors.greenAccent, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    Positioned(
                      // right: animationController!.value,
                      child: Center(
                        child: Text(
                          tx,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: controller,
                cursorColor: col ? Colors.yellow : Colors.red,
                cursorHeight: 30,
                onChanged: (v) {
                  l = v.split('');
                  for (var i = 0; i < gap.length; i++) {
                    if (gap[i] == l[i]) {
                      setState(() {
                        col = true;
                      });

                      animationController!.stop();
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Winner')));
                    } else {
                      setState(() {
                        col = false;
                      });
                    }
                  }
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  animationController!.repeat();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),),),),
                child: const Icon(Icons.restart_alt_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }
}
