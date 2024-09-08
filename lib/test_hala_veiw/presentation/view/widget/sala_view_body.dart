import 'package:easy_localization/easy_localization.dart';
import 'package:event_testing/core/function/show_snack_bar.dart';
import 'package:event_testing/core/widgets/custom_app_bar.dart';
import 'package:event_testing/test_hala_veiw/presentation/manger/sala_cubit/sala_cubit.dart';
import 'package:event_testing/test_hala_veiw/presentation/manger/sala_cubit/sala_state.dart';
import 'package:event_testing/test_hala_veiw/presentation/view/widget/sala_card_view.dart';
import 'package:event_testing/test_hala_veiw/presentation/view/widget/sala_detailes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalaViewBody extends StatefulWidget {
  const SalaViewBody({super.key});

  @override
  State<SalaViewBody> createState() => _PlannersViewBodyState();
}

class _PlannersViewBodyState extends State<SalaViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'عرض الصالات'),
      body: BlocConsumer<SalaCubit, SalaState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SalaLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          } else if (state is SalaLoaded ) {
            return Container(
              decoration: linearGradientMethod(),
              child: Column(children: [
                const SizedBox(height: 28),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: state.salalModel.length,
                    itemBuilder: (context, index) {
                      var  salaModel = state.salalModel[index];
                      num placeId=salaModel.id!;
                      return SalaCard(
                         
                        onTap: () {
                          print('sssssssssssssssss$placeId');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SalaDetailScreen(
                                      salaModel: salaModel,
                                    )),
                          );
                        },
                        onDetailsTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SalaDetailScreen(
                                      salaModel: salaModel,
                                    )),
                          );
                        },
                        salaModel: salaModel, placeId: placeId,
                      );
                    },
                  ),
                )
              ]),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

}


BoxDecoration linearGradientMethod() {
  return BoxDecoration(
    gradient: LinearGradient(
      end: Alignment.topLeft,
      begin: Alignment.bottomRight,
      colors: listColor,
    ),
  );
}

List<Color> listColor = [
  // Colors.white
  const Color(0xff3D246C),
  const Color(0xff5C4B99),
  const Color(0xff9F91CC),
  // const Color(0xffFFDBC2)
  // Colors.purple.shade300,
  // Colors.purple.shade500,
  // Colors.purple.shade700,
];

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final List<Widget>? leadingWidgets;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leadingWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (leadingWidgets != null && leadingWidgets!.isNotEmpty)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: leadingWidgets!,
            )
          : null,
      title: Text(
        title,
        style: Styles.textStyleAppBar,
      ),
      centerTitle: true,
      actions: actions,
      flexibleSpace: Container(
        decoration: linearGradientMethod(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
