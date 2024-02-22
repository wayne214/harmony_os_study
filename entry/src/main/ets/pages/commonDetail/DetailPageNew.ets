import { CommonTopBar } from '../../view/CommonTopBar'
@Entry
@Component
struct DetailPageNew {
  @State message: string = 'Hello World'

  build() {
    Column(){
      CommonTopBar({title: '视频详情', alpha: 1})

    }
    .width('100%')
    .height('100%')
  }
}