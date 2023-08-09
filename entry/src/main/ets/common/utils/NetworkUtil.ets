import http from '@ohos.net.http';
import { HTTP_TIMEOUT } from '../constants/CommonConstants';

export default class ResponseResult {
  /**
   * Code returned by the network request: success, fail.
   */
  code: number;

  /**
   * Message returned by the network request.
   */
  msg: string | Resource;

  /**
   * Data returned by the network request.
   */
  data: any;

  constructor() {
    this.code = 0;
    this.msg = '';
    this.data = null;
  }
}

/**
 * Initiate an HTTP GET request to the specified URL.
 *
 * @param url URL for initiating an HTTP request.
 */
export function httpRequestGet(url: string) {
  return httpRequest(url, http.RequestMethod.GET);
}

/**
 * Initiate an HTTP POST request to the specified URL.
 *
 * @param url URL for initiating an HTTP request
 * @param newsData Additional data of the request
 * @returns    httpRequestPost('')

 */
export function httpRequestPost(url: string, params?: Object) {
  return httpRequest(url, http.RequestMethod.POST, params);
}

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request
 * @param method Request method.
 * @param extraData Additional data of the request.
 * @returns Returns {@link ResponseResult}.
 */
function httpRequest(url: string, method: http.RequestMethod, params?: Object): Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: HTTP_TIMEOUT,
    header: {
      'Content-Type': 'application/text/html; charset=utf-8'
    },
    connectTimeout: HTTP_TIMEOUT,
    extraData: params || {},
    expectDataType: http.HttpDataType.STRING,
    usingCache: false
  });
  let serverData = new ResponseResult();
  // Processes the data and returns.
  return responseResult.then((value) => {
    if (value.responseCode === 200) {
      // Obtains the returned data.
      serverData.data = value.result;
      serverData.code = value.responseCode;
      serverData.msg = '数据加载成功';
    } else {
      serverData.msg = `${value.responseCode}`;
    }
    return serverData;
  }).catch((error) => {
    serverData.code = error.code;
    serverData.msg = `数据加载失败 ${error.message}`;
    return serverData;
  });
}