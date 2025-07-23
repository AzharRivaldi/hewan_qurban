import 'package:flutter/material.dart';
import 'package:hewan_qurban/page/page_main.dart';

import '../model/model_database.dart';
import '../tools/db_helper.dart';
import '../tools/tools.dart';

class PageOrder extends StatefulWidget {
  final String? strNamaHewan;
  final String? strHargaHewan;
  final String? strBeratHewan;

  const PageOrder(
      {super.key,
        this.strNamaHewan,
        this.strHargaHewan,
        this.strBeratHewan});

  @override
  State<PageOrder> createState() => _PageOrderState();
}

class _PageOrderState extends State<PageOrder> {

  late DatabaseHelper dbHelper;
  late String sNamaHewan, sHargaHewan, sBeratHewan;
  String? sJenis;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;

    sNamaHewan = widget.strNamaHewan!;
    sHargaHewan = widget.strHargaHewan!;
    sBeratHewan = widget.strBeratHewan!.replaceAll('Berat', '');

    if (sNamaHewan.contains('Sapi')) {
      sJenis = "assets/images/bg_sapi.jpg";
    } else if (sNamaHewan.contains('Kambing')) {
      sJenis = "assets/images/bg_kambing.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          sNamaHewan.toString(),
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  sJenis.toString(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(sNamaHewan.toString(),
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Bobot$sBeratHewan',
                  style: const TextStyle(
                    fontSize: 18,
                  )
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  'Kurban akan di salurkan kepada anak yatim dan dhuafa, '
                  'janda dhuafa, korban bencana, '
                  'dan yang berhak menerima di seluruh Indonesia.',
                  style: TextStyle(
                    fontSize: 14,
                  )
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      width: 50,
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Free',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text('Biaya Perawatan',
                        style: TextStyle(
                          fontSize: 12,
                        )
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 50,
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Free',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text('Biaya Pemotongan',
                        style: TextStyle(
                          fontSize: 12,
                        )
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 50,
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          'Free',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text('Biaya Distribusi',
                        style: TextStyle(
                          fontSize: 12,
                        )
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Divider(color: Colors.orange, height: 2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Harga (per ekor)',
                          style: TextStyle(
                            fontSize: 18,
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10
                      ),
                      child: Text('Rp $sHargaHewan',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.red),
                        shape:
                        WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                        )
                    ),
                    onPressed: () {
                      AlertDialog dialogBeli = AlertDialog(
                        title: const Text("Beli Sekarang?",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black
                            )
                        ),
                        content: const SizedBox(
                          height: 60,
                          child: Column(
                            children: [
                              Text("Pastikan pesananmu sudah sesuai ya! "
                                  "Pesanan tidak dapat dibatalkan dengan "
                                  "alasan apapun.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black
                                  )
                              )
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() async {
                                var snackBar = SnackBar(
                                  elevation: 4,
                                  backgroundColor: const Color(0xffd0ffdb),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  content: const Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              right: 12)
                                          ,
                                          child: Icon(
                                              Icons.check_circle,
                                              color: Color(0xff2a7e2f)
                                          )
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Pesanan berhasil! Silakan cek riwayat pesanan Anda.",
                                          style: TextStyle(
                                              color: Colors.black
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );

                                await dbHelper.create(ModelDatabase(
                                    nama: sNamaHewan,
                                    size: sBeratHewan,
                                    jml_uang: sHargaHewan,
                                    tgl_order: formatDateTime(
                                        DateTime.now()
                                    ),
                                    image_url: sJenis
                                ));
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const PageMain();
                                    })
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBar);
                              });
                            },
                            child: const Text("Pesan",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red
                              )
                            ),
                          ),
                          TextButton(
                            child: const Text("Batal",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black
                                )
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (context) => dialogBeli);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Beli Sekarang',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
