import 'package:flutter/material.dart';

import '../model/model_database.dart';
import '../tools/db_helper.dart';

class PageHistory extends StatefulWidget {
  const PageHistory({super.key});

  @override
  State<PageHistory> createState() => _PageHistoryState();
}

class _PageHistoryState extends State<PageHistory> {

  late DatabaseHelper dbHelper;
  late Future<List<ModelDatabase>> mdlDatabase;

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
    _refreshStudentList();
  }

  void _refreshStudentList() {
    setState(() {
      mdlDatabase = dbHelper.readAllOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<ModelDatabase>>(
        future: mdlDatabase,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Ups, riwayat kosong!'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final sData = snapshot.data![index];

              return GestureDetector(
                onTap: () {
                  AlertDialog alertDialog = AlertDialog(
                    title: const Text('Hapus Data',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black)
                    ),
                    content: const SizedBox(
                      height: 20,
                      child: Column(
                        children: [
                          Text('Apa kamu yakin ingin menghapus data ini?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black
                              )
                          )
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            var snackBar = SnackBar(
                              elevation: 4,
                              backgroundColor: const Color(0xffffe1e1),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              content: const Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(right: 12),
                                      child: Icon(
                                          Icons.check_circle,
                                          color: Color(0xffec2d2d)
                                      )
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Pesanan berhasil dihapus.",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );

                            await dbHelper.delete(sData.id!);
                            _refreshStudentList();
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          child: const Text('Hapus',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red
                              )
                          )
                      ),
                      TextButton(
                        child: const Text('Batal',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black)
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                  showDialog(
                      context: context,
                      builder: (context) => alertDialog);
                },
                child: Card(
                  color: const Color(0xffe7eef2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  shadowColor: Colors.black26,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      child: Image.asset(
                        sData.image_url.toString(),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sData.tgl_order.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              sData.nama.toString(),
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Rp ${sData.jml_uang}',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          sData.size.toString().replaceAll(' ', ''),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          margin: const EdgeInsets.only(bottom: 4),
                          width: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xff3ba5d7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Beli lagi',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}