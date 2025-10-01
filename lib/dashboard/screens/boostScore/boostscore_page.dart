import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoreup_cubit/dashboard/dashboard_cubit/boostscoreCubit/boostscore_cubit.dart';

class BoostScorePage extends StatefulWidget {
  const BoostScorePage({super.key});

  @override
  State<BoostScorePage> createState() => _BoostScorePageState();
}

class _BoostScorePageState extends State<BoostScorePage> {
 

  @override
  void initState() {
    super.initState();
    context.read<BoostscoreCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Boost Score",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
            color: const Color.fromARGB(255, 208, 207, 207),
            height: 1,
          ),
        ),
      ),
      body: BlocConsumer<BoostscoreCubit, BoostscoreState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if(state is BoostscoreLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is BoostscoreLoaded){
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 20),
                BoostScoreDashboard(),
                SizedBox(height: 30),
                Text(
                  "Here's your plan",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                // LowerCreditUtilization(),
                // SizedBox(height: 16),
                // Blur1(),
                // SizedBox(height: 16),
                // Blur2(),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.boostScoreData.data.boostingSteps.length,
                  itemBuilder: (context,index){
                  return PlansWidget(planData: PlansModel(title: state.boostScoreData.data.boostingSteps[index].title, description: state.boostScoreData.data.boostingSteps[index].shortDescription, lock: state.boostScoreData.data.boostingSteps[index].isCompleted));
                }),
                
                

                SizedBox(height: 20),
                Text(
                  "Completed",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                VerifyYourIncome(),
                SizedBox(height: 20),
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

class PlansWidget extends StatelessWidget {
  const PlansWidget({super.key, required this.planData});

  final PlansModel planData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 226, 225, 225),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
          border: Border.all(
            style: BorderStyle.solid,
            color: const Color.fromARGB(255, 197, 196, 196),
          ),
        ),
        child: (planData.lock)
            ? UnlockPlan(planData: planData): LockedPlan(planData: planData)
            ,
      ),
    );
  }
}

class LockedPlan extends StatelessWidget {
  const LockedPlan({super.key, required this.planData});

  final PlansModel planData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planData.title,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        planData.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: const Color.fromARGB(255, 114, 114, 114),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                CircleAvatar(radius: 12, backgroundColor: Colors.white),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Pay Now  ->",
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 5, 135, 242),
              ),
            ),
          ],
        ),
        Positioned.fill(
          child: Container(
            color: Colors.white.withOpacity(0.9111),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.string(
                  '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="lock" class="lucide lucide-lock w-8 h-8 text-gray-500"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>''',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UnlockPlan extends StatelessWidget {
  const UnlockPlan({super.key, required this.planData});

  final PlansModel planData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planData.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    planData.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: const Color.fromARGB(255, 114, 114, 114),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            CircleAvatar(radius: 12, backgroundColor: Colors.white),
          ],
        ),
        SizedBox(height: 15),
        Text(
          "Pay Now  ->",
          style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(255, 5, 135, 242),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class PlansModel {
  PlansModel({
    required this.title,
    required this.description,
    required this.lock,
  });

  final String title;
  final String description;
  final bool lock;
}

class VerifyYourIncome extends StatelessWidget {
  const VerifyYourIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 226, 225, 225),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color.fromARGB(255, 228, 227, 227),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 207, 247, 209),
            child: SvgPicture.string(
              '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="check" class="lucide lucide-check w-5 h-5 text-green-600"><path d="M20 6 9 17l-5-5"></path></svg>''',
              color: Colors.green,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Verify your income",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(height: 2,),
              Text(
                "Your income details are up to date",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(width: 40),
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 145, 246, 150),
            radius: 12,
            child: SvgPicture.string(
              '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="check" class="lucide lucide-check w-4 h-4 text-white"><path d="M20 6 9 17l-5-5"></path></svg>''',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BoostScoreDashboard extends StatelessWidget {
  const BoostScoreDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 231, 239, 246),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color.fromARGB(255, 161, 206, 242),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            "Potential Score Increase",
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 1, 63, 114),
            ),
          ),
          Text(
            "+35 pts",
            style: TextStyle(
              fontSize: 45,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: EdgeInsets.all(2),
                width: 80,
                height: 14,
                decoration: BoxDecoration(
                  color: index == 0
                      ? const Color.fromARGB(255, 17, 138, 237)
                      : const Color.fromARGB(255, 161, 204, 238),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          SizedBox(height: 10),
          Text(
            "1 of 4 tasks completed",
            style: TextStyle(
              fontSize: 15,
              color: const Color.fromARGB(255, 57, 10, 65),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
