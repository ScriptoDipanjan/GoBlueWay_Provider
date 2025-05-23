import '../../../../config.dart';

class ServicemanOtherDetail extends StatelessWidget {
  const ServicemanOtherDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddServicemenProvider>(builder: (context1, value, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ServicemenDetailForm(),
        ContainerWithTextLayout(title: appFonts.knownLanguage)
            .paddingOnly(bottom: Insets.i8, top: Insets.i20),
        const KnownLanguageLayout(),
        const ExperienceLayout(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            const SmallContainer(),
            const HSpace(Sizes.s20),
            Text(language(context, appFonts.location),
                overflow: TextOverflow.ellipsis,
                style: appCss.dmDenseSemiBold14
                    .textColor(appColor(context).appTheme.darkText))
          ]),
          if (value.address == null)
            Text("+ ${language(context, appFonts.addLocation)}",
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).appTheme.darkText))
                .paddingSymmetric(horizontal: Insets.i20)
                .inkWell(
                    onTap: () => value.addAddressWithRouting(context, false))
        ]).padding(bottom: Insets.i8, top: Insets.i20),
        TextFieldCommon(
                onTap: () => value.addAddressWithRouting(context, true),
                focusNode: value.location,
                validator: (name) => validation.dynamicTextValidation(
                    context, name, appFonts.pleaseAddAddress),
                controller: value.locationCtrl,
                hintText: appFonts.location,
                prefixIcon: eSvgAssets.locationOut)
            .paddingSymmetric(horizontal: Insets.i20),

        ContainerWithTextLayout(title: appFonts.description)
            .paddingOnly(top: Insets.i24, bottom: Insets.i8),
        CommonDescriptionBox(
            description: value.description, focusNode: value.descriptionFocus),
        if (value.servicemanModel == null)
          ContainerWithTextLayout(title: appFonts.password)
              .paddingOnly(bottom: Insets.i8, top: Insets.i20),
        if (value.servicemanModel == null)
          TextFieldCommon(
                  focusNode: value.passwordFocus,
                  controller: value.password,
              obscureText: value.isNewPassword,
              suffixIcon: SvgPicture.asset(
                  value.isNewPassword
                      ? eSvgAssets.hide
                      : eSvgAssets.eye,
                  fit: BoxFit.scaleDown)
                  .inkWell(onTap: () => value.newPasswordSeenTap()),
              validator: (name) => validation.dynamicTextValidation(
                      context, name, appFonts.pleaseEnterPassword),
                  hintText: appFonts.enterPassword,
                  prefixIcon: eSvgAssets.lock)
              .paddingSymmetric(horizontal: Insets.i20),
        if (value.servicemanModel == null)
          ContainerWithTextLayout(title: appFonts.confirmPassword)
              .paddingOnly(bottom: Insets.i8, top: Insets.i20),
        if (value.servicemanModel == null)
          TextFieldCommon(
              obscureText: value.isConfirmPassword,
              suffixIcon: SvgPicture.asset(
                  value.isConfirmPassword
                      ? eSvgAssets.hide
                      : eSvgAssets.eye,
                  fit: BoxFit.scaleDown)
                  .inkWell(onTap: () => value.confirmPasswordSeenTap()),
              focusNode: value.rePasswordFocus,
                  controller: value.reEnterPassword,
                  validator: (name) => validation.confirmPassValidation(
                      context, name, value.password.text),
                  hintText: appFonts.enterPassword,
                  prefixIcon: eSvgAssets.lock)
              .paddingSymmetric(horizontal: Insets.i20)
      ]);
    });
  }
}
