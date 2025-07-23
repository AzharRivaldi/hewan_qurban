import 'package:flutter/material.dart';
import 'package:hewan_qurban/page/page_order.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
    with SingleTickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  final List<String> strListKambing = [
    "Kambing Standar",
    "Kambing Medium",
    "Kambing Premium",
    "Kambing Super",
  ];

  final List<String> strBeratKambing = [
    "Berat 23-25kg",
    "Berat 26-28kg",
    "Berat 29-34kg",
    "Berat >35kg",
  ];

  final List<String> strHargaKambing = [
    "1.550.000",
    "1.850.000",
    "2.300.000",
    "2.800.000",
  ];

  final List<String> strPromoKambing = [
    "1.249.000",
    "1.659.000",
    "2.179.000",
    "2.690.000",
  ];

  final List<String> strIconKambing = [
    "assets/images/ic_goat_std.png",
    "assets/images/ic_goat_mdm.png",
    "assets/images/ic_goat_prem.png",
    "assets/images/ic_goat_sup.png",
  ];

  final List<String> strListSapi = [
    "Sapi Standar",
    "Sapi Medium",
    "Sapi Super",
  ];

  final List<String> strBeratSapi = [
    "Berat 180-230kg",
    "Berat 250-300kg",
    "Berat >300kg",
  ];

  final List<String> strHargaSapi = [
    "12.400.000",
    "15.700.000",
    "25.000.000",
  ];

  final List<String> strPromoSapi = [
    "12.250.000",
    "15.579.000",
    "23.899.000",
  ];

  final List<String> strIconSapi = [
    "assets/images/ic_cow_std.png",
    "assets/images/ic_cow_sup.png",
    "assets/images/ic_cow_mdm.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    height: MediaQuery.sizeOf(context).width * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                      color: Color(0xffe7eef2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset('assets/images/ic_package.png'),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Paket Kurban',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff464649),
                                )
                            ),
                            Text('Pilih paket kurban',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff979c9d),
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    height: MediaQuery.sizeOf(context).width * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                      color: Color(0xffc9eec8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset('assets/images/ic_seven.png'),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Patungan Sapi 1/7',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff464649),
                                )
                            ),
                            Text('Sapi untuk 7 orang',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff979c9d),
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    height: MediaQuery.sizeOf(context).width * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                      color: Color(0xffc8e9f0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset('assets/images/ic_goat.png'),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Tabungan Kurban',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff464649),
                                )
                            ),
                            Text('Siapkan tabungan',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff979c9d),
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    height: MediaQuery.sizeOf(context).width * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                      color: Color(0xffead6f4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset('assets/images/ic_sheep.png'),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sumbang Kurban',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff464649),
                                )
                            ),
                            Text('Sumbang kemanapun',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff979c9d),
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.sizeOf(context).height * 0.12,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  ),
                  color: Color(0xff2898cb),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('assets/images/ic_mosque.png'),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('#menebarkebaikan',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              )
                          ),
                          Text('Persiapan Kurban di awal waktu',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                    color: const Color(0xff3ba5d7),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/ic_tab_cow.png',
                              width: 18, height: 18,
                              color: _tabController!.index == 0
                                  ? Colors.white
                                  : Colors.black
                          ),
                          const SizedBox(width: 8),
                          const Text('Kurban Sapi'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/ic_tab_goat.png',
                              width: 18, height: 18,
                              color: _tabController!.index == 1
                                  ? Colors.white
                                  : Colors.black
                          ),
                          const SizedBox(width: 8),
                          const Text('Kurban Kambing'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: strListSapi.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageOrder(
                                      strNamaHewan: strListSapi[index].toString(),
                                      strHargaHewan: strPromoSapi[index].toString(),
                                      strBeratHewan: strBeratSapi[index].toString(),
                                    )
                                )
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation: 5,
                            shadowColor: Colors.black26,
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: Image.asset(
                                strIconSapi[index],
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        strListSapi[index],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        strBeratSapi[index],
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF9DF09E),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'PROMO',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Color(0xFF1F9221),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Rp ${strHargaSapi[index]}',
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        'Rp ${strPromoSapi[index]}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(bottom: 4),
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Beli',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
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
                    ),

                    ListView.builder(
                      itemCount: strListKambing.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageOrder(
                                      strNamaHewan: strListKambing[index].toString(),
                                      strHargaHewan: strPromoKambing[index].toString(),
                                      strBeratHewan: strBeratKambing[index].toString(),
                                    )
                                )
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation: 5,
                            shadowColor: Colors.black26,
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: Image.asset(
                                strIconKambing[index],
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        strListKambing[index],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        strBeratKambing[index],
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF9DF09E),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'PROMO',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: Color(0xFF1F9221),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Rp ${strHargaKambing[index]}',
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        'Rp ${strPromoKambing[index]}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(bottom: 4),
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Beli',
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
