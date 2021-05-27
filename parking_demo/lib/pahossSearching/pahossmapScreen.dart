import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapping extends StatefulWidget {
  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(23.724721320929156, 92.71896123865986), zoom: 12),
      ),
    );
  }
}

// class GoogleMapping extends StatefulWidget {
//   @override
//   _GoogleMappingState createState() => _GoogleMappingState();
// }

// class _GoogleMappingState extends State<GoogleMapping> {
//   GoogleMapController mapController;
//   String searchAddr;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         child: Column(
//           children: [
//             SearchMapPlaceWidget(
//               placeholder: 'Enter Address',
//               placeType: PlaceType.address,
//               hasClearButton: true,
//               apiKey: 'AIzaSyCqj0db8xNoYz65m8SyubzUIx-OxFdvo74',
//               onSelected: (Place place) async {
//                 Geolocation geolocation = await place.geolocation;
//                 mapController.animateCamera(
//                     CameraUpdate.newLatLng(geolocation.coordinates));
//                 mapController.animateCamera(
//                     CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
//               },
//             ),
//             SizedBox(
//               height: 500,
//               child: GoogleMap(
//                 onMapCreated: (GoogleMapController gmapController) {
//                   setState(() {
//                     mapController = gmapController;
//                   });
//                 },
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(21, 79),
//                 ),
//                 mapType: MapType.satellite,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
