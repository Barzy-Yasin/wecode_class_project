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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
                          debugPrint('favorite icon clicked');
                          // TODO: open favorite screen
                        },
                        icon: const Icon(Icons.favorite, size: 30),
                      ),
                      // const SizedBox(width: 15),
                      notificationIconButton()
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
                  // debugPrint('ValueChanger.favRecord= ${ValueChanger.favRecord}');
                  return jobVacanciesContainer(
                    companyName: 'The Company',
                    companyJobPosition: 'Junior developer',
                    companyJobType: 'Full Time',
                    companyJobSalary: 92000,
                    favIconBool: ValueChanger.favRecord,
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

  Widget jobVacanciesContainer({
    required String companyName,
    required String companyJobPosition,
    required String companyJobType,
    required int companyJobSalary,
    required bool favIconBool,
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
                      ValueChanger.favRecord = !ValueChanger.favRecord;
                      // debugPrint(favIconBool.toString());
                    });
                  },
                  icon: Icon(favIconBool ? favIconFill : favIcon)),
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

  Widget notificationIconButton() {
    IconData notificationIcon = Icons.notifications_outlined;   // off
    IconData hasNotificationIcon = Icons.notifications_active;  // on

    return IconButton(
      onPressed: () {
        if (ValueChanger.hasNotificaion) {
          setState(() {
            ValueChanger.hasNotificaion = false;
            debugPrint(
                'notifications icon clicked • ValueChanger.hasNotificaion= ${ValueChanger.hasNotificaion.toString()}');
          });
          // TODO: open notification list here
        }
      },
      icon: Icon(
          ValueChanger.hasNotificaion ? hasNotificationIcon : notificationIcon,
          size: 30),
    );
  }
}

// the ValueChanger class is used to retrieve
class ValueChanger {
  static bool favRecord = true;
  static bool hasNotificaion = true;
}

/*

  Widget notificationIconButton() {
    IconData notificationIcon = Icons.notifications_outlined;       // off
    IconData hasNotificationIcon = Icons.notifications_active;      // on
    IconData currentNotificationIcon = notificationIcon;            // off
    // if (ValueChanger.hasNotificaion) {
    //   setState(() {
    //     currentNotificationIcon = Icons.notifications_active;
    //   });
    // }

    if (ValueChanger.hasNotificaion) {
      setState(() {
        currentNotificationIcon = hasNotificationIcon;
      });
    }
    return IconButton(
      onPressed: () {
        // TODO: open notification list here
        if (currentNotificationIcon == hasNotificationIcon) {
          setState(() {
            currentNotificationIcon = notificationIcon;
          debugPrint(
              'notifications icon clicked • currentNotificationIcon= ${currentNotificationIcon.toString()}');
          });
        }
      },
      icon: Icon(currentNotificationIcon, size: 30),
    );
  }

    */
