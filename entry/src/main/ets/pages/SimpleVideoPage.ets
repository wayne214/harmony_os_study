import { SwiperVideo } from '../view/video_demo/IndexSwiper'
@Entry
@Component
struct SimpleVideoPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      SwiperVideo()
    }
    .width('100%')
    .height('100%')
  }
}