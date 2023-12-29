import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import StyleConstants from '../common/constants/StyleConstants'
import CommonUtils  from '../common/utils/CommonUtils'
import Logger from '../common/utils/Logger'
import ItemData from '../viewmodel/ItemData'
import MainViewModel from '../viewmodel/MainViewModel'
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

          MineTitleView()

          Button('快速使用')
            .onClick(() => {
              router.pushUrl({ url: 'pages/quickStart' })
            })

          MineListView()

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

@Preview
@Component
struct MineListView {
  build(){
    List() {
      ForEach(MainViewModel.getMineListData(),(item: ItemData)=>{
        ListItem(){
          Item({item: item})
        }
        .height('48vp')
      }, (item: ItemData) => JSON.stringify(item))
    }
    .width('100%')
    .backgroundColor(Color.White)
    .divider({
      strokeWidth: '0.25vp',
      color: $r('app.color.item_divider_color'),
      startMargin: $r('app.float.list_start_margin'),
      endMargin: $r('app.float.list_end_margin')
    })
    .borderRadius('24vp')
    .padding({
      top: '4vp',
      bottom: '4vp'
    })
  }
}

@Component
struct Item {
  private item?:ItemData;
  private itemCellImage?: Resource;
  private itemCellTitle?: Resource;
  private itemCellOthers?: Resource;
  private itemClickPrompt?: Resource;
  aboutToAppear(){
    if (this.item) {
      Logger.info(CommonConstants.TAG_LIST_ITEM, 'item = ' + JSON.stringify(this.item));
      this.itemCellImage = this.item.img;
      this.itemCellTitle = this.item.title;
      this.itemCellOthers = this.item.others;
      this.itemClickPrompt = this.item.clickPrompt;
    }
  }
  build(){
    Row(){
      Row({ space: StyleConstants.COMMON_SPACE }) {
        if(this.itemCellImage) {
          Image(this.itemCellImage)
            .width('22vp')
            .height('22vp')
        }
        Text(this.itemCellTitle)
          .fontSize('16fp')
      }
      if(this.itemCellOthers === null) {
        Image($r('app.media.ic_right_grey'))
          .width('12vp')
          .height('12vp')
      } else {
        Toggle({type: ToggleType.Switch,isOn: false})
          .onChange((isChange: Boolean)=>{
            let change: Resource = isChange ? $r('app.string.open_news') : $r('app.string.close_news');
            CommonUtils.showToastContent(this.itemClickPrompt);
          })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      left: '12vp',
      right: '12vp'
    })
    .onClick(()=>{
      if (this.itemCellOthers === null && this.itemClickPrompt) {
        CommonUtils.showToastContent(this.itemClickPrompt);
      }
    })
  }
}

@Preview
@Component
struct MineTitleView {
  build(){
    Row(){
      Image($r('app.media.ic_account'))
      .width($r('app.float.mine_title_size'))
      .height($r('app.float.mine_title_size'))
      Column(){
        Text('张先生')
          .fontSize("20fp")
        Text($r('app.string.mine_title_email'))
          .fontSize('12fp')
          .margin({top: '4vp'})
      }
      .margin({left: '14vp'})
      .alignItems(HorizontalAlign.Start)
    }
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .height('96vp')
    .backgroundColor(Color.White)
    .padding({left: '24vp'})
    .borderRadius('24vp')
    .margin({
      top: '35vp',
      bottom: '12vp'
    })
  }
}
