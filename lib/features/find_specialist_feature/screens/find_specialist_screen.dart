import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_booker/features/find_specialist_feature/cubits/find_specialist_cubit/find_specialist_cubit.dart';
import 'package:reservation_booker/features/find_specialist_feature/repositries/get_specialists.dart';

import '../widgets/category_list_view_widget.dart';
import '../widgets/custom_search_bar_widget.dart';
import '../widgets/special_container_list_view_widget.dart';

class FindSpecialistScreen extends StatelessWidget {
  const FindSpecialistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      FindSpecialistCubit()
        ..getSpecialists(specialistsRepository:
        GetAllSpecialists()),
      child: Column(
        children: [
          const CustomSearchBar(),
          const CategoryListViewWidget(),
          BlocBuilder<FindSpecialistCubit, FindSpecialistState>(
            builder: (context, state) {
              if(state is LoadingState ) {
                return const Expanded(child: Center(child: CircularProgressIndicator(),));
              }
              else if(state is SuccessState){
                return SpecialContainerListViewWidget(specialists: state.specialists,);
              }
              else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    );
  }
}



