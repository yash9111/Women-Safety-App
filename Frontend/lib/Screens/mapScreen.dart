// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   final GlobalKey<GoogleMapStateBase> _mapKey = GlobalKey<GoogleMapStateBase>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map Screen on Web'),
//       ),
//       body: Stack(
//         children: <Widget>[
//           // Display the background image.
//           Image.asset(
//             'assets/background_image.jpg', // Replace with your image path.
//             fit: BoxFit.cover,
//             height: double.infinity,
//             width: double.infinity,
//             alignment: Alignment.center,
//           ),
//           // Display the Google Map widget.
//           GoogleMap(
//             key: _mapKey,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(37.7749, -122.4194), // Replace with your desired initial map coordinates.
//               zoom: 14.0, // Adjust the initial zoom level.
//             ),
//             onMapCreated: (controller) {
//               _mapKey.currentState?.mapController = controller;
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class GoogleMapStateBase {
// }
