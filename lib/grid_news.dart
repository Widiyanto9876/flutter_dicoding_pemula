import 'package:flutter/material.dart';
import 'package:flutter_dicoding_pemula/list_news.dart';
import 'package:flutter_dicoding_pemula/model/news_articel.dart';

import 'data/list_news_articel.dart';
import 'detail_news.dart';
import 'hex_color.dart';

class GridNews extends StatelessWidget {
  GridNews({Key? key, required this.gridCount}) : super(key: key);
  final int gridCount;
  final DataArticel _dataArticel = DataArticel();
  final List<Color> _colors = [
    HexColor("F4DFBA"),
    HexColor("EEC373"),
    HexColor("CA965C"),
    HexColor("#BADCE1"),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _dataArticel.dataNews.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCount),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailNews(
                          imgNetwork:
                          _dataArticel.dataNews[index].img!,
                          desc: _dataArticel
                              .dataNews[index].deskripsi!)));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                  color: _colors[index], borderRadius: BorderRadius.circular(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      _dataArticel.dataNews[index].img!,
                      fit: BoxFit.fill,
                      width: 100,
                      loadingBuilder: (context, widget, image) {
                        if (image == null) return widget;
                        return Container(
                          color: Colors.grey.shade400,
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
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
                          child: Text(
                            _dataArticel.dataNews[index].judul!,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ), Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
                          child: Text(
                            _dataArticel.dataNews[index].subJudul!,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
