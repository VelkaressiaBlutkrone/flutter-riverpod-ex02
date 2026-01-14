import 'package:flutter/material.dart';
import 'package:flutter_card_ui_app_ex01/logger.dart';
import 'package:flutter_card_ui_app_ex01/model/card_item.dart';
import 'package:flutter_card_ui_app_ex01/provider/card_provider.dart';
import 'package:flutter_card_ui_app_ex01/widget/card_form.dart';
import 'package:flutter_card_ui_app_ex01/widget/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardAddScreen extends ConsumerStatefulWidget {
  const CardAddScreen({super.key});

  @override
  ConsumerState<CardAddScreen> createState() => _CardAddScreenState();
}

class _CardAddScreenState extends ConsumerState<CardAddScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _submitItem({
    required String title,
    required String category,
    String? description,
    bool isUse = true,
  }) async {
    final newItem = CardItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      category: category,
      isUse: isUse || false,
    );

    final ({bool success, String message}) result = await ref
        .read(cardProvider.notifier)
        .addCard(newItem);

    if (mounted) {
      if (result.success) {
        Navigator.of(context).pop();

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(result.message)));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(result.message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.i('CardItem New Input Form');
    return Scaffold(
      appBar: AppBar(title: const Text('Card'), elevation: 2.0),
      body: CardForm(onSubmit: () {}, onCancel: () {}),
    );
  }
}
