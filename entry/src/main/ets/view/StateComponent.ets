import { ViewStateConstant } from '../common/constants/ViewStateConstant';
import { CommonSkeleton } from '../skelton/CommonSkeleton';
@Component
export struct StateComponent {
  @Prop viewState: string;
  @BuilderParam viewContent: () => void
  retryCallback?: () => void
  private showSkeleton: boolean = false

  build() {
    Stack() {
      if(this.viewState != ViewStateConstant.VIEW_STATE_SUCCESS) {
        this.holdContent()
      } else {
        this.viewContent()
      }
    }
  }

  @Builder
  holdContent() {
    if(this.showSkeleton && this.viewState == ViewStateConstant.VIEW_STATE_LOADING) {
      CommonSkeleton()
    } else {
      Column() {
        Image(this.convertImage())
          .width('100vp')
          .height('100vp')
        Text(this.convertValue())
          .fontSize('15fp')
          .fontColor('#666666')
          .margin('10vp')

        if(this.viewState != ViewStateConstant.VIEW_STATE_LOADING) {
          Button("点我重试")
            .width('120vp')
            .height('35vp')
            .backgroundColor('#d81e06')
            .fontColor('#ffffff')
            .onClick(()=> {
              this.retryCallback?.()
            })
        }
      }
    }
  }

  /**
   * 转换文案
   * @returns
   */
  convertValue() {
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return '加载中...'
        break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return '加载数据异常'
        break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return '网络错误'
        break;
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return '暂无数据'
        break;
      default:
        return '加载成功'
        break;
    }
  }

  /**
   * 转换图片
   * @returns
   */
  convertImage() {
    switch (this.viewState) {
      case ViewStateConstant.VIEW_STATE_LOADING:
        return $r('app.media.loading')
        break;
      case ViewStateConstant.VIEW_STATE_ERROR:
        return $r('app.media.common_empty_content')
        break;
      case ViewStateConstant.VIEW_STATE_NETWORK_ERROR:
        return $r('app.media.timeout')
        break;
      case ViewStateConstant.VIEW_STATE_EMPTY:
        return $r('app.media.common_empty_content')
        break;
      default:
        return $r('app.media.loading')
        break;
    }
  }
}