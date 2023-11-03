import common from '@ohos.app.ability.common';
import preferences from '@ohos.data.preferences';
import { StoreKey } from '../../../../core/localstore/store_key';
import router from '@ohos.router';

import UserPrivacyDialog from "../dialog/user_privacy_dialog";


@Entry
@Component
struct WelcomePage {
  //
  context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  /**
   *
   */
  dialogController: CustomDialogController = new CustomDialogController({
    builder: UserPrivacyDialog(
      {
        cancel: () => {
          this.exitApp()
        },
        confirm: () => {
          this.onConfirm()
        }
      }),
    cancel: () => {
      this.exitApp()
    },
    autoCancel: false,
    alignment: DialogAlignment.Center,
  });


  /**
   *
   */
  aboutToAppear() {
    this.didShowPrivacyDialog()
  }

  /**
   *
   */
  didShowPrivacyDialog() {
    let pref = preferences.getPreferences(this.context, StoreKey.preferences_store);
    pref.then((res) => {
      res.get(StoreKey.privacy_agree, false).then((agree) => {
        if (agree === true) {
          this.startIndexPage(3000);
        } else {
          this.dialogController.open();
        }
      });
    });
  }
  /**
   *
   */
  onConfirm() {
    let pref = preferences.getPreferences(this.context, StoreKey.preferences_store);
    pref.then((res) => {
      res.put(StoreKey.privacy_agree, true).then(() => {
        res.flush();
      }).catch((err: Error) => {
      });
    })
    this.startIndexPage(0);
  }

  /**
   *
   */
  startIndexPage(delay: number) {
    setTimeout(() => {
      router.replaceUrl({ url: 'pages/AdvertisingPage' });
    }, delay);
  }

  /**
   *
   */
  exitApp() {
    this.context.terminateSelf();
  }
  /**
   *
   */
  build() {
    RelativeContainer() {
      Text($r('app.string.welcome_page_text_desc'))
        .alignRules({
          middle: { anchor: '__container__', align: HorizontalAlign.Center },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        })
        .fontColor(Color.White)
        .id("text_desc")
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Red)
  }
}