import { ViewStateConstant } from '../../../common/constants/ViewStateConstant'
import { HomeModelIssueListItemList } from '../../../model/HomeModel'
import { StateComponent } from '../../../view/StateComponent'
import VideoDetailViewModel from '../../../viewmodel/VideoDetailViewModel'
@Component
export struct VideoBottomComponent {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State relationDataList: HomeModelIssueListItemList[] = []
  @State playIndex: number = -1
  private onItemClick: (playUrl: string) => void
  private relationId: number

  aboutToAppear() {
    VideoDetailViewModel.observeState((state) => this.viewState = state)
    VideoDetailViewModel.relationId = this.relationId
    this.loadNet()
  }

  loadNet() {
    VideoDetailViewModel.getRelationList((result)=>{
      this.relationDataList = result
    })
  }

  build(){
    Stack() {
      StateComponent({
        viewState: this.viewState, retryCallback: () => {
          this.loadNet()
        }
      }) {
        List() {
          ForEach(this.relationDataList, (item: HomeModelIssueListItemList, index: number)=> {
            ListItem() {
              this.detailItemBuilder(item, index)
            }
            .onClick(()=>{
              this.onItemClick?.(item.data.playUrl)
              this.playIndex = index
            })
          })
        }
        .width('100%')
        .height('100%')
        .padding({left: 10, right: 10})
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  detailItemBuilder(item: HomeModelIssueListItemList, index: number) {
    Row() {
      Image(item.data?.cover.feed)
        .width('100vp')
        .height('70vp')
        .alt($r('app.media.back_placeholder'))
        .border({radius: '5vp'})
        .backgroundColor('#f5f5f5')
      Column(){
        Text(item.data?.title)
          .maxLines(1)
          .fontColor(this.playIndex == index ? $r('app.color.color_red') : '#333333')
          .fontSize('15fp')
          .textOverflow({overflow: TextOverflow.Ellipsis})

        Blank()


        Text(item.data?.description)
          .maxLines(2)
          .fontColor(this.playIndex == index ? $r('app.color.color_red') : $r('app.color.color_777'))
          .fontSize('12fp')
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
      .height('70vp')
      .margin({left: 10})
      .padding({top: 5, bottom: 5})
    }
    .width('100%')
    .height('80vp')
    .alignItems(VerticalAlign.Center)
  }
}