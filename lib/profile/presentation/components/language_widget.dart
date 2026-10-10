import 'package:ahlachat/Localization/localize_bloc.dart';
import 'package:ahlachat/core/localization/Localization.dart';
import 'package:ahlachat/core/localization/languagemodel.dart';
import 'package:ahlachat/core/utils/app_constance.dart';
import 'package:ahlachat/core/utils/styles.dart';
import 'package:ahlachat/users/presentation/components/shared_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LanguageScrean extends StatelessWidget {
  const LanguageScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomeAppBar(showpop: true,tittle: getLang(context: context,key: "Language")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: List.generate(languages.length, (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(onTap: () {
              final myBloc = BlocProvider.of<LocalizeBloc>(context);
              myBloc.add(changelanguageevent(LanguageModels: languages[index],));
            },child: Text(languages[index].countryName,style: StyleTitleB,)),
          )),

        ),
      ),

    );
  }
}

