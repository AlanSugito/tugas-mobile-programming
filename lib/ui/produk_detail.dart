import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class Produkdetail extends StatefulWidget {
  Produk? produk;

  Produkdetail({Key? key, this.produk}) : super(key: key);

  @override
  State<Produkdetail> createState() => _ProdukdetailState();
}

class _ProdukdetailState extends State<Produkdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "Kode : ${widget.produk!.kodeProduk}",
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            "Kode : ${widget.produk!.namaProduk}",
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            "Kode : ${widget.produk!.hargaProduk}",
            style: TextStyle(fontSize: 18.0),
          ),
          _tombolHapusEdit()
        ],
      )),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          ProdukForm(produk: widget.produk!))));
            },
            child: Text("EDIT")),
        OutlinedButton(child: Text("DELETE"), onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: Text("Yakin ingin menhapus data ini"),
      actions: [
        OutlinedButton(onPressed: () {}, child: Text("Ya")),
        OutlinedButton(
            onPressed: () => Navigator.pop(context), child: Text("Batal"))
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}
