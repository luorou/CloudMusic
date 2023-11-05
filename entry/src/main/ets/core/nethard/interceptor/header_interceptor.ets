
import HashMap from '@ohos.util.HashMap'

/**
 *
 */
export function addHeaderInterceptor() {
  let headers = new HashMap<string,string>()
  headers.set('Content-Type','application/json')
  return headers
}