import 'package:app_agence/view/widget/alert_dialog_buy_widget.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String? title;
  final String? description;
  final String? image;
  const ProductDetails({Key? key, this.title, this.description, this.image})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
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
            child: Container(
              color: Colors.green,
              child: const Center(child: Text('Mapa')),
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
