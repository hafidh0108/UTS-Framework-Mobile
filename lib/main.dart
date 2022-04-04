import 'package:flutter/material.dart'; //mengimport package material dari dart

void main() { // method main yang dijalankan pertama kali
  runApp(const MaterialApp(
    title: 'Stateles Widget',
    home: StatelesPage(), //class yang dijalankan pertama kali
  ));
}

//class StatelesPage
class StatelesPage extends StatelessWidget {
  const StatelesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //appbar
        title: const Text('Stateles Widget'), // judul dari app bar
      ),
      body: Container( //widget container
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 5,), //size box untuk mengatur atau jarak dari widget
                Text('ROW', style: TextStyle(fontSize: 20),), //widget row untuk membuat baris
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, //untuk mengatur row di posisi tengah
                  children: [
                    Container(
                      color: Colors.orange, //untuk membuat warna menjadi kuning
                      child: FlutterLogo(
                        size: 30.0,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: FlutterLogo(
                        size: 30.0,
                      ),
                    ),
                    Container(
                      color: Colors.purple,
                      child: FlutterLogo(
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Text('COLUMN', style: TextStyle(fontSize: 20),),
                Column( //widget column untuk membuat kolom
                  children: [
                    Container(
                      color: Colors.orange,
                      child: FlutterLogo(
                        size: 30.0,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: FlutterLogo(
                        size: 30.0,
                      ),
                    ),
                    Container(
                      color: Colors.purple,
                      child: FlutterLogo(
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                FlatButton(
                  color: Colors.green,
                  textColor: Colors.white, // foreground
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StatefulPage()), //unutk navigasi menuju ke halaman statefulpage
                    );
                  },
                  child: Text('Ke Stateful Widget'),
                )
              ],
            ),
          )
      ),
    );
  }
}

//class statefulpage
class StatefulPage extends StatefulWidget {
  const StatefulPage({Key? key}) : super(key: key);

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  final nama = TextEditingController(); //variabel edittext

  String textNama = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                  width: 200,
                  height: 200,
                  //widget image untuk menampilkan gambar
                  child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/id/5/5c/Spongebob-squarepants.png'))),
              SizedBox(height: 30,),
              Text('FORM', style: TextStyle(fontSize: 20),),
              SizedBox(height: 5,),
              Container(
                width: 300,
                child: TextField(
                  controller: nama,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Masukkan Nama',
                  ),
                ),
              ),
              ElevatedButton( //tombol untuk eksekusi form
                onPressed: () {
                  setState(() {
                    textNama = nama.text;
                  });
                },
                child: const Text('Submit Form'),
              ),
              SizedBox(height: 10,),
              Text("Nama Anda : " + textNama),
              SizedBox(height: 5,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}