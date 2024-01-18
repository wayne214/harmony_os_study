import http from '@ohos.net.http';
import {ResponseResult} from '../../viewmodel/NewsViewModel'
import { CommonConstants as Const, ContentType } from '../constants/CommonConstants';

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @param params Params for initiating an HTTP request.
 */

export function httpRequestGet(url:string):Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    readTimeout: Const.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': ContentType.JSON
    },
    connectTimeout: Const.HTTP_READ_TIMEOUT,
    extraData: {}
  });
  let serverData: ResponseResult = new ResponseResult();
  return responseResult.then((value: http.HttpResponse)=> {
    if(value.responseCode === Const.HTTP_CODE_200) {
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      if(resultJson.code === Const.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.msg = `${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
    return serverData;
  }).catch(()=>{
    serverData.msg = $r('app.string.http_error_message');
    return serverData;
  })
}