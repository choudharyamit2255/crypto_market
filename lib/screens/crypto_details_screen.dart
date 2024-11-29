import 'package:crypto_market/models/crypto_model.dart';
import 'package:flutter/material.dart';


class CryptoDetailsScreen extends StatelessWidget {
  final CryptoModel cryptoModel;

   CryptoDetailsScreen({Key? key, required this.kryptoModel, required this.cryptoModel,
  })
      : super(key: key);
    CryptoModel kryptoModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[600],
          title: Text(cryptoModel.name ?? 'Crypto Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(cryptoModel.image ?? ''),
                  radius: 50,
                ),
              ),
              SizedBox(height: 20),
              Text(
                cryptoModel.name ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Symbol: ${cryptoModel.symbol?.toUpperCase() ?? ''}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Text(
                'Current Price: ₹ ${cryptoModel.currentPrice?.toStringAsFixed(
                    2) ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Market Cap: ₹ ${(cryptoModel.marketCap! / 10000000)
                    .toStringAsFixed(2)} Cr',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              Text(
                'Market Cap Rank: ${cryptoModel.marketCapRank?.toInt() ??
                    ''}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Text(
                '24h Price Change: ${cryptoModel.priceChangePercentage24h
                    ?.toStringAsFixed(2) ?? ''}%',
                style: TextStyle(
                  fontSize: 16,
                  color: (cryptoModel.priceChangePercentage24h ?? 0) >= 0
                      ? Colors.green
                      : Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '24h High: ₹ ${cryptoModel.high24h?.toStringAsFixed(2) ??
                    ''}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              Text(
                '24h Low: ₹ ${cryptoModel.low24h?.toStringAsFixed(2) ?? ''}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Text(
                'Circulating Supply: ${cryptoModel.circulatingSupply
                    ?.toStringAsFixed(0) ?? ''}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              Text(
                'Total Supply: ${cryptoModel.totalSupply?.toStringAsFixed(0) ??
                    ''}',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}