import { FocusModelItemList, FocusModelItemListDataItemList } from '../../../../model/FocusModel'
import { RoutePath } from '../../../../route/RoutePath'
import { Router } from '../../../../route/Router'
@Component
export struct FocusItemComponent {
  private item: FocusModelItemList

  build() {
    Column() {
      Row() {
        Image(this.item.data.header.icon)
          .width('50vp')
          .height('50vp')
          .border({radius: '25vp'})
        
        Column() {
          Text(this.item.data?.header.title)
            .fontSize('15fp')
            .fontColor('#333333')
            .maxLines(1)
            .textOverflow({overflow: TextOverflow.Ellipsis})
          Text(this.item.data?.header.description)
            .fontSize('13fp')
            .fontColor('#999999')
            .margin({top: '5vp'})
            .maxLines(1)
            .textOverflow({overflow: TextOverflow.Ellipsis})
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
      
      List({space: 10}) {
        ForEach(this.item.data.itemList, (innerItem: FocusModelItemListDataItemList, index: number)=> {
          ListItem() {
            Stack() {
              Stack() {
                Image(innerItem.data?.cover.feed)
                  .width('100%')
                  .height('100%')
                  .border({radius: '10vp'})
                  .alt($r('app.media.back_placeholder'))
                Text(innerItem.data?.category)
                  .width('45vp')
                  .height('20vp')
                  .fontColor('#fff')
                  .fontSize('12fp')
                  .backgroundColor($r('app.color.color_red'))
                  .border({ radius: { topLeft: $r('app.float.size_10'), bottomRight: $r('app.float.size_10') } })
                  .textAlign(TextAlign.Center)
                  .position({ x: 0, y: 0 })
              }
            }
            .width('130vp')
            .height('220vp')
          }
          .onClick(()=> {
            Router.push(RoutePath.DetailPage, { "id": innerItem.data.id, playUrl: innerItem.data.playUrl })
          })

        })
      }
      .listDirection(Axis.Horizontal)
      .height('130vp')
      .width('100%')
      
    }
  }
}