import { CommonConstants } from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants'
import CommonUtils from '../common/utils/CommonUtils';
import ItemData from '../viewmodel/ItemData';
import MainViewModel from '../viewmodel/MainViewModel';
@Component
export default struct HomePage {
  build() {
    Scroll(){
      Column(){
        Text("首页")
          .fontWeight(FontWeight.Medium)
          .fontSize('24fp')
          .margin({
            left: '12vp',
            top: '12vp'
          })
          .alignSelf(ItemAlign.Start)

          SwiperView()

          CenterGridview()
      }
      .width(StyleConstants.FULL_PARENT)
      .backgroundColor($r('app.color.background'))
    }
    .scrollBar(BarState.Off)
  }
}

@Preview
@Component
struct SwiperView {
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;
  build() {
    Column() {
      Swiper(){
        ForEach(MainViewModel.getSwiperImages(), (item)=>{
          Image(item).borderRadius('16vp')}, (item)=> JSON.stringify(item))
      }
      .displayCount(CommonConstants.SWIPER_CACHE_COUNT)
      .autoPlay(true)
      .width(StyleConstants.COMMON_WIDTH)
      .itemSpace(StyleConstants.ITEM_SPACE)
      .margin('12vp')
      .displayCount(this.currentDeviceSize === CommonConstants.SM ?
      StyleConstants.SWIPER_COUNT_ONE :
        (this.currentDeviceSize === CommonConstants.MD ?
        StyleConstants.SWIPER_COUNT_TWO : StyleConstants.SWIPER_COUNT_THREE))
    }
  }
}

@Preview
@Component
struct CenterGridview{
  build() {
    Column() {
      Grid(){
        ForEach(MainViewModel.getCenterGridData(), (item)=> {
          GridItem() {
            GridItemView({item: item})
          }
        }, (item)=> JSON.stringify(item))
      }
      .columnsTemplate(StyleConstants.GRID_COLUMNS)
      .rowsTemplate(StyleConstants.GRID_ROWS)
      .columnsGap('8vp')
      .rowsGap('12vp')
      .height(StyleConstants.HOME_GRID_HEIGHT)
      .backgroundColor(Color.White)
      .borderRadius('24vp')
      .padding({
        top: '12vp',
        bottom: "12vp"
      })
      .width(StyleConstants.COMMON_WIDTH)
      .margin('12vp')
    }
  }
}

@Component
struct GridItemView {
  private item?: ItemData;
  private gridItemImg?: Resource;
  private gridItemTitle?: Resource;
  private gridItemPrompt?: Resource;

  aboutToAppear() {
    if (this.item !== undefined) {
      this.gridItemImg = this.item.img;
      this.gridItemTitle = this.item.title;
      this.gridItemPrompt = this.item.clickPrompt;
    }
  }
  build() {
    Column(){
      if(this.gridItemImg) {
        Image(this.gridItemImg)
          .width('24vp')
          .height('24vp')
      }

      if(this.gridItemTitle) {
        Text(this.gridItemTitle)
          .fontSize('12fp')
          .margin({
            top: '4vp'
          })
      }
    }
    .onClick(()=>{
      if(!this.gridItemPrompt) {
        return;
      }
      CommonUtils.showToastContent(this.gridItemPrompt);
    })
  }
}