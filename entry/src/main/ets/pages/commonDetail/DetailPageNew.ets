import router from '@ohos.router'
import { CommonTopBar } from '../../view/CommonTopBar'
import { VideoComponent } from '../../view/VideoComponent'
@Entry
@Component
struct DetailPageNew {
  @State isAutoPlay: boolean = true
  @State showControls: boolean = true
  @State playUrl: string = ""
  @State relationId: number = -1
  private controller: VideoController = new VideoController()

  aboutToAppear() {
    this.relationId = router.getParams()['id']
    this.playUrl = router.getParams()['playUrl']
  }

  build() {
    Column(){
      CommonTopBar({title: '视频详情', alpha: 1})
      this.headerPlayer()

    }
    .width('100%')
    .height('100%')
  }

  @Builder
  headerPlayer() {
    VideoComponent({showControls: $showControls, playUrl: $playUrl, isAutoPlay: this.isAutoPlay})
      .width('100%')
      .height('250vp')
  }
}