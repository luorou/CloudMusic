import { FontWeight } from '../../../../core/resource/font_weight';
import { Opacity } from '../../../../core/resource/opacity';

@Extend(Text) function descStyle() {
  .fontSize($r('app.float.vp_14'))
  .fontWeight(FontWeight.WEIGHT_400)
  .fontFamily($r('app.string.HarmonyHeiTi'))
  .fontColor($r(`app.element.color.col_333333`))
  .width($r('app.string.p_100'))
  .lineHeight($r('app.float.vp_20'))
  .margin({ top: $r('app.float.vp_8') })
}

@CustomDialog
export default struct UserPrivacyDialog {
  controller: CustomDialogController = new CustomDialogController({ builder: '' });
  ;
  cancel: Function = () => {
  };
  confirm: Function = () => {
  };

  build() {
    Column() {
      Text($r('app.string.privacy_title'))
        .descStyle()
      Text($r('app.string.privacy_title'))
        .descStyle()
        .opacity(Opacity.OPACITY_6)
      Row() {
        Button($r('app.string.cancel'))
          .backgroundColor(Color.White)
          .fontColor($r('app.color.col_007dff'))
          .onClick(() => {
            this.controller.close();
            this.cancel();
          })
        Divider()
          .vertical(true)
          .height($r('app.float.vp_22'))
          .opacity(Opacity.OPACITY_4)
        Button($r('app.string.agree'))
          .backgroundColor(Color.White)
          .fontColor($r('app.color.col_007dff'))
          .onClick(() => {
            this.controller.close();
            this.confirm();
          })
      }
      .width($r('app.string.p_100'))
      .margin({ top: $r('app.float.vp_22') })
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .padding($r('app.float.vp_16'))
  }
}