import { FontWeight } from '../../../../core/resource/font_weight';
import HomeSlice from '../../../home/ui/home_slice'
import RoamingSlice from '../../../roaming/ui/roaming_slice';
import TopicSlice from '../../../topic/ui/topic_slice';
import UserCenterSlice from '../../../usercenter/ui/user_center_slice';
import { BottomTabId, BottomTabList, NavItem } from '../../model/bottom_item_model';

@Entry
@Component
struct IndexPage {
  //
  @State currentPage: number = 0;
  //
  private tabController: TabsController = new TabsController();

  /**
   *
   * @param index
   */
  @Builder TabBuilder(tab: NavItem) {
    Column() {
      Image(tab.icon_normal)
        .fillColor(this.currentPage === tab.id ? tab.icon_color_selected : tab.icon_color_normal)
        .width($r('app.float.vp_24'))
        .height($r('app.float.vp_24'))
        .objectFit(ImageFit.Contain);
      Text(tab.title)
        .fontSize($r('app.float.vp_10'))
        .fontWeight(FontWeight.WEIGHT_500)
        .fontColor(this.currentPage === tab.id ? tab.title_color_selected : tab.title_color_normal)
        .margin({ top: $r('app.float.vp_4') })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  /**
   *
   */
  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
      //
      TabContent() {
        HomeSlice()
          .borderWidth({ bottom: 1 })
          .borderColor($r('app.color.col_333333'))
      }
      .tabBar(this.TabBuilder(BottomTabList[BottomTabId.HOME]))
      .align(Alignment.Start)
      //
      TabContent() {
        RoamingSlice()
      }
      .tabBar(this.TabBuilder(BottomTabList[BottomTabId.ROAMING]))
      //
      TabContent() {
        TopicSlice()
          .borderWidth({ bottom: 1 })
          .borderColor($r('app.color.col_333333'))
      }
      .tabBar(this.TabBuilder(BottomTabList[BottomTabId.TOPIC]))
      //
      TabContent() {
        UserCenterSlice()
          .borderWidth({ bottom: 1 })
          .borderColor($r('app.color.col_333333'))
      }
      .tabBar(this.TabBuilder(BottomTabList[BottomTabId.USER_CENTER]))
    }
    .scrollable(false)
    .barWidth($r('app.string.p_94'))
    .barMode(BarMode.Fixed)
    .vertical(false)
    .onChange((index) => {
      this.currentPage = index;
    })

  }
}