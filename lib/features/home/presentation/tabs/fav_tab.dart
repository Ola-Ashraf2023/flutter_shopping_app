import 'package:flutter/material.dart';
import 'package:shopping_app/core/shared/product_row.dart';

class FavTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ProductRow(
              name: "product name",
              link:
                  "https://cdn-thumbs.ohmyprints.net/1/1caa356fb6ee107087da8e057c04e550/817x600/thumbnail/fit.jpg",
              price: 300,
            );
          },
        ))
      ],
    );
  }
}
