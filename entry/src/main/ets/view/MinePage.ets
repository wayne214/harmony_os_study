import { CommonConstants } from '../common/constants/CommonConstants'
import StyleConstants from '../common/constants/StyleConstants'
import CommonUtils  from '../common/utils/CommonUtils'
@Component
export default struct MinePage {
  build() {
    GridRow({columns: {
      sm:StyleConstants.COLUMNS_SM,
      md:StyleConstants.COLUMNS_MD,
      lg:StyleConstants.COLUMNS_LG
    },
      gutter: {
        x: StyleConstants.GRID_GUTTER
      }
    }){
      GridCol({
        span: {
          sm: StyleConstants.SPAN_SM,
          md: StyleConstants.SPAN_MD,
          lg: StyleConstants.SPAN_LG,
        },
        offset: {
          md: StyleConstants.OFFSET_MD,
          lg: StyleConstants.OFFSET_LG
        }
      }){
        Column(){
          Text($r('app.string.mine_page'))
            .fontWeight(FontWeight.Medium)
            .fontSize($r('app.float.common_text_size'))
            .margin({top: $r('app.float.tab_titles_margin')})
            .alignSelf(ItemAlign.Start)

          Blank()

          Button($r('app.string.mine_button'))
            .width(StyleConstants.BUTTON_WIDTH)
            .height($r('app.float.login_button_height'))
            .fontSize($r('app.float.normal_text_size'))
            .fontColor($r('app.color.logout_font_color'))
            .fontWeight(FontWeight.Medium)
            .backgroundColor($r('app.color.mine_button_color'))
            .margin({bottom: $r('app.float.mine_button_bottom')})
            .onClick(()=> this.logout())
        }
        .height(StyleConstants.FULL_PARENT)
        .padding({
          left: '12vp',
          right: '12vp'
        })
      }
    }
    .backgroundColor($r('app.color.background'))
  }

  logout(){
    CommonUtils.routerPage(CommonConstants.LOGIN_PAGE_URL)
  }
}