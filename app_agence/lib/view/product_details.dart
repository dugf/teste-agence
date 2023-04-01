import 'dart:async';
import 'package:app_agence/view/widget/alert_dialog_buy_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProductDetails extends StatefulWidget {
  final String? title;
  final String? description;
  final String? image;
  final double? latitude;
  final double? longitude;

  const ProductDetails(
      {Key? key,
      this.title,
      this.description,
      this.latitude,
      this.longitude,
      this.image})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(widget.latitude ?? 37.42796133580664,
          widget.longitude ?? -122.085749655962),
      zoom: 14.4746,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * (1 / 3),
            child: GoogleMap(
              zoomControlsEnabled: false,
              markers: markers,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);

                markers.clear();

                markers.add(Marker(
                    markerId: const MarkerId('Localização Atual'),
                    position: LatLng(widget.latitude!, widget.longitude!)));

                setState(() {});
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(
                    image: NetworkImage(widget.image!),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.title}'),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('R\$ ${widget.description}')
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialogBuyWidget();
                },
              );
            },
            child: const Text('Realizar Comprar'),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
