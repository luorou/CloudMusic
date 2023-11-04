import common from '@ohos.app.ability.common';
import preferences from '@ohos.data.preferences';
import { StoreKey } from '../../../../core/localstore/store_key';
import router from '@ohos.router';

import UserPrivacyDialog from "../dialog/user_privacy_dialog";
import { RouterIndexPaths, RouterLoginPaths, RouterPaths } from '../../../../core/routers/routers_path';


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
    //
    let want = {
      deviceId: '', // deviceId为空表示本设备
      bundleName: RouterPaths.bundle_name,
      abilityName: RouterIndexPaths.index_ability_name,
      moduleName: RouterPaths.entry_module_name, // moduleName非必选
      parameters: { // 自定义信息
        info: '来自EntryAbility Index页面',
      },
    }
    //
    setTimeout(() => {
      this.context.startAbility(want).then(() => {
        // ...
      }).catch((err) => {
        // ...
      })
    }, delay);
  }

  /**
   *
   */
  /**
   *
   */
  startLoginPage(delay: number) {
    //
    let want = {
      deviceId: '', // deviceId为空表示本设备
      bundleName: RouterPaths.bundle_name,
      abilityName: RouterLoginPaths.login_ability_name,
      moduleName: RouterPaths.entry_module_name, // moduleName非必选
      parameters: { // 自定义信息
        info: '来自EntryAbility Index页面',
      },
    }
    //
    setTimeout(() => {
      this.context.startAbility(want).then(() => {
        // ...
      }).catch((err) => {
        // ...
      })
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