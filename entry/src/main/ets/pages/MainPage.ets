import { CommonConstants } from '../common/constants/CommonConstants';
import StyleConstants from '../common/constants/StyleConstants';
import MultipleDevicesUtils from '../common/utils/MultipleDevicesUtils';
import { TabItem } from '../model/TabItem';
import HomePage from '../pages/home/HomePage';
import MinePage from '../pages/mine/MinePage';
import FindPage from '../pages/find/FindPage';
import HotPage from '../pages/hot/HotPage';
import MainViewModel2 from '../viewmodel/MainViewModel2'
@Component
@Entry
struct MainPage {
  @StorageProp('currentDeviceSize') currentDeviceSize: string = CommonConstants.SM;
  @State currentIndex: number = CommonConstants.HOME_TAB_INDEX;
  @Provide homeTabSelected: number = 0
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
      .tabBar(this.TabBottom(MainViewModel2.tabTitle[0], 0))

      TabContent() {
        FindPage()
      }
      .tabBar(this.TabBottom(MainViewModel2.tabTitle[1], 1))

      TabContent() {
        HotPage()
      }
      .tabBar(this.TabBottom(MainViewModel2.tabTitle[2], 2))

      TabContent(){
        MinePage()
      }
      .tabBar(this.TabBottom(MainViewModel2.tabTitle[3], 3))
    }
    .barWidth(this.currentDeviceSize === CommonConstants.LG ? StyleConstants.BAR_WIDTH_LG : StyleConstants.FULL_PARENT)
    .barHeight(this.currentDeviceSize === CommonConstants.LG ? StyleConstants.BAR_HEIGHT_LG : StyleConstants.BAR_DEFAULT_HEIGHT)
    .vertical(this.currentDeviceSize === CommonConstants.LG)
    .barMode(BarMode.Fixed)
    .scrollable(false)
    .onChange((index)=>{
      this.currentIndex = index;
      this.homeTabSelected = index
    })
  }

  onPageShow() {

  }
  onPageHide() {

  }

  @Builder TabBottom(item: TabItem, index: number) {
    Column() {
      Image(this.currentIndex === index ? item.imageActivated: item.imageOriginal)
        .height('21vp')
        .width('21vp')
        .margin({
          top: '8vp',
          bottom: '5vp'
        })
      Text(item.title)
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .height('14vp')
        .fontSize(10)
        .fontWeight(500)
        .fontColor(this.currentIndex === index ? '#d81e06' : Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({
          bottom: 7
        })
    }
    .justifyContent(FlexAlign.Center)
    .height(CommonConstants.FULL_HEIGHT_PERCENT)
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .backgroundColor('#f5f5f5')
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
