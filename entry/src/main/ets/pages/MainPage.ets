import { CommonConstants } from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';
import MultipleDevicesUtils from '../common/utils/MultipleDevicesUtils';
import HomePage from '../view/HomePage';
import MinePage from '../view/MinePage';
@Entry
@Component
struct MainPage {
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;
  @State currentIndex: number = CommonConstants.HOME_TAB_INDEX;
  aboutToDisappear() {
    MultipleDevicesUtils.unregister();
  }
  build() {
    Tabs({
      barPosition: this.currentDeviceSize === CommonConstants.LG ? BarPosition.Start : BarPosition.End,
      index: this.currentIndex
    }){
      TabContent(){
        HomePage()
      }
      .tabBar(this.TabBuilder(CommonConstants.HOME_TITLE, CommonConstants.HOME_TAB_INDEX, $r('app.media.ic_home_selected'), $r('app.media.ic_home_normal')))

      TabContent(){
        MinePage()
      }
      .tabBar(this.TabBuilder(CommonConstants.MINE_TITLE, CommonConstants.MINE_TAB_INDEX, $r('app.media.ic_mine_selected'), $r('app.media.ic_mine_normal')))
    }
    .barWidth(this.currentDeviceSize === CommonConstants.LG ? StyleConstants.BAR_WIDTH_LG : StyleConstants.FULL_PARENT)
    .barHeight(this.currentDeviceSize === CommonConstants.LG ? StyleConstants.BAR_HEIGHT_LG : StyleConstants.BAR_DEFAULT_HEIGHT)
    .vertical(this.currentDeviceSize === CommonConstants.LG)
    .backgroundColor(Color.White)
    .barMode(BarMode.Fixed)
    .scrollable(false)
    .onChange((index)=>{
      this.currentIndex = index;
    })
  }

  @Builder TabBuilder(title, index, selectedImg, normalImg) {
    Column() {
      Image(this.currentIndex === index ? selectedImg: normalImg)
        .width('25vp')
        .height('25vp')

      Text(title)
        .margin({top: '4vp'})
        .fontSize('10fp')
        .fontColor(this.currentIndex === index ? '#1698CE' : '#6B6B6B')
    }
    .justifyContent(FlexAlign.Center)
    .height(StyleConstants.FULL_PARENT)
    .width(StyleConstants.FULL_PARENT)
  }
}