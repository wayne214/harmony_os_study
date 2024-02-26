import { getTopicDatas } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
export class TopicViewModel extends BaseViewModel {
  pageIndex: number = 0

  async getTopicData(resultCallback: ResultCallback) {
    await this.httpRequest()
      .promise(getTopicDatas(this.pageIndex), this.pageIndex == 0 ? true : false)
      .then((result) => {
        console.log('主题列表数据', result)
        resultCallback?.(result.data.itemList)
        this.pageIndex += result.data.count
      })
  }
}

let topicViewModel = new TopicViewModel()

export default topicViewModel as TopicViewModel