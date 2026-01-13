import 'package:flutter/material.dart';
import 'package:flutter_card_ui_app_ex01/provider/card_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    final cards = ref.watch(cardProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Card'), elevation: 2.0),
      body: const Placeholder(),
    );
  }
}
