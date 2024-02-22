import ImageRegexUtils from '../../../common/utils/ImageRegexUtils'
import { HomeModelIssueListItemList } from '../../../model/HomeModel'
@Component
export struct HomeListItemComponent {
  private item: HomeModelIssueListItemList
  private swiperController: SwiperController = new SwiperController()
  build(){
    if(this.item.type == 'banner') {
      this.bannerComponent()
    } else {
      this.itemComponent()
    }
  }

  @Builder
  bannerComponent() {
    Swiper(this.swiperController) {
      ForEach(this.item.bannerList, (item: HomeModelIssueListItemList)=> {
        Image(ImageRegexUtils(item.data?.image))
          .alt($r('app.media.back_placeholder'))
          .width('100%')
          .height('200vp')
          .border({radius: '5vp'})
      }, item => item)
    }
    .cachedCount(3)
    .index(0)
    .autoPlay(true)
    .interval(4000)
    .indicator(true)
    .loop(false)
    .duration(2000)
    .itemSpace(0)
    .curve(Curve.Linear)
    .indicatorStyle({color: $r('app.color.color_red'), selectedColor: $r('app.color.color_red')})
    .onChange((index: number)=> {

    })
  }

  @Builder
  itemComponent() {
    Column() {
      Stack(){
        Image(this.item?.data?.cover?.feed)
          .width('100%')
          .height('100%')
          .border({radius: '10vp'})
          .alt($r('app.media.back_placeholder'))
        Text(this.item.data?.category)
          .width('45vp')
          .height('45vp')
          .fontColor('#ffffff')
          .fontSize('12fp')
          .backgroundColor('#d81e06')
          .border({radius: {topLeft: '10vp',bottomRight: '10vp'}})
          .textAlign(TextAlign.Center)
          .position({x: 0, y: 0})
      }
      .width('100%')
      .height('210vp')
      .border({radius: '5vp'})

      Row(){
        Image(this.item?.data?.author?.icon)
          .width('50vp')
          .height('50vp')
          .border({radius: '25vp'})

        Column() {
          Text(this.item.data?.author?.name)
            .fontSize('15fp')
            .fontColor($r('app.color.color_333'))
          Text(this.item.data?.author?.name)
            .fontSize('13fp')
            .fontColor($r('app.color.color_999'))
            .margin({ top: $r('app.float.size_5') })
        }
        .alignItems(HorizontalAlign.Start)
        .flexGrow(1)
        .margin({left: '5vp'})
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .height('60vp')
      .alignItems(VerticalAlign.Center)
      .padding({left: '5vp', right: '5vp'})

    }
  }
}