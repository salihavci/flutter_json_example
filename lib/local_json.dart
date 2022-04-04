import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_example/model/araba_model.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({Key? key}) : super(key: key);

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  String _title = "Local JSON işlemleri";
  late Future<List<Araba>> _listeyiDoldur;

  @override
  void initState() {
    super.initState();
    _listeyiDoldur = arabalarJsonOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _title = "Butona tıklandı";
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(_title),
      ),
      body: FutureBuilder<List<Araba>>(
        initialData: [
          Araba(
            arabaAdi: 'aaa',
            kurulusYili: 1988,
            ulke: 'Türkiye',
            model: [
              Model(
                modelAdi: 'bidibidi',
                fiyat: 1500,
                benzinli: false,
              ),
            ],
          )
        ],
        future: _listeyiDoldur.timeout(
          const Duration(
            seconds: 5,
          ),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Araba> arabaListesi = snapshot.data!;
            return ListView.builder(
                itemCount: arabaListesi.length,
                itemBuilder: (context, index) {
                  var oAnkiAraba = arabaListesi[index];
                  return ListTile(
                    title: Text(oAnkiAraba.arabaAdi),
                    subtitle: Text(oAnkiAraba.ulke),
                    leading: CircleAvatar(
                      child: Text(
                        oAnkiAraba.model[0].fiyat.toString(),
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Araba>> arabalarJsonOku() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      var okunanString = await DefaultAssetBundle.of(context).loadString(
        'assets/data/arabalar.json',
      );
      var jsonObject = jsonDecode(okunanString);
      // debugPrint(okunanString);
      // debugPrint("*************************");
      // debugPrint(jsonObject.toString());
      // List arabaListesi = jsonObject;
      // debugPrint("*************************");
      // debugPrint(arabaListesi[1]["araba_adi"].toString());

      List<Araba> tumArabalar = (jsonObject as List)
          .map((arabaMap) => Araba.fromMap(arabaMap))
          .toList();
      // debugPrint(tumArabalar.length.toString());
      // debugPrint(tumArabalar[0].model[1].fiyat.toString());

      return tumArabalar;
    } catch (e) {
      return Future.error(
        e.toString(),
      );
    }
  }
}
