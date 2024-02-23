import { getRelationList } from '../http/apiService';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
export class VideoDetailViewModel extends BaseViewModel {
  relationId: number = -1

  async getRelationList(resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getRelationList(this.relationId), true)
      .then((result)=>{
        console.log("详情数据", JSON.stringify(result) as string)
        let filterList = result.data.itemList.filter((item)=> item.data.dataType === "VideoBeanForClient")
        resultCallback?.(filterList)
      })
  }
}

let videoDetailViewModel = new VideoDetailViewModel()
export default videoDetailViewModel as VideoDetailViewModel