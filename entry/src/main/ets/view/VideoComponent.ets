import Logger from '../common/utils/Logger'
@Component
export struct VideoComponent {
  //播放链接
  @Link playUrl: string
  //是否展示控制器
  @Link showControls: boolean
  //页面loading是否可见控制
  @State showLoading: boolean = true
  //控制器
  private controller: VideoController
  //是否自动播放
  private isAutoPlay: boolean = false


  build() {
    Stack() {
        Video({
          src: this.playUrl,
          controller: this.controller
        })
          .width('100%')
          .height('100%')
          .autoPlay(this.isAutoPlay)
          .controls(this.showControls)
          .onStart(()=>{
            Logger.info("onStart")
            this.showLoading = false
          })
          .onPause(()=>{

          })
          .onFinish(()=> {})
          .onError(()=>{})
          .onPrepared((e)=> {

          })
          .onSeeking((e)=> {

          })
          .onSeeked((e)=>{})
          .onUpdate((e)=> {})

      Image($r('app.media.loading'))
        .width('50vp')
        .height('50vp')
        .visibility(this.showLoading ? Visibility.Visible : Visibility.None)

    }
    .width('100%')
    .height('100%')
  }
}