import { post, get } from '../../nethard/net_hard'
import { ApiPath } from '../api/api_path'
import  '@ohos.net.http';
import http from '@ohos.net.http';
import { ResultWrapper } from '../../nethard/result_wrapper';
/**
 *
 */
export async function fetchHomePageBlock<T>() {
  let result = await get(ApiPath.base_url + ApiPath.home_page_block)

  let resp = JSON.parse(result.toString()) as ResultWrapper<T>

  if (resp.code === http.ResponseCode.OK) {
    return resp.data
  }else {
    return Promise.reject(resp.code)
  }

}