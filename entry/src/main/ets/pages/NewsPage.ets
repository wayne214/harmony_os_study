import NewsViewModel, { NewsTypeBean } from '../viewmodel/NewsViewModel';
import { CommonConstants as Const } from '../common/constants/CommonConstants';
import NewsList from '../view/news/NewsList';
@Entry
@Component
struct NewsPage {
  @State tabBarArray: NewsTypeBean[] = NewsViewModel.getDefaultTypeList();
  @State currentIndex: number = 0;
  @State currentPage: number = 1;

  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.tabBarArray[index].name)
        .height(Const.FULL_HEIGHT)
        .padding({ left: Const.TabBars_HORIZONTAL_PADDING, right: Const.TabBars_HORIZONTAL_PADDING })
        .fontSize(this.currentIndex === index ? Const.TabBars_SELECT_TEXT_FONT_SIZE : Const.TabBars_UN_SELECT_TEXT_FONT_SIZE)
        .fontWeight(this.currentIndex === index ? Const.TabBars_SELECT_TEXT_FONT_WEIGHT : Const.TabBars_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.fontColor_text3'))
    }
  }

  aboutToAppear() {
    // Request news category.
    NewsViewModel.getNewsTypeList().then((typeList: NewsTypeBean[]) => {
      this.tabBarArray = typeList;
    }).catch((typeList: NewsTypeBean[]) => {
      this.tabBarArray = typeList;
    });
  }

  build() {
    Tabs() {
      ForEach(this.tabBarArray, (tabsItem: NewsTypeBean) => {
        TabContent() {
          Column() {
            NewsList({ currentIndex: $currentIndex })
          }
        }
        .tabBar(this.TabBuilder(tabsItem.id))
      }, (item: NewsTypeBean) => JSON.stringify(item));
    }
    .barHeight(Const.TabBars_BAR_HEIGHT)
    .barMode(BarMode.Scrollable)
    .barWidth(Const.TabBars_BAR_WIDTH)
    .onChange((index: number) => {
      this.currentIndex = index;
      this.currentPage = 1;
    })
    .vertical(false)
  }
}