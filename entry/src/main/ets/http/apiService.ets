import httpClient from './request'
let baseUrl = "https://baobab.kaiyanapp.com/"
let wanAndroidUrl = "https://www.wanandroid.com/"

/**
 * 请求首页数据--系统http请求
 * @param date
 * @returns
 */
export function getHomeList(date: string = "") {
  return httpClient.get(
    {
      url: baseUrl + 'api/v2/feed',
      extraData: {"date": date}
    }
  )
}