import Logger from '../../common/utils/Logger'
import { CommonTopBar } from '../../view/CommonTopBar'
import HotViewModel from '../../viewmodel/HotViewModel'
import { RankPage } from './rank/RankPage'
@Component
export default struct HotPage {
  @Provide hotCurrentIndex: number = 0
  private controller: TabsController = new TabsController()

  build() {
    Stack() {
      Column() {
        CommonTopBar({title: '热门', backButton: false, alpha: 1})
        Tabs({barPosition: BarPosition.Start, controller: this.controller}) {
          ForEach(HotViewModel.hotTabTitle, (tabItem, index)=> {
            TabContent() {
              RankPage({rankType: tabItem.rankType, positionIndex: index})
            }
            .tabBar(this.TabBuilder(index, tabItem.title))
            .padding({top: 0, bottom: 0})
            .width('100%')
          })

        }
        .barHeight('50vp')
        .barWidth('100%')
        .barMode(BarMode.Fixed)
        .onChange((index)=> {
          this.hotCurrentIndex = index
        })
      }
    }
  }

  onPageShow() {
    Logger.error("页面可见>>Hot")
  }

  onPageHide() {
    Logger.error("页面不可见>>Hot")
  }

  @Builder
  TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.hotCurrentIndex === index ? '#ffffff' : '#f5f5f5')
        .fontSize('15fp')
        .fontWeight(this.hotCurrentIndex === index ? 500 : 400)
        .textAlign(TextAlign.Center)
        .height('40vp')
      Divider()
        .strokeWidth(5)
        .color('#ffffff')
        .opacity(this.hotCurrentIndex === index ? 1 : 0)
        .width('80vp')
        .lineCap(LineCapStyle.Round)
    }
    .width('100%')
    .height('50vp')
    .backgroundColor($r('app.color.color_red'))
    .justifyContent(FlexAlign.End)
  }

}