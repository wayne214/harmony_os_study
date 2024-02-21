import http from '@ohos.net.http';

export interface BaseResponse {
  errorCode: number
  errorMsg: string
}

export interface ApiResponse<T = any> extends BaseResponse {
  data: T | any
}