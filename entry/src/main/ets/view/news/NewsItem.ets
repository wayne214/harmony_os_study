import { CommonConstants, CommonConstants as Const } from '../../common/constants/CommonConstants';
import { NewsData, NewsFile } from '../../viewmodel/NewsViewModel';
@Component
export default struct NewsItem {
  private newsData: NewsData = new NewsData();
  build() {
    Column(){
      Row() {
        Image($r('app.media.news'))
          .width(Const.NewsTitle_IMAGE_WIDTH)
          .height('20vp')
          .objectFit(ImageFit.Fill)

        Text(this.newsData.title)
          .fontSize(Const.NewsTitle_TEXT_FONT_SIZE)
          .fontColor($r('app.color.fontColor_text3'))
          .width(Const.NewsTitle_TEXT_WIDTH)
          .maxLines(1)
          .margin({left: Const.NewsTitle_TEXT_MARGIN_LEFT})
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .fontWeight(Const.NewsTitle_TEXT_FONT_WEIGHT)
      }
      .alignItems(VerticalAlign.Center)
      .height('22vp')
      .margin({
        top: '16vp',
        left: Const.NewsTitle_IMAGE_MARGIN_LEFT
      })

      Text(this.newsData.content)
        .fontSize(Const.NewsContent_FONT_SIZE)
        .fontColor($r('app.color.fontColor_text3'))
        .height(Const.NewsContent_HEIGHT)
        .width(Const.NewsContent_WIDTH)
        .maxLines(Const.NewsContent_MAX_LINES)
        .margin({ left: Const.NewsContent_MARGIN_LEFT, top: Const.NewsContent_MARGIN_TOP })
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Grid() {
        ForEach(this.newsData.imagesUrl, (itemImg: NewsFile) => {
          GridItem() {
            Image(Const.SERVER + itemImg.url)
              .objectFit(ImageFit.Cover)
              .borderRadius(Const.NewsGrid_IMAGE_BORDER_RADIUS)
          }
        }, (itemImg: NewsFile, index?: number) => JSON.stringify(itemImg) + index)
      }
      .columnsTemplate(CommonConstants.GRID_COLUMN_TEMPLATES.repeat(this.newsData.imagesUrl.length))
      .columnsGap(Const.NewsGrid_COLUMNS_GAP)
      .rowsTemplate(Const.NewsGrid_ROWS_TEMPLATE)
      .width(Const.NewsGrid_WIDTH)
      .height(Const.NewsGrid_HEIGHT)
      .margin({ left: Const.NewsGrid_MARGIN_LEFT, top: Const.NewsGrid_MARGIN_TOP,
        right: Const.NewsGrid_MARGIN_RIGHT })


      Text(this.newsData.source)
        .fontSize(Const.NewsSource_FONT_SIZE)
        .fontColor($r('app.color.fontColor_text3'))
        .height(Const.NewsSource_HEIGHT)
        .width(Const.NewsSource_WIDTH)
        .maxLines(Const.NewsSource_MAX_LINES)
        .margin({ left: Const.NewsSource_MARGIN_LEFT, top: Const.NewsSource_MARGIN_TOP })
        .textOverflow({ overflow: TextOverflow.None })

    }
    .alignItems(HorizontalAlign.Start)
  }
}