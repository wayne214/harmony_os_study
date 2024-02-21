
import router from '@ohos.router'
import window from '@ohos.window'
import Logger from '../common/utils/Logger'
@Component
export struct CommonTopBar {
  @Prop title: string
  @Prop alpha: number
  @State statusBarHeight:number = 0
  private titleAlignment: TextAlign = TextAlign.Center
  private backButton: boolean = true
  private onBackClick?: () => void

  aboutToAppear() {
    this.setSystemStatusBar();
  }

  // 设置状态栏
  setSystemStatusBar() {
    let context = getContext(this)
    window.getLastWindow(context, (error, data)=> {
      let avoidArea = data.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      avoidArea.topRect.height = 90

      this.statusBarHeight = avoidArea.topRect.height
      Logger.debug("顶部状态栏的高度", `${this.statusBarHeight}`)
      let bottomHeight = avoidArea.bottomRect.height
      Logger.debug("底部系统导航栏的高度", `${bottomHeight}`)

      const systemBarProperties: window.SystemBarProperties = {
        statusBarColor: '#ffffff',
        statusBarContentColor: '#ffffff',
        isStatusBarLightIcon: true
      }

      data.setWindowSystemBarProperties(systemBarProperties, (err, result)=> {
        Logger.debug("设置状态栏结果码", `${err.code}`)
        if (err.code == 0) {
          Logger.debug("状态栏设置成功")
        } else {
          Logger.debug("状态栏设置失败", `${err.message}`)
        }
      })


    })
  }

  build() {
    Column() {
      Blank()
        .backgroundColor('#d8106')
        .opacity(this.alpha)

      Stack({alignContent: Alignment.Start}) {
        Stack()
          .height('50vp')
          .width('100%')
          .opacity(this.alpha)
          .backgroundColor('#d81e06')
        Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center}) {
          Text(this.title)
            .flexGrow(1)
            .textAlign(this.titleAlignment)
            .fontColor(Color.White)
            .fontSize('16fp')
            .align(Alignment.Center)
            .maxLines(1)
            .textOverflow({overflow: TextOverflow.Ellipsis})
        }
        .height('50vp')
        .margin({
          left: '50vp',
          right: '50vp'
        })
        .alignSelf(ItemAlign.Center)

        if(this.backButton) {
          Stack(){
            Image($r('app.media.ic_action_back'))
              .height('16vp')
              .width('16vp')
              .align(Alignment.Center)
              .onClick(()=>{
                this.onBackClick?.()
                router.back()
              })
          }
          .height('50vp')
          .width('50vp')
        }


      }
    }
    .height(this.statusBarHeight)
  }
}