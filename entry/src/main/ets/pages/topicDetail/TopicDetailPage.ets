import router from '@ohos.router'
import { ViewStateConstant } from '../../common/constants/ViewStateConstant'
import { TopicDetailModel, TopicDetailModelItemList } from '../../model/TopicDetailModel'
import { CommonTopBar } from '../../view/CommonTopBar'
import { StateComponent } from '../../view/StateComponent'
import { VideoComponent } from '../../view/VideoComponent'
import TopicDetailViewModel from '../../viewmodel/TopicDetailViewModel'
@Entry
@Component
struct TopicDetailPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State title: string = ""
  @State detailData: TopicDetailModel = {}
  @State playIndex: number = -1
  @State isAutoPlay: boolean = true
  @State showControls: boolean = true
  @State playUrl: string = ""
  private controller: VideoController = new VideoController()

  aboutToAppear() {
    TopicDetailViewModel.topicId = router.getParams()['id']
    TopicDetailViewModel.observeState((state)=> this.viewState = state)
    this.loadNet()
  }

  loadNet() {
    TopicDetailViewModel.getTopicDetailList((result)=> {
      this.detailData = result
      this.title = this.detailData.brief
    })
  }

  build() {
    Column() {
      CommonTopBar({title: this.title, alpha: 1})
      Stack() {
        StateComponent({
          viewState: this.viewState,
          retryCallback: ()=> {
            this.loadNet()
          }
        }){
          List() {
            ListItem() {
              this.topicHeader()
            }

            ForEach(this.detailData.itemList, (item: TopicDetailModelItemList, index: number)=> {
              ListItem() {
                this.itemContent(item, index)
              }
            })
          }
          .width('100%')
          .height('100%')
          .onScrollIndex((firstIndex: number, lastIndex: number)=> {

          })
        }
      }
      .layoutWeight(1)
    }
    .height('100%')
  }

  @Builder
  itemContent(item: TopicDetailModelItemList, index: number) {
    Column() {
      if(this.playIndex == index) {
        VideoComponent({
          showControls: $showControls,
          playUrl: $playUrl,
          isAutoPlay: this.isAutoPlay
        })
          .width('100%')
          .height('250vp')
      } else {
        Stack() {
          Image(item.data.content.data.cover.feed)
            .width('100%')
            .height('250vp')
            .alt($r('app.media.back_placeholder'))

          Image($r('app.media.icon_play'))
            .width('45vp')
            .height('45vp')
            .alt($r('app.media.back_placeholder'))
            .onClick(()=> {
              this.playIndex = index
              this.playUrl = item.data.content.data.playUrl
            })

        }
      }

      Text(this.detailData.brief)
        .width('80%')
        .fontColor('#333333')
        .textAlign(TextAlign.Center)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .fontSize('14fp')
        .maxLines(1)
        .margin({top: '10vp'})
        .backgroundColor('#ffffff')

      Text(this.detailData.text)
        .fontColor($r('app.color.color_555'))
        .fontSize('13fp')
        .margin($r('app.float.size_10'))
    }

  }

  @Builder
  topicHeader() {
    Column() {
      Image(this.detailData.headerImage)
        .width('100%')
        .height('280vp')
        .alt($r('app.media.back_placeholder'))

      Text(this.detailData.brief)
        .width('80%')
        .height('46vp')
        .border({radius: '5vp', width: '1vp', color: '#333333'})
        .fontColor('#333333')
        .textAlign(TextAlign.Center)
        .textOverflow({overflow: TextOverflow.Ellipsis})
        .fontSize('14fp')
        .maxLines(1)
        .margin({top: '-23vp'})
        .backgroundColor('#ffffff')

      Text(this.detailData.text)
        .fontColor($r('app.color.color_555'))
        .fontSize('13fp')
        .margin($r('app.float.size_10'))
    }
  }
}