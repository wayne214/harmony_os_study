import { CommonTopBar } from '../../view/CommonTopBar'
import FindViewModel from '../../viewmodel/FindViewModel'
import { CategoryPage } from './category/CategoryPage'
import { FocusPage } from './focus/FocusPage'
import { TopicPage } from './topic/TopicPage'
@Component
export default struct FindPage {
  @Provide findCurrentIndex: number = 0
  private controller:TabsController = new TabsController()

  build() {
    Column() {
      CommonTopBar({title: '发现', backButton: false, alpha: 1})
      Stack() {
        Tabs({barPosition: BarPosition.Start, controller: this.controller}) {
          TabContent() {
            FocusPage()
          }
          .tabBar(this.TabBuilder(0, FindViewModel.tabTitle[0].title))

          TabContent() {
            CategoryPage()
          }
          .tabBar(this.TabBuilder(1, FindViewModel.tabTitle[1].title))

          TabContent() {
            TopicPage()
          }
          .tabBar(this.TabBuilder(2, FindViewModel.tabTitle[2].title))
        }
        .barHeight('50vp')
        .barMode(BarMode.Fixed)
        .onChange((index)=> {
          this.findCurrentIndex = index
        })
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.findCurrentIndex === index ? '#ffffff' : '#f5f5f5')
        .fontSize('15fp')
        .fontWeight(this.findCurrentIndex === index ? 500 : 400)
        .height('45vp')
        .flexGrow(1)
        .textAlign(TextAlign.Center)
      Divider()
        .strokeWidth(5)
        .color('#ffffff')
        .opacity(this.findCurrentIndex === index ? 1 : 0)
        .width('80vp')
        .lineCap(LineCapStyle.Round)
    }
    .width('101%') //解决Tab连接处白色线条间隙
    .height('50vp')
    .backgroundColor($r("app.color.color_red"))
    .justifyContent(FlexAlign.Center)
  }
}