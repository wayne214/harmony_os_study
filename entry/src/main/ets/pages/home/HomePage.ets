import { ViewStateConstant } from '../../common/constants/ViewStateConstant'
import Logger from '../../common/utils/Logger'
import { getHomeList } from '../../http/apiService'
import { HomeModelIssueListItemList } from '../../model/HomeModel'
import { RoutePath } from '../../route/RoutePath'
import { Router } from '../../route/Router'
import { CommonTopBar } from '../../view/CommonTopBar'
import { RefreshFooter } from '../../view/RefreshFooter'
import { StateComponent } from '../../view/StateComponent'
import HomeViewModel  from '../../viewmodel/HomeViewModel'
import { HomeListItemComponent } from './component/HomeListItemComponent'
@Component
export default struct HomePage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State showLoading: boolean = false
  @State dataList: HomeModelIssueListItemList[] = []
  // @Consume @Watch('onTabSelected') homeTabSelected: number

  aboutToAppear() {
    HomeViewModel.observeState(state => {
      this.viewState = state
    })

    this.loadNet()
  }

  // onTabSelected() {
  //   Logger.debug("onTabSelected>>>", `${this.homeTabSelected}`)
  // }

  loadNet() {
    HomeViewModel.getHomeList(
      (result) => {
        console.log("---数据", result)
        this.isRefreshing = false
        this.showLoading = false
        if(HomeViewModel.getDate() == "") {
          this.dataList = result
        } else {
          this.dataList = [...this.dataList, ...result]
        }
      }
    )

    // HomeViewModel.getHomeListByHttp()
  }

  build() {
    Column(){
      CommonTopBar({title: '首页', backButton: false, alpha: 1})
        .align(Alignment.TopStart)

      Stack() {
        StateComponent({
          viewState: this.viewState,
          showSkeleton: true,
          retryCallback: ()=> {
            this.loadNet()
          }
        }) {
          Refresh({refreshing: $$this.isRefreshing, offset: 100,, friction: 100}) {
            List({space: 10, initialIndex: 0}) {
              ForEach(this.dataList, (item: HomeModelIssueListItemList, index: number)=> {
                ListItem() {
                  HomeListItemComponent({item: item}).onClick(()=>{
                    Router.push(RoutePath.DetailPage, { "id": item?.data?.id, playUrl: item?.data?.playUrl })
                  })
                }
              })

              ListItem() {
                RefreshFooter({showFooter: this.showLoading})
              }
            }
            .listDirection(Axis.Vertical) // 排列方向
            .divider({
              strokeWidth: 1,
              color: '#f5f5f5',
              startMargin: 10,
              endMargin: 10,
            }) // 每行之间的分界线
            .onScrollIndex((firstIndex: number, lastIndex: number)=>{})
            .onReachEnd(()=> {
              this.showLoading = true
              this.loadNet()
            })
          }
          .onRefreshing(()=> {
            HomeViewModel.revertDate()
            this.loadNet()
          })
          .padding({left: 10, right: 10})
        }
      }
      .layoutWeight(1)
    }
  }
}