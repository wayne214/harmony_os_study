import router from '@ohos.router'
import { CommonTopBar } from '../../view/CommonTopBar';
@Entry
@Component
struct ContainerPage {
  @State containerType: string = 'focus'
  @State title: string = "关注"

  aboutToAppear() {
    this.containerType = router.getParams()['containerType'];
    this.convertTitle();
  }

  build() {
    Column() {
      CommonTopBar({title: this.title, alpha: 1})
      Stack() {
        this.buildContent();
      }
      .layoutWeight(1)
    }
  }

  @Builder
  buildContent() {
    if (this.containerType == 'focus') {
      // FocusPage({ hasInit: true })
    } else if (this.containerType == 'topic') {
      // TopicPage({ hasInit: true })
    } else if (this.containerType == 'category') {
      // CategoryPage({ hasInit: true })
    } else {
      Text("暂未找到页面")
    }
  }

  convertTitle() {
    if (this.containerType == 'focus') {
      this.title = "关注"
    } else if (this.containerType == 'topic') {
      this.title = "主题"
    } else if (this.containerType == 'category') {
      this.title = "分类"
    }
  }
}