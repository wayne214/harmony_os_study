import { JsonUtils } from '../common/utils/JsonUtils';
import Logger from '../common/utils/Logger';
import { getHomeList, getHomeListAxios } from '../http/apiService';
import { HomeModel, HomeModelIssueListItemList } from '../model/HomeModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
export class HomeViewModel extends BaseViewModel {
  private date: string = ""

  revertDate() {
    this.date = ""
  }

  getDate() {
    return this.date
  }
  /**
   * 获取首页列表数据-axios客户端请求
   * @param stateCallback  状态返回
   * @param resultCallback  结果返回
   */
  async getHomeList(resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getHomeListAxios(this.date), this.date == "" ? true : false)
      .then(result => {
        Logger.debug("HomeTag" + result)

        const resultData = result.data as unknown as HomeModel

        let items = resultData.issueList[0].itemList
        let list = items.filter((item)=> item.type === 'video')
        if(this.date == "") {
          let bannerList: HomeModelIssueListItemList[]
          let bannerBean: HomeModelIssueListItemList = {}
          bannerList = items.filter((item)=> item.type == 'banner2')
          if(bannerList.length > 0) {
            bannerBean = {bannerList: bannerList, type: 'banner'}
            list.unshift(bannerBean)
          }
        }
        resultCallback?.(list)
        this.spliteDate(result.nextPageUrl)
      })
  }

  private spliteDate(nextUrl: string) {
    let split = nextUrl.split("?");
    let split2 = split[1];
    let split3 = split2.split("&");
    let split4 = split3[0].split("=");
    this.date = split4[1]
  }

  /**
   * 官方原生httpClient获取通信实例
   */
  getHomeListByHttp() {
    let homeData = getHomeList("").then((res) => {
      Logger.debug("HomeTag" + res)
    }).catch((err) => {
      Logger.debug("HomeTag", "错误1>>>>>>" + err)
    })
  }

}

let homeViewModel = new HomeViewModel()

export default homeViewModel as HomeViewModel