import { fetchHomePageBlock } from '../../../core/data/reponsitory/home_slice_repository'
import hilog from '@ohos.hilog'
import { HomeSliceStore } from '../viewmodel/home_slice_store';
import { Block, BlockCode, Banner, Creative, Resource } from '../../../core/data/bean/home_page_block_model';

@Component
export default struct HomeSlice {

  //
  @State homeStore: HomeSliceStore = new HomeSliceStore();
  //
  private swiperController: SwiperController = new SwiperController()

  /**
   *
   */
  aboutToAppear() {
    //
    this.homeStore.fetchHomePageBlock()
  }

  /**
   *
   * @param banners
   */
  @Builder buildBanner(banners: Banner[]) {
    Swiper(this.swiperController) {
      ForEach(banners, (banner: Banner) => {
        Image(banner.pic)
          .width('100%')
          .height(120)
          .borderRadius(5)
      })
    }
    .loop(true)
    .width('100%')
    .height(200)
  }
  /**
   *
   */
  @Builder buildOldDragonBall(resources: Resource[]) {
    List() {
      ForEach(resources, (item: Resource) => {
        ListItem(){
          Column(){
            Image(item.uiElement.image.imageUrl2)
              .width(30)
              .height(30)
            Text(item.uiElement.mainTitle.title)
              .fontSize(12)
          }
          .width('18%')
        }
      }, item => item.resourceId)
    }
    .width('100%')
    .listDirection(Axis.Horizontal)
    .divider({ strokeWidth: 10, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
    .padding({ top: 20, left: 0, right: 0, bottom: 20 })
  }
  /**
   *
   */
  @Builder buildPlayListRcmd(block: Block) {
    Column(){
      RelativeContainer() {
        Text(block.uiElement.subTitle.title)
          .alignRules({
            left: { anchor: '__container__', align: HorizontalAlign.Start },
            center: { anchor: '__container__', align: VerticalAlign.Top }
          })
          .id("rcmd_title")
        Image($r("app.media.icon_more_vertical"))
          .alignRules({
            right: { anchor: '__container__', align: HorizontalAlign.End },
            center: { anchor: '__container__', align: VerticalAlign.Top }
          })
          .width(10)
          .height(16)
          .id("rcmd_more")
      }
      .width('100%')
      .height(20)
      List() {
        ForEach(block.creatives, (item: Creative) => {
          ListItem() {
            Column(){
              Stack({ alignContent: Alignment.TopStart }) {
                Image(item.uiElement.image.imageUrl)
                  .alignRules({
                    left: { anchor: '__container__', align: HorizontalAlign.Start },
                    top: { anchor: '__container__', align: VerticalAlign.Top }
                  })
                  .borderRadius(4)
                  .width('100%')
                  .height(160)
                  .id("image")
              }
              .width('33%')
              .height(160)
              Text(item.uiElement.mainTitle.title)
                .width('33%')
                .fontSize(12)
            }
          }
        }, item => item.creativeId)
      }
      .width('100%')
      .listDirection(Axis.Horizontal)
      .divider({ strokeWidth: 10, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .padding({ top: 0, left: 0, right: 0, bottom: 10 })
    }

  }

  /**
   *
   */
  @Builder buildStyleRcmd(block: Block){
    Column(){
      RelativeContainer() {
        Text(block.uiElement.subTitle.title)
          .alignRules({
            left: { anchor: '__container__', align: HorizontalAlign.Start },
            center: { anchor: '__container__', align: VerticalAlign.Top }
          })
          .id("rcmd_title")
        Image($r("app.media.icon_more_vertical"))
          .alignRules({
            right: { anchor: '__container__', align: HorizontalAlign.End },
            center: { anchor: '__container__', align: VerticalAlign.Top }
          })
          .width(10)
          .height(16)
          .id("rcmd_more")
      }
      .width('100%')
      .height(20)
      List() {
        ForEach(block.creatives, (item: Creative) => {
          ListItem() {
            List(){
              ForEach(item.resources,(resource:Resource)=>{
                ListItem(){
                  RelativeContainer(){
                    Image(resource.uiElement.image.imageUrl)
                      .width(30)
                      .width(30)
                      .borderRadius(4)
                      .alignRules({
                        top:{ anchor: '__container__', align: VerticalAlign.Top },
                        left: { anchor: '__container__', align: HorizontalAlign.Start },
                        // center: { anchor: '__container__', align: VerticalAlign.Top }
                      })
                      .id('image')
                    Column(){
                      Text(resource.uiElement.mainTitle.title)
                        .fontSize(10)
                      Text(resource?.uiElement?.subTitle?.title?resource.uiElement.subTitle.title:"")
                        .fontSize(10)
                    }
                    .alignRules({
                      left: { anchor: 'image', align: HorizontalAlign.End },
                      center: { anchor: 'image', align: VerticalAlign.Center }
                    })
                    .id('title')
                    Image($r('app.media.icon_play'))
                  }
                  .height(30)
                  .width(200)
                }
              },item=>item.resourceId)
            }
            .listDirection(Axis.Vertical)
            .divider({ strokeWidth: 10, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
            .height(150)
            .width('100%')
          }
        }, item => item.creativeId)
      }
      .height(120)
      .width('100%')
      .listDirection(Axis.Horizontal)
      .divider({ strokeWidth: 10, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .padding({ top: 0, left: 0, right: 0, bottom: 10 })
    }
  }

  /**
   *
   */
  build() {
    Refresh({ refreshing: this.homeStore.refresh, offset: 120, friction: 100 }) {
      List() {
        ForEach(this.homeStore.blocks, (item: Block) => {
          if (item.blockCode === BlockCode.HOMEPAGE_BANNER) {
            ListItem() {
              this.buildBanner(item.extInfo.banners)
            }
          } else if (item.blockCode === BlockCode.HOMEPAGE_BLOCK_OLD_DRAGON_BALL) {
            ListItem() {
              this.buildOldDragonBall(item.creatives[0].resources)
            }
          } else if (item.blockCode === BlockCode.HOMEPAGE_BLOCK_PLAYLIST_RCMD) {
            ListItem() {
              this.buildPlayListRcmd(item)
            }
          } else if (item.blockCode === BlockCode.HOMEPAGE_BLOCK_STYLE_RCMD) {
            ListItem() {
              this.buildStyleRcmd(item)
            }
          }
        }, item => item.blockCode)
      }
      .listDirection(Axis.Vertical)
      .divider({ strokeWidth: 10, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .padding({ top: 10, left: 10, right: 10, bottom: 10 })
    }
    .onStateChange(() => {

    })
    .onRefreshing(() => {
      this.homeStore.fetchHomePageBlock()
    })
    .width('100%')
    .height('100%')
  }
}