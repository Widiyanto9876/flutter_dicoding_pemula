import 'package:flutter/material.dart';

class ListNews extends StatelessWidget {
  ListNews(
      {Key? key,
      required this.colorBackground,
      required this.imgNetwork,
      required this.judul,
      required this.subJudul})
      : super(key: key);
  final Color colorBackground;
  final String imgNetwork;
  final String judul;
  final String subJudul;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          color: colorBackground, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imgNetwork,
              fit: BoxFit.fitHeight,
              width: 100,
              height: 80,
              loadingBuilder: (context, model, image) {
                if (image == null) return model;
                return Container(
                  color: Colors.grey.shade400,
                  height: 80,
                  width: 100,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start  ,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    judul,
                    style:const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 10),
                  child: Text(
                    subJudul,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
