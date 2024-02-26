import { getCategories } from '../http/apiService';
import { CategoryModelChild } from '../model/CategoryModel';
import { BaseViewModel, ResultCallback } from './BaseViewModel';
export class CategoryViewModel extends BaseViewModel {
  async getCategoryDataList(resultCallback?: ResultCallback) {
    await this.httpRequest()
      .promise(getCategories(), true)
      .then(result=> {
        console.log("分类数据", result.data)
        resultCallback?.(result.data)
      })
  }
}

let categoryViewModel = new CategoryViewModel()

export default categoryViewModel as CategoryViewModel