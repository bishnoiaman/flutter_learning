import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoreup_cubit/auth/cubit/auth_cubit.dart';
import 'package:scoreup_cubit/dashboard/dashboard_cubit/accountCubit/account_cubit.dart';
// import 'package:scoreup_cubit/auth/cubit/auth_cubit.dart';
import 'package:scoreup_cubit/resources/svg/app_svg.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final menuOption = [
    MenuOptionModel(title: "Privacy Policy"),
    MenuOptionModel(title: "Terms & Conditions"),
    MenuOptionModel(title: "Refund Policy"),
    MenuOptionModel(title: "Help & Support"),
  ];

  @override
  void initState() {
    super.initState();
    context.read<AccountCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Account", style: TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
            color: const Color.fromARGB(255, 208, 207, 207),
            height: 1,
          ),
        ),
      ),
      body: BlocConsumer<AccountCubit, AccountState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AccountLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AccountLoaded) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          ProfilePhoto(),
                          SizedBox(height: 30),
                          Text(
                            state.accountData.data.userDetail.fullName,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Welcome to your Profile",
                            style: TextStyle(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 112, 112, 112),
                            ),
                          ),
                          SizedBox(height: 30),
                          AccountDataWidget(
                            accountInfo: AccountDataModel(
                              title: "Full Name",
                              value: state.accountData.data.userDetail.fullName,
                              icon:
                                  '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="user" class="lucide lucide-user w-6 h-6 text-blue-600"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>''',
                              iconColor: Colors.blue,
                              iconBgColor: const Color.fromARGB(
                                255,
                                216,
                                233,
                                247,
                              ),
                            ),
                          ),
                          AccountDataWidget(
                            accountInfo: AccountDataModel(
                              title: "Email Address",
                              value: state.accountData.data.userDetail.email,
                              icon:
                                  '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="mail" class="lucide lucide-mail w-6 h-6 text-purple-600"><path d="m22 7-8.991 5.727a2 2 0 0 1-2.009 0L2 7"></path><rect x="2" y="4" width="20" height="16" rx="2"></rect></svg>''',
                              iconColor: Colors.purple,
                              iconBgColor: const Color.fromARGB(
                                255,
                                240,
                                211,
                                245,
                              ),
                            ),
                          ),
                          AccountDataWidget(
                            accountInfo: AccountDataModel(
                              title: "Mobile Number",
                              value: state.accountData.data.userDetail.mobileNo,
                              icon:
                                  '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="phone" class="lucide lucide-phone w-6 h-6 text-green-600"><path d="M13.832 16.568a1 1 0 0 0 1.213-.303l.355-.465A2 2 0 0 1 17 15h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2A18 18 0 0 1 2 4a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-.8 1.6l-.468.351a1 1 0 0 0-.292 1.233 14 14 0 0 0 6.392 6.384"></path></svg>''',
                              iconColor: Colors.green,
                              iconBgColor: const Color.fromARGB(
                                255,
                                177,
                                250,
                                180,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),
                          Subscription(),
                          const SizedBox(height: 20),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: const Color.fromARGB(255, 209, 209, 209),
                              ),
                            ),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: menuOption.length,
                              itemBuilder: (context, index) {
                                return MenuOptionWidget(
                                  menuData: menuOption[index],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          LogOut(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class MenuOptionWidget extends StatelessWidget {
  const MenuOptionWidget({super.key, required this.menuData});

  final MenuOptionModel menuData;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            menuData.title,
            style: TextStyle(fontSize: 18, color: Colors.black, height: 2),
          ),
          Text(">", style: TextStyle(fontSize: 25, color: Colors.grey)),
        ],
      ),
    );
  }
}

class AccountDataWidget extends StatelessWidget {
  const AccountDataWidget({super.key, required this.accountInfo});

  final AccountDataModel accountInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.all(20),
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
            color: const Color.fromARGB(255, 209, 209, 209),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              // backgroundColor: Colors.grey,
              // backgroundColor: accountInfo.iconColor,
              // backgroundColor: accountInfo.iconColor,
              radius: 26,
              child: SvgPicture.string(
                accountInfo.icon,
                color: accountInfo.iconColor,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(accountInfo.title, style: TextStyle(fontSize: 14)),
                Text(
                  accountInfo.value,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuOptionModel {
  MenuOptionModel({required this.title});

  final String title;
}

class AccountDataModel {
  AccountDataModel({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  final String title;
  final String value;
  final String icon;
  final Color iconColor;
  final Color iconBgColor;
}

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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
          color: const Color.fromARGB(255, 209, 209, 209),
        ),
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 248, 244, 202),
            radius: 25,
            child: SvgPicture.string(
              '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="crown" class="lucide lucide-crown w-6 h-6 text-yellow-600"><path d="M11.562 3.266a.5.5 0 0 1 .876 0L15.39 8.87a1 1 0 0 0 1.516.294L21.183 5.5a.5.5 0 0 1 .798.519l-2.834 10.246a1 1 0 0 1-.956.734H5.81a1 1 0 0 1-.957-.734L2.02 6.02a.5.5 0 0 1 .798-.519l4.276 3.664a1 1 0 0 0 1.516-.294z"></path><path d="M5 21h14"></path></svg>''',
              color: const Color.fromARGB(255, 251, 226, 2),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Subscription", style: TextStyle(fontSize: 15)),
              Text(
                "Preminum Member",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 228, 228, 228),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  " Manage",
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 64, 64, 64),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 228, 227, 227),
          radius: 60,
        ),
        CircleAvatar(
          backgroundColor: const Color.from(
            alpha: 1,
            red: 0.016,
            green: 0.094,
            blue: 0.984,
          ),
          radius: 20,

          child: SvgPicture.string(
            '''<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" data-lucide="edit-2" class="lucide lucide-edit-2 w-4 h-4"><path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"></path></svg>''',
            color: Colors.white,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }
}

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 410,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 230, 228),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {
          context.read<AuthCubit>().logout();
          Navigator.pushNamed(context, '/login');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Logout", style: TextStyle(color: Colors.red, fontSize: 20)),
            SvgPicture.string(AppIconSvg.logoutIcon, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
