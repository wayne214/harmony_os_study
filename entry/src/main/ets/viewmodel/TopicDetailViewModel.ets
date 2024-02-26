import { getTopicDetailList } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
export class TopicDetailViewModel extends BaseViewModel {
  topicId: number = -1

  async getTopicDetailList(resultCallback: ResultCallback) {
    await this.httpRequest()
      .promise(getTopicDetailList(this.topicId), true)
      .then((result)=> {
        console.log("主题详情列表", result.data)
        resultCallback?.(result.data)
      })
  }
}

let topicDetailViewModel = new TopicDetailViewModel()

export default topicDetailViewModel as TopicDetailViewModel