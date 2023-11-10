import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/products_controller.dart';
import '../../modal/product.dart';

class ProductDetailedPage extends StatelessWidget {
  const ProductDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModal data =
        ModalRoute.of(context)!.settings.arguments as ProductModal;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          " ${data.title}",
          style: TextStyle(color: Color(0XFF042940), fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Image.network(
                data.thumbnail,
                height: size.height * 0.30,
                // fit: BoxFit.,
              ),
            ),
            Container(
              height: 485,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0XFF042940),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),bottomLeft: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Consumer<ProductController>(builder: (context, pro, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            " ${data.title}",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Text(
                            "  \$ ${(data.price) * data.quantity}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "  Description:",
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "   ${data.descprition}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            "  Category:",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "  ${data.category}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "  Quantity:",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 40,
                        width: 157,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (data.quantity > 0) {
                                  data.quantity--;
                                }
                              },
                              icon: const Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Text(
                              "${data.quantity}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              width: 27,
                            ),
                            IconButton(
                              onPressed: () {
                                data.quantity++;
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          // pro.addCart(productModal: data);
                          // Navigator.of(context).pushNamed(MyRoutes.cartPage);
                        },
                        child: Container(
                          height: 40,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Add to Cart",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
