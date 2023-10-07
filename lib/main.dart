import 'package:flutter/material.dart';
import 'dart:async';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'naturo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  Dashboard(),
    );
  }
}
 class Dashboard extends StatefulWidget {
   const Dashboard({Key? key}) : super(key: key);
 
   @override
   State<Dashboard> createState() => _DashboardState();
 }
final controller = PersistentTabController(initialIndex: 0);
 List<Widget> _buildScreen(){
return[
  HomePage(),
  HomePage(),
  HomePage(),

];
 }
List<PersistentBottomNavBarItem> _navBarItem(){
   return[
     PersistentBottomNavBarItem(icon: Icon(Icons.home, color:Colors.green)),
     PersistentBottomNavBarItem(icon: Icon(Icons.person, color:Colors.green)),
     PersistentBottomNavBarItem(icon: Icon(Icons.shopping_bag, color:Colors.green))

   ];
}

 class _DashboardState extends State<Dashboard> {
   @override
   Widget build(BuildContext context) {
     return PersistentTabView(context, screens: _buildScreen(),
       items: _navBarItem(),
       backgroundColor: Colors.white10,
     );
   }
 }
 











class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _sliderValue = 0.0;
  List<String> imageAssets = [
    'asset/brushes.jpg', // Replace with the correct asset path
    'asset/banner2.png', // Replace with the correct asset path
    'asset/brushes.jpg',
    // Replace with the correct asset path
// Replace with the correct asset path
  ];

  Timer? _timer;
  int _durationInSeconds = 5;
  late PageController _pageController; // Declare PageController

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize PageController
    startSliderAutomation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }

  void startSliderAutomation() {
    _timer = Timer.periodic(Duration(seconds: _durationInSeconds), (timer) {
      setState(() {
        int nextPage = (_pageController.page?.toInt() ?? 0) + 1;
        if (nextPage >= imageAssets.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
            nextPage,
            duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('naturo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 20),
          Container(
            child: Center(
                child: Text(
                  'naturo Organic Bamboo Toothbrush',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                )),
          ),


          SizedBox(height: 20),
          SizedBox(
            height: 250.0,
            child: PageView.builder(
              itemCount: imageAssets.length,
              controller: _pageController, // Use the PageController

              // controller: PageController(
              //   initialPage: _sliderValue.toInt(),
              //   viewportFraction: 0.7,
              // ),
              onPageChanged: (int index) {                  setState(() {
                _sliderValue = index.toDouble();
              });
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    imageAssets[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          Slider(
            value: _sliderValue,
            min: 0.0,
            max: imageAssets.length - 1.0,
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
              });
            },
            divisions: imageAssets.length - 1,
            label: _sliderValue.toString(),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center,
              children:[Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Respond to mother earth\'s desperate call, quit plastic go natural..',style:TextStyle(
                    fontSize: 20, fontWeight:FontWeight.bold
                )),
              )]),
          Expanded(
            child: GridView(
                shrinkWrap: true,
                children:[
                  SizedBox(
                      height: 200,
                      width:100,
                      child: Card(child:SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height:20),
                            Text('naturo organinc Bamboo toothbrush'),
                            SizedBox(height:140,child: Image.asset('asset/PackOf1.png')),
                            Column(
                              children: [
                                Text('Pack of 1',style:TextStyle(fontSize: 10)),
                                Text('₹ 80, 80/count',style:TextStyle(fontSize: 10))
                              ],
                            )],
                        ),
                      ),))   ,
                  SizedBox(
                      height: 200,
                      width:100,
                      child: Card(child:SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height:20),
                            Text('naturo organinc Bamboo toothbrush'),
                            Image.asset('asset/PackOf5.png'),
                            Column(
                              children: [
                                Text('Pack of 5',style:TextStyle(fontSize: 10)),
                                Text('₹ 270, 54/count',style:TextStyle(fontSize: 10))
                              ],
                            )],
                        ),
                      ),))   ,

                  SizedBox(
                height: 200,
                  width:100,
                  child: Card(child:SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height:20),
                        Text('naturo organinc Bamboo toothbrush'),
                        Image.asset('asset/PackOf3.png'),
                      Column(
                        children: [
                          Text('Pack of 3',style:TextStyle(fontSize: 10)),
                          Text('₹ 140, 70/count',style:TextStyle(fontSize: 10))
                        ],
                      )],
                    ),
                  ),))   ,
                  SizedBox(
                      height: 200,
                      width:100,
                      child: Card(child:SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height:20),
                            Text('naturo organinc Bamboo toothbrush'),
                            Image.asset('asset/PackOf4.png'),
                            Column(
                              children: [
                                Text('Pack of 4',style:TextStyle(fontSize: 10)),
                                Text('₹ 224, 56/count',style:TextStyle(fontSize: 10))
                              ],
                            )],
                        ),
                      ),))   ,

                  SizedBox(
                      height: 200,
                      width:100,
                      child: Card(child:SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height:20),
                            Text('naturo organinc Bamboo toothbrush'),
                            Image.asset('asset/packOf2.png'),
                            Column(
                              children: [
                                Text('Pack of 2',style:TextStyle(fontSize: 10)),
                                Text('₹ 140, 70/count',style:TextStyle(fontSize: 10))
                              ],
                            )],
                        ),
                      ),))   ,
            ],gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10, childAspectRatio: (0.7 / .9),
            )),
          )
        ],
      ),
    );
  }
}
