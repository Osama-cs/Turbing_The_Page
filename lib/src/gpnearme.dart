import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GPNearMePage extends StatefulWidget {
  const GPNearMePage({Key? key}) : super(key: key);

  @override
  _GPNearMePageState createState() => _GPNearMePageState();
}

class _GPNearMePageState extends State<GPNearMePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(51.476646, -3.169290);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> _markers = <Marker>[];
    _markers.add(const Marker(
        markerId: MarkerId('Marker1'),
        position: LatLng(51.482397, -3.169616),
        infoWindow: InfoWindow(
            title: 'Clearwater Counselling in Central Cardiff, CF24 0HA')));
    _markers.add(const Marker(
        markerId: MarkerId('Marker2'),
        position: LatLng(51.488310, -3.158244),
        infoWindow:
            InfoWindow(title: 'Connected Counselling Cardiff, CF24 1DH')));
    _markers.add(const Marker(
        markerId: MarkerId('Marker3'),
        position: LatLng(51.470748, -3.170038),
        infoWindow: InfoWindow(title: 'Butetown Medical Practice, CF10 5HW')));
    _markers.add(const Marker(
        markerId: MarkerId('Marker4'),
        position: LatLng(51.473198, -3.186644),
        infoWindow: InfoWindow(title: 'Saltmead Medical Centre, CF11 6QQ')));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.shade100,
          title: const Text(
            "GP/Counsellor Near Me",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
              markers: Set<Marker>.of(_markers),
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
