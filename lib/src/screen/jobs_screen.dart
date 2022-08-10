import 'package:flutter/material.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final TextEditingController searchController = TextEditingController();

  // bool favIconBool = false;
    // static bool favIconBool = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // #sections screen [column].
        body: Column(
          children: [
            // #sections screen column > (header) container.
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Job\nFinder',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          debugPrint('hello');
                        },
                        icon: const Icon(Icons.favorite_outline, size: 30),
                      ),
                      // const SizedBox(width: 15),
                      IconButton(
                        onPressed: () {
                          debugPrint('hello2');
                        },
                        icon: const Icon(Icons.notifications_outlined,
                            size: 30),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // #sections screen column > (search) container.
            Container(
              height: 80,
              margin: const EdgeInsets.only(left: 60, top: 20, bottom: 20),
              // color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: const Border(
                    left: BorderSide(color: Colors.yellow, width: 4),
                  ),
                ),
                // color: Colors.green,
                child: Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.search),
                    ),
                    Expanded(
                      flex: 5,
                      child: Form(
                        child: TextFormField(
                          controller: searchController,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          debugPrint(searchController.text.toString());
                        },
                        icon: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // #sections screen column > (body) .
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => const Divider(
                  indent: 90,
                  endIndent: 20,
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  return bodyContainer(
                    companyName: 'Baralilo',
                    companyJobPosition: 'Senior',
                    companyJobType: 'Full Time',
                    companyJobSalary: 900200,
                    favIconBoolInWidget: ValueChanger.theValue,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardText(
      {required String name,
      required double fontSize,
      FontWeight? fontWeight,
      double? letterSpacing}) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing),
        ),
        const SizedBox(
          height: 7,
        )
      ],
    );
  }

  Widget bodyContainer({
    required String companyName,
    required String companyJobPosition,
    required String companyJobType,
    required int companyJobSalary,
    required bool favIconBoolInWidget,
  }) {
    IconData favIcon = Icons.favorite_outline;
    IconData favIconFill = Icons.favorite;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 100,
      // color: Colors.grey,
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Center(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                       ValueChanger.theValue = !ValueChanger.theValue;
                      debugPrint(favIconBoolInWidget.toString());
                    });
                  },
                  icon: Icon(favIconBoolInWidget ? favIconFill : favIcon)),
            ),
          ), 
          // SizedBox(width: 20,),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cardText(
                      name: companyName,
                      fontSize: 017,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4),
                  cardText(
                      name: '$companyJobPosition • $companyJobType',
                      fontSize: 014,
                      letterSpacing: 0.4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      cardText(
                        name: '\$$companyJobSalary ',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      cardText(name: 'Year', fontSize: 14)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ValueChanger{
  static bool theValue = true;
}