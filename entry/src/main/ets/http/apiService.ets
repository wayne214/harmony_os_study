import { CategoryModel, DataModel } from '../model/CategoryModel'
import { FocusModel } from '../model/FocusModel'
import { HomeModel } from '../model/HomeModel'
import axiosClient from './AxiosRequest'
import httpClient from './request'
let baseUrl = "https://baobab.kaiyanapp.com/"
let wanAndroidUrl = "https://www.wanandroid.com/"

/**
 * 请求首页数据--系统http请求
 * @param date
 * @returns
 */
export function getHomeList(date: string = "") {
  return httpClient.get<HomeModel>(
    {
      url: baseUrl + 'api/v2/feed',
      extraData: {"date": date}
    }
  )
}

/**
 * 请求首页数据-axios客户端请求
 * @param date
 * @returns
 */
export function getHomeListAxios(date: string = "") {
  return axiosClient.get<HomeModel>({
    url: baseUrl + "api/v2/feed",
    params: { "date": date },
    showLoading: true
    // headers: { "Accept": "application/json" } as AxiosRequestHeaders
  })
}

/**
 * 获取视频详情接口
 * @param id
 */
export function getRelationList(id: number) {
  return axiosClient.get<HomeModel>(
    {
      url: baseUrl + "api/v4/video/related",
      params: { "id": id }
    }
  )
}

/**
 * 获取排行榜
 * @param rankType "weekly" "monthly" "historical"
 * @returns
 */
export function getRankList(rankType: string) {
  return axiosClient.get<HomeModel>(
    {
      url: baseUrl + "api/v4/rankList/videos",
      params: { "strategy": rankType }
    }
  )
}

/**
 * 获取关注接口
 */
export function getFocusData(pageIndex: number = 0) {
  return axiosClient.get<FocusModel>(
    {
      url: baseUrl + "api/v4/tabs/follow",
      params: { "start": pageIndex }
    }
  )
}

/**
 * 获取分类数据
 * @returns
 */
export function getCategories() {
  return axiosClient.get<DataModel>({
    url: baseUrl + "api/v4/categories",
    // showLoading: true,
    // checkLoginState: true,
    // needJumpToLogin: true,
  })
}