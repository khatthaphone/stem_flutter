import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String data = '';

  final _items = [
    'https://images.uncyc.org/th/thumb/e/e1/%E0%B8%AD%E0%B8%B2%E0%B8%88%E0%B8%B2%E0%B8%A3%E0%B8%A2%E0%B9%8C%E0%B9%81%E0%B8%94%E0%B8%87.jpg/300px-%E0%B8%AD%E0%B8%B2%E0%B8%88%E0%B8%B2%E0%B8%A3%E0%B8%A2%E0%B9%8C%E0%B9%81%E0%B8%94%E0%B8%87.jpg',
    'https://us-tuna-sounds-images.voicemod.net/0067c69e-7f37-458c-97f5-cd826ab94b82-1659163344679.jpg',
    'https://storage-wp.thaipost.net/2022/11/1470111.jpg',
    'https://pbs.twimg.com/media/EN0R_MsUEAAMLyM.jpg'
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      setState(() {
        data = '$arguments';
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl: _items[index],
            ),
          ));
        },
      ),
      // body: Center(child: Text('$data')),
    );
  }
}
