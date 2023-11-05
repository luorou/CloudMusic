import http from '@ohos.net.http';
import { addHeaderInterceptor } from './interceptor/header_interceptor';
import { NetConfig } from './net_config';


/**
 *
 */
export async function get(url: string) {
  if (!url) {
    return undefined;
  }
  let request = http.createHttp();
  let options = {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json'
    },
    readTimeout: NetConfig.read_timeout,
    connectTimeout: NetConfig.connect_timeout
  } as http.HttpRequestOptions;
  let result = await request.request(url, options);
  if (result.responseCode === http.ResponseCode.OK) {
    return result.result
  }else {
   return Promise.reject(result.responseCode)
  }
}


/**
 *
 */
export async function post<T>(url: string, params: Object) {
  if (!url) {
    return undefined;
  }
  let request = http.createHttp();
  let options = {
    method: http.RequestMethod.POST,
    header: addHeaderInterceptor(),
    extraData: params,
    readTimeout: NetConfig.read_timeout,
    connectTimeout: NetConfig.connect_timeout
  } as http.HttpRequestOptions;

  let result = await request.request(url, options);
  JSON.parse(result.result.toString()) as T
  result.result
  return result;
}
