import 'dart:convert';
import 'package:crypto_market/models/crypto_model.dart';
import 'package:crypto_market/screens/crypto_details_screen.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoMarketScreen extends StatefulWidget {
  @override
  _CryptoMarketScreenState createState() => _CryptoMarketScreenState();
}

class _CryptoMarketScreenState extends State<CryptoMarketScreen> {
  List<CryptoModel> cryptoModels = [];

  @override
  void initState() {
    super.initState();
    fetchCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('Crypto Market'),
        actions: [
          Icon(
            Icons.error,
            color: Colors.black,
          ),
          SizedBox(
            width: 30,
          ),
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      body: cryptoModels.isEmpty
          ? Center(child: CircularProgressIndicator())
          :  ListView.builder(
        itemCount: cryptoModels.length,
        itemBuilder: (context, index) {
          final crypto = cryptoModels[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CryptoDetailsScreen( kryptoModel: crypto, cryptoModel: crypto,);
              }));
            },
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(crypto.image ?? ''),
                radius: 20,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    crypto.name ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹ ${crypto.currentPrice?.toStringAsFixed(2) ?? ''}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), Text(
                        'marketCap: ${(crypto.marketCap! / 10000000).toStringAsFixed(2)} Cr',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              subtitle: Row(

                children: [ Text(
                  '${crypto.marketCapRank?.toInt() ?? ''}',
                  style: TextStyle(color: Colors.grey),
                ),SizedBox(width: 5,),
                  Text(
                    '${crypto.symbol?.toUpperCase()}',
                    style: TextStyle(color: Colors.grey),
                  ),SizedBox(width: 5,),Text(
                    '${crypto.priceChangePercentage24h?.toStringAsFixed(2) ?? ''}%',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      color: (crypto.priceChangePercentage24h ?? 0) >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),


                ],
              ),

            ),
          );
        },
      ),
    );
  }

  Future<void> fetchCryptoData() async {
    String url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        cryptoModels = data.map((e) => CryptoModel.fromJson(e)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
}

