import 'package:custom_ui/custom_card.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  final Function(String) onShowCode;
  const CardsPage({Key? key, required this.onShowCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                onShowCode('''
CustomCard(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'This is a custom card',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 8.0),
        Text(
          'This is some sample text within the custom card. You can add any widget you like here.',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    ),
  ),
)
''');
              },
              child: CustomCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This is a custom card',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'This is some sample text within the custom card. You can add any widget you like here.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
