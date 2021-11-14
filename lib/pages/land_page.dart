import 'package:flutter/material.dart';
import 'package:vr_ui/api/api_manager.dart';
import 'package:vr_ui/custom_widgets/category_button.dart';
import 'package:vr_ui/custom_widgets/vr_product_item.dart';
import '../models/vr_product_model.dart';

class LandPage extends StatefulWidget {
  const LandPage({Key? key}) : super(key: key);

  @override
  _LandPageState createState() => _LandPageState();
}

class _LandPageState extends State<LandPage> {
  final ApiClient _client = ApiClient();

  @override
  void initState() {
    super.initState();
  }

  final buttonList = [
    CategoryButton(
      title: 'All Product',
      isSelected: false,
    ),
    CategoryButton(
      title: 'Popular',
      isSelected: false,
    ),
    CategoryButton(title: 'Recent', isSelected: false),
    CategoryButton(title: 'Review', isSelected: false),
    CategoryButton(title: 'Additional Items', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: 160,
              child: const Text(
                'Enjoy the world into virtual reality',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 180,
                            child: Text(
                              'Improved Controller Design with Virtual Reality',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white70),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Buy Now!',
                              style: TextStyle(color: Colors.blue),
                            ),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -8,
                  child: Image.asset(
                    'assets/images/oculus.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 80,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  itemCount: buttonList.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: 30,
                        child: buttonList[index]);
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.32,
              child: FutureBuilder(
                future: _client.getVrProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List<VRProduct> products =
                        snapshot.data as List<VRProduct>;

                    return ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 25,
                        );
                      },
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return VRProductItem(
                            index: index, vrProductList: products);
                      },
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
