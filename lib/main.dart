import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanInput(),
    );
  }
}

class HalamanInput extends StatefulWidget {
  const HalamanInput({super.key});

  @override
  State<HalamanInput> createState() => _HalamanInputState();
}

class _HalamanInputState extends State<HalamanInput> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _hasilInput = [];

  void _simpan() {
    final teks = _controller.text.trim();

    if (teks.isEmpty) return;

    setState(() {
      _hasilInput.add(teks);
    });

    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Data')),
      body: Column(
        children: [
          // Input dan tombol di kiri atas
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan data',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _simpan(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _simpan, child: const Text('Simpan')),
              ],
            ),
          ),

          // Hasil input di tengah layar
          Expanded(
            child: Center(
              child: _hasilInput.isEmpty
                  ? const Text('Hasil input akan muncul di sini')
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _hasilInput
                          .map(
                            (hasil) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                hasil,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
