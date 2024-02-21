import { ViewStateConstant } from '../../common/constants/ViewStateConstant'
import { CommonTopBar } from '../../view/CommonTopBar'
import { RefreshFooter } from '../../view/RefreshFooter'
import { StateComponent } from '../../view/StateComponent'
@Component
export default struct HomePage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State isRefreshing: boolean = false
  @State showLoading: boolean = false

  loadNet() {

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
              ForEach([], (item, index: number)=> {
                ListItem() {
                  Text("测试数据。。。")
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
            this.loadNet()
          })
          .padding({left: 10, right: 10})
        }
      }
      .layoutWeight(1)
    }
  }
}