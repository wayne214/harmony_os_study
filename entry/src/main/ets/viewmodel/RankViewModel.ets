import { getRankList } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
export class RankViewModel extends BaseViewModel {
  async getRankList(rankType: string, resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getRankList(rankType), true)
      .then((result)=> {
        console.log('---排行列表', result)
        resultCallback?.(result.data.itemList)
      })
  }
}