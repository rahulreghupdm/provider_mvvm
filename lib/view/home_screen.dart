import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_architecture/data/response/status.dart';
import 'package:provider_mvvm_architecture/model/details.dart';
import 'package:provider_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:provider_mvvm_architecture/view_model/home_view_model.dart';
import 'package:provider_mvvm_architecture/view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewmodel homeViewViewmodel = HomeViewViewmodel();

  @override
  void initState() {
    homeViewViewmodel.fetchDetailsListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernce = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () {
                userPrefernce.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              ),
            ),
          ],
        ),
        body: ChangeNotifierProvider<HomeViewViewmodel>(
            create: (BuildContext context) => homeViewViewmodel,
            child: Consumer<HomeViewViewmodel>(
              builder: (context, value, child) {
                switch (value.detailsList.status!) {
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    return Center(
                        child: Text(value.detailsList.message.toString()));
                  case Status.COMPLETED:
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.detailsList.data!.nickname!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Image.network(
                                value.detailsList.data!.nickname![index]
                                    .toString(),
                                errorBuilder: (context, error, stack) {
                                  return const Icon(Icons.error);
                                },
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                              title: Text(value
                                  .detailsList.data!.githubProfile![index]
                                  .toString()),
                              subtitle: Text(value
                                  .detailsList.data!.link![index]
                                  .toString()),
                            ),
                          );
                        });
                }
                // return Container();
              },
            )));
  }
}
