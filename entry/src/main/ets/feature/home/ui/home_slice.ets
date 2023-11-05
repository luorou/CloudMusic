import { fetchHomePageBlock } from '../../../core/data/reponsitory/home_slice_repository'
import hilog from '@ohos.hilog'
import { HomeSliceStore } from '../viewmodel/home_slice_store';
import { Block,BlockCode,Banner,Creative,Resource } from '../../../core/data/bean/home_page_block_model';

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
  @Builder buildBanner(banners:Banner[]){
    Swiper(this.swiperController) {
      ForEach(banners,(banner:Banner)=>{
        Image(banner.pic)
          .width('100%')
          .height(200)
      })
    }
    .loop(true)
    .width('100%')
    .height(200)
  }
/**
 *
 */
  @Builder buildOldDragonBall(creative:Creative[]){

    List() {
      ForEach(creative[0].resources, (item: Resource) => {
        ListItem(){
          Column(){
            Image(item.uiElement.image.imageUrl)
              .width(40)
              .height(60)
            Text(item.uiElement.mainTitle.title)
          }
        }
      }, item => item.key)
    }
    .width('100%')
    .height(80)
    .listDirection(Axis.Horizontal)
    .divider({ strokeWidth: 10, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
    .padding({ top: 10,left:10 ,right:10,bottom:10})
  }
  /**
   *
   */
  @Builder buildStyleRcmd(creative:Creative[]){
    List() {
      ForEach(creative[0].resources, (item: Resource) => {
        ListItem(){
          RelativeContainer(){

          }
          .width('36')
          .height(80)
        }
      }, item => item.key)
    }
    .width('100%')
    .height(80)
    .listDirection(Axis.Horizontal)
    .divider({ strokeWidth: 10, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
    .padding({ top: 10,left:10 ,right:10,bottom:10})
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
              this.buildOldDragonBall(item.creatives)
            }
          }else if (item.blockCode === BlockCode.HOMEPAGE_BLOCK_STYLE_RCMD) {
            ListItem() {
              this.buildStyleRcmd(item.creatives)
            }
          }
        }, item => item.key)
      }
      .divider({ strokeWidth: 10, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
      .padding({ top: 10,left:10 ,right:10,bottom:10})
    }
    .onStateChange(()=>{

    })
    .onRefreshing(()=>{
      this.homeStore.fetchHomePageBlock()
    })
    .width('100%')
    .height('100%')
  }
}