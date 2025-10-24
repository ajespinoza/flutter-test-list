import 'package:flutter/material.dart';

import '../providers/list_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _controllerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final listProvider = Provider.of<ListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio de lista")
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.add, color: Colors.blue,),
              const Icon(Icons.add, color: Colors.blue,),
              const Icon(Icons.add, color: Colors.blue,),
              const Icon(Icons.add, color: Colors.blue,),
              const Icon(Icons.add, color: Colors.blue,),
              const Icon(Icons.add, color: Colors.blue,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controllerName,
              decoration: InputDecoration(
                labelText: "Ingresa nombre",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => {},
                )
              ),
            ),
          ),

          
          Expanded(
            child: ListView.builder(
              itemCount: listProvider.names.length,
              itemBuilder: (context, index){
                final name = listProvider.names[index];
                return Dismissible(
                  key: Key(name),
                  background: Container(color: Colors.red),
                  onDismissed: (_){
                    listProvider.deleteName(name);
                  },
                  child: ListTile(
                    title: Text(name),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          listProvider.addName(_controllerName.text);
          _controllerName.clear();
        },
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.green,
      ),
    );
  }
}