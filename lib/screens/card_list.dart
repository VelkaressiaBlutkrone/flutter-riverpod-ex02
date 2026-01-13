import 'package:flutter/material.dart';
import 'package:flutter_card_ui_app_ex01/provider/card_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardListScreen extends ConsumerStatefulWidget {
  const CardListScreen({super.key});

  @override
  ConsumerState<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends ConsumerState<CardListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _addCard() async {}

  Future<void> _detailCard() async {}

  Future<void> _delete() async {}

  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(cardProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Card'), elevation: 2.0),
      body: cards.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.grid_3x3, size: 40, color: Colors.grey.shade600),
                  const SizedBox(height: 16),
                  Text(
                    'Card Item is Empty',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // isUse 상태 표시
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: card.isUse
                                    ? Colors.green.shade100
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                card.isUse ? '사용중' : '미사용',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: card.isUse
                                      ? Colors.green.shade700
                                      : Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Category 표시
                        Text(
                          card.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Title 표시
                        Expanded(
                          child: Text(
                            card.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCard,
        child: const Icon(Icons.add),
      ),
    );
  }
}
