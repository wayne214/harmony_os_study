import { BaseViewModel } from './BaseViewModel';
export class FindViewModel extends BaseViewModel {
  tabTitle = [
    {
      index: 0,
      title: "关注"
    },
    {
      index: 1,
      title: "分类"
    },
    {
      index: 2,
      title: "主题"
    }
  ]
}

let findViewModel = new FindViewModel()

export default findViewModel as FindViewModel