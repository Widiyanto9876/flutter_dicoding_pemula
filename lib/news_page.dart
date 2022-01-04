import 'package:flutter/material.dart';
import 'package:flutter_dicoding_pemula/data/list_news_articel.dart';
import 'package:flutter_dicoding_pemula/detail_news.dart';
import 'package:flutter_dicoding_pemula/grid_news.dart';
import 'package:flutter_dicoding_pemula/hex_color.dart';
import 'package:flutter_dicoding_pemula/list_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final DataArticel _dataArticel = DataArticel();
  final List<Color> _colors = [
    HexColor("F4DFBA"),
    HexColor("EEC373"),
    HexColor("CA965C"),
    HexColor("#BADCE1"),
  ];
  bool changeBackground = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          changeBackground == false ? Colors.white : Colors.black54,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Text(
                      "All News",
                      style: TextStyle(
                          color: changeBackground == false
                              ? Colors.black
                              : Colors.white,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              changeBackground = !changeBackground;
                            });
                          },
                          child: Icon(changeBackground == false
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode,
                            color: changeBackground == false
                                ? Colors.black
                                : Colors.white,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          _dataArticel.dataNews[0].img!,
                          loadingBuilder: (context, widget, image) {
                            if (image == null) return widget;
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailNews(
                                            imgNetwork:
                                                _dataArticel.dataNews[0].img!,
                                            desc: _dataArticel
                                                .dataNews[0].deskripsi!)));
                              },
                              child: Container(
                                color: Colors.grey.shade400,
                                height: 350,
                                width: 300,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                          height: 350,
                          width: 300,
                          fit: BoxFit.fitHeight,
                        )),
                    SizedBox(
                        height: 160,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _dataArticel.dataNews[0].judul!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 25),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                LayoutBuilder(
                  builder: (context, constraint) {
                    if (constraint.maxWidth <= 600) {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _dataArticel.dataNews.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailNews(
                                            imgNetwork: _dataArticel
                                                .dataNews[index].img!,
                                            desc: _dataArticel
                                                .dataNews[index].deskripsi!)));
                              },
                              child: ListNews(
                                  judul: _dataArticel.dataNews[index].judul!,
                                  subJudul:
                                      _dataArticel.dataNews[index].subJudul!,
                                  colorBackground: _colors[index],
                                  imgNetwork:
                                      _dataArticel.dataNews[index].img!),
                            );
                          });
                    } else if (constraint.maxWidth <= 1200) {
                      return GridNews(
                        gridCount: 2,
                      );
                    } else {
                      return GridNews(
                        gridCount: 4,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
