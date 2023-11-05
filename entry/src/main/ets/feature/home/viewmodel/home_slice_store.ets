import { HomeBlockResp,Block } from '../../../core/data/bean/home_page_block_model'
import { fetchHomePageBlock } from '../../../core/data/reponsitory/home_slice_repository'


@Observed
export class HomeSliceStore {
  //
  public blocks :Array<Block> = []
  //
  public refresh:boolean = false
  /**
   *
   */
  fetchHomePageBlock() {

    fetchHomePageBlock<HomeBlockResp>().then((res) => {
      this.blocks = res.blocks
      this.refresh = false
    }).catch(() => {
      this.refresh = false
    })
  }
}