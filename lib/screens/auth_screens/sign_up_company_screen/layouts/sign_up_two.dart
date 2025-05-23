import 'package:fixit_provider/screens/app_pages_screens/add_new_location/layouts/county_drop_down.dart';
import 'package:fixit_provider/screens/app_pages_screens/add_new_location/layouts/state_drop_down.dart';

import '../../../../config.dart';

class SignUpTwo extends StatelessWidget {
  final TickerProvider? sync;

  const SignUpTwo({super.key, this.sync});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SignUpCompanyProvider, CommonApiProvider>(
        builder: (context1, value, api, child) {
      return Form(
          key: value.signupFormKey2,
          child: Column(children: [

            ContainerWithTextLayout(title: appFonts.address)
                .paddingOnly(bottom: Insets.i8),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: Sizes.s20),
              padding: const EdgeInsets.symmetric(horizontal: Sizes.s20,vertical: Sizes.s20),
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                        cornerRadius: 8,cornerSmoothing: 1
                    )
                ),
                color: appColor(context).appTheme.whiteBg,

              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  value.areaData == null?
                  Text(language(context, appFonts.companyLocation),style:  appCss.dmDenseMedium14
                      .textColor(appColor(context).appTheme.lightText)): Expanded(
                    child: Text(value.areaData,style:  appCss.dmDenseMedium14
                        .textColor(appColor(context).appTheme.darkText),),
                  ),
                  SvgPicture.asset(eSvgAssets.locationOut).inkWell(onTap: ()=> value.getLocation(context))
                ],
              ).marginOnly(bottom: Sizes.s10),
            ),
            const VSpace(Sizes.s20),
            ContainerWithTextLayout(title: appFonts.street)
                .paddingOnly(bottom: Insets.i8),
            TextFieldCommon(
                    focusNode: value.streetFocus,
                    validator: (val) => validation.dynamicTextValidation(
                        context, val, appFonts.pleaseEnterDesc),
                    controller: value.street,
                    hintText: appFonts.street,
                    prefixIcon: eSvgAssets.address)
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s20),
            ContainerWithTextLayout(title: appFonts.areaLocality)
                .paddingOnly(bottom: Insets.i8),
            TextFieldCommon(
                    focusNode: value.areaFocus,
                    validator: (val) => validation.dynamicTextValidation(
                        context, val, appFonts.pleaseEnterArea),
                    controller: value.area,
                    hintText: appFonts.area,
                    prefixIcon: eSvgAssets.address)
                .paddingSymmetric(horizontal: Insets.i20),

            const VSpace(Sizes.s20),
            ContainerWithTextLayout(title: appFonts.country)
                .paddingOnly(bottom: Insets.i8),
            const CountryDropDown(isAddLocation: true,)
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s20),
            ContainerWithTextLayout(title: appFonts.state)
                .paddingOnly(bottom: Insets.i8),
           const StateDropDown(isAddLocation: true)
                .paddingSymmetric(horizontal: Insets.i20),
            const DottedLines()
                .paddingOnly(top: Insets.i13, bottom: Insets.i20),
            ServiceAvailabilityLayout(sync: sync),
            Text(language(context, appFonts.theBasicPlanAllows),
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).appTheme.lightText))
                .paddingSymmetric(horizontal: Insets.i20)
          ]));
    });
  }
}
