import { ViewStateConstant } from '../../../common/constants/ViewStateConstant'
import Logger from '../../../common/utils/Logger'
import { HomeModelIssueListItemList } from '../../../model/HomeModel'
import { RoutePath } from '../../../route/RoutePath'
import { Router } from '../../../route/Router'
import { StateComponent } from '../../../view/StateComponent'
import { RankViewModel } from '../../../viewmodel/RankViewModel'
import { HomeListItemComponent } from '../../home/component/HomeListItemComponent'
@Component
export struct RankPage {
  private rankType: string = "weekly"
  private positionIndex: number = 0
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State rankList: HomeModelIssueListItemList[] = []
  private hasInit = false
  private viewModel = new RankViewModel()

  @Consume @Watch("onHotTabSelectedIndex") hotCurrentIndex: number
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number

  aboutToAppear() {
    this.viewModel.observeState((state) => {
      this.viewState = state
    })
    if (this.hasInit) {
      this.loadNet()
    }
  }

  /**
   * 懒加载处理逻辑
   */
  onHomeTabSelected() {
    Logger.debug("Focus-homeTabSelectedIndex>>>", `FindIndex:${this.hotCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }
  /**
   * 懒加载处理逻辑
   */
  onHotTabSelectedIndex() {
    Logger.debug("Focus-onFindTabSelectedIndex>>>", `FindIndex:${this.hotCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.homeTabSelected == 2 && this.hotCurrentIndex == this.positionIndex) {
      this.loadNet()
      this.hasInit = true
    }
  }


  loadNet() {
    this.viewModel.getRankList(this.rankType, (result) => {
      this.rankList = result
    })
  }

  build() {
    Stack() {
      StateComponent({ viewState: this.viewState, retryCallback: () => {
        this.loadNet()
      } }) {
        List({ space: 10, initialIndex: 0 }) {
          ForEach(this.rankList, (item: HomeModelIssueListItemList, index: number) => {
            ListItem() {
              HomeListItemComponent({ item: item })
            }.onClick(() => {
              Router.push(RoutePath.DetailPage, { "id": item.data.id, playUrl: item.data.playUrl })
            })
          })
          ListItem() {
            this.itemFooter()
          }
        }
        .listDirection(Axis.Vertical) // 排列方向
        .margin({ left: 10, top: 10, right: 10, bottom: 50 })
        .divider({
          strokeWidth: 1,
          color: '#f5f5f5',
          startMargin: 10,
          endMargin: 10
        })
      }
    }
  }

  @Builder
  itemFooter() {
    Row() {
      Divider().strokeWidth(2).color('#999999').width('50vp')
      Text("我是有底线")
        .margin({left: 15, right: 15})
        .fontColor('#999999')
        .fontSize('15fp')
      Divider().strokeWidth(2).color('#999999').width('50vp')
    }
    .alignItems(VerticalAlign.Center)
    .height('50vp')
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }

}