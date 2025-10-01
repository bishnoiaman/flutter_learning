import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoreup_cubit/dashboard/dashboard_cubit/homeCubit/home_cubit.dart';
import 'package:scoreup_cubit/dashboard/models/home_model/home_model.dart';
import 'package:scoreup_cubit/resources/svg/app_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyFactors = [
    HomeKeyFactorsModel(
      title: 'Payment History',
      color: Colors.green,
      icon:
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="calendar-check" class="lucide lucide-calendar-check w-5 h-5 text-green-600"><path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path><path d="m9 16 2 2 4-4"></path></svg>',
      value: "100%",
      route: '/payment_history',
    ),
    HomeKeyFactorsModel(
      icon:
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="pie-chart" class="lucide lucide-pie-chart w-5 h-5 text-green-600"><path d="M21 12c.552 0 1.005-.449.95-.998a10 10 0 0 0-8.953-8.951c-.55-.055-.998.398-.998.95v8a1 1 0 0 0 1 1z"></path><path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path></svg>',
      title: 'Credit Utilization',
      value: "2%",
      color: Colors.green,
      route: '/credit_utilization',
    ),
    HomeKeyFactorsModel(
      icon:
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="calendar" class="lucide lucide-calendar w-5 h-5 text-yellow-600"><path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>',
      title: 'Age of Credit History',
      value: "7 yrs",
      color: Colors.yellow,
      route: '/credit_age',
    ),
    HomeKeyFactorsModel(
      icon:
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="layers" class="lucide lucide-layers w-5 h-5 text-purple-600"><path d="M12.83 2.18a2 2 0 0 0-1.66 0L2.6 6.08a1 1 0 0 0 0 1.83l8.58 3.91a2 2 0 0 0 1.66 0l8.58-3.9a1 1 0 0 0 0-1.83z"></path><path d="M2 12a1 1 0 0 0 .58.91l8.6 3.91a2 2 0 0 0 1.65 0l8.58-3.9A1 1 0 0 0 22 12"></path><path d="M2 17a1 1 0 0 0 .58.91l8.6 3.91a2 2 0 0 0 1.65 0l8.58-3.9A1 1 0 0 0 22 17"></path></svg>',
      title: 'Credit Mix',
      value: "28",
      color: Colors.purple,
      route: '/credit_mix',
    ),
    HomeKeyFactorsModel(
      icon:
          '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="search" class="lucide lucide-search w-5 h-5 text-yellow-600"><path d="m21 21-4.34-4.34"></path><circle cx="11" cy="11" r="8"></circle></svg>',
      title: 'Credit Enquires',
      value: "5",
      color: Colors.yellow,
      route: '/credit_enquiry',
    ),
  ];

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocConsumer<HomeCubit, HomeCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeCubitLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomeCubitLoaded) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 129, 129, 129),
                              ),
                            ),
                            Text(
                              "Shubham Gupta",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(
                          255,
                          236,
                          235,
                          235,
                        ),
                        radius: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  HomeBlackBox(
                    score: state.homeData.data.creditScoreCard.score,
                    label: state.homeData.data.creditScoreCard.label,
                  ),
                  SizedBox(height: 24),
                  UnderstandYourScore(
                    videoGuideData: state.homeData.data.videoGuide,
                  ),
                  SizedBox(height: 24),
                  BoostYourScore(data: state.homeData.data.quickActions.last),
                  SizedBox(height: 24),
                  CreditReport(data: state.homeData.data.quickActions.first),
                  SizedBox(height: 28),
                  Text(
                    "Key Factors",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: keyFactors.length,
                    itemBuilder: (context, index) {
                      return HomeKeyFactorsWidget(keyFactor: keyFactors[index]);
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class HomeKeyFactorsWidget extends StatelessWidget {
  const HomeKeyFactorsWidget({super.key, required this.keyFactor});

  final HomeKeyFactorsModel keyFactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 248, 247, 247),
        ),
        child: TextButton(
          onPressed: null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: (keyFactor.color == Colors.green)
                        ? const Color.fromARGB(255, 223, 247, 223)
                        : (keyFactor.color == Colors.yellow)
                            ? const Color.fromARGB(255, 248, 245, 216)
                            : const Color.fromARGB(255, 243, 208, 249),
                    child: SvgPicture.string(
                      keyFactor.icon,
                      color: keyFactor.color,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    keyFactor.title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Row(
                children: [
                  Text(
                    keyFactor.value,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 18),
                  Text(">", style: TextStyle(fontSize: 25, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeKeyFactorsModel {
  HomeKeyFactorsModel({
    required this.title,
    required this.icon,
    required this.color,
    required this.value,
    required this.route,
  });

  final String title;
  final String icon;
  final Color color;
  final String value;
  final String route;
}

class HomeBlackBox extends StatelessWidget {
  const HomeBlackBox({super.key, required this.score, required this.label});
  final int score;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Credit Score",
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
                Text(
                  score.toString(),
                  style: TextStyle(
                    fontSize: 44,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View Full Report  ->",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Text("🥳", style: TextStyle(fontSize: 100)),
        ],
      ),
    );
  }
}

class BoostYourScore extends StatelessWidget {
  const BoostYourScore({super.key, required this.data});

  final QuickActionData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 229, 241, 247),
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color.fromARGB(255, 171, 206, 235),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 204, 227, 246),
                radius: 25,
                child: SvgPicture.string(
                  AppIconSvg.boostScoreIcon,
                  // color:Color(int.parse(data.iconColor)),
                  color: Colors.blue,
                  width: 30,
                  height: 30,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.label,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Complete 3 tasks to improve your score.",
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 131, 131, 131),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 137, 247),
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "View Plan",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // SizedBox(height: 12),
        ],
      ),
    );
  }
}

class CreditReport extends StatelessWidget {
  const CreditReport({super.key, required this.data});

  final QuickActionData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(255, 255, 255, 1),
        // color: Color(int.parse(data.iconColor)),
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color.fromARGB(255, 224, 224, 224),
        ),
      ),
      child: TextButton(
        onPressed: null,
        child: Row(
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: const Color.fromARGB(255, 249, 235, 250),
              child: SvgPicture.string(
                AppIconSvg.creditReportIcon,
                color: Colors.purple,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    data.label,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Download your latest credit report',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 122, 122, 122),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            SizedBox(width: 50),
            Text("＞", style: TextStyle(fontSize: 20, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class UnderstandYourScore extends StatelessWidget {
  const UnderstandYourScore({super.key, required this.videoGuideData});

  final VideoGuideData videoGuideData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color.fromARGB(255, 227, 226, 226),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            videoGuideData.title,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            videoGuideData.description,
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 90, 89, 89),
            ),
          ),
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: videoGuideData.thumbnailUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.maxFinite,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Positioned.fill(
                  child: Container(color: Colors.black.withOpacity(0.4)),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    child: SvgPicture.string(
                      '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="play" class="lucide lucide-play w-8 h-8 text-gray-900 ml-1"><path d="M5 5a2 2 0 0 1 3.008-1.728l11.997 6.998a2 2 0 0 1 .003 3.458l-12 7A2 2 0 0 1 5 19z"></path></svg>''',
                      color: Colors.black,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
