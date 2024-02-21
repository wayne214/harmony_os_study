@Component
@Entry
struct TestPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      // Column() {
      //   Text(this.message)
      //     .fontSize(50)
      //     .fontWeight(FontWeight.Bold)
      // }
      // .width('100%')

      this.TitleView()
    }
    .height('100%')
  }

  @Builder TitleView() {
    Column() {
      Row(){
        Row() {
          Text("延迟付")
            .fontColor(Color.White)
        }
        .padding(4)
        .backgroundColor(Color.Blue)
        .borderRadius({
          topLeft: 10,
          bottomRight: 10,
        })
        Text('运输中')
          .fontColor(Color.Green)
          .fontSize(12)
      }
      .alignSelf(ItemAlign.Start)
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')


      Row(){
        Image($r('app.media.app_icon'))
          .width('45vp')
          .width('45vp')

        Column() {
          Row() {
            Text('测试公司名称测试dddddddddddd')
              .fontSize(20)
              .fontColor($r('app.color.tab_text_normal'))
              .fontWeight(FontWeight.Bold)
              .maxLines(1)
              .textOverflow({overflow: TextOverflow.Ellipsis})
              .layoutWeight(1)

            Text('已认证')
              .fontSize(12)
              .fontColor(Color.Green)
              .margin({
                left: 10
              })
          }

          Text('186****0004')
            .fontSize(14)
            .fontColor("#ff008866")
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .margin({
          left: '10vp',
          right: '10vp'
        })

        Image($r('app.media.ic_right_arrow'))
          .width(12)
          .height(16)
      }
      .alignItems(VerticalAlign.Center)
      .margin({
        left: 16,
        right: 16,
        top: 10
      })
    }
    .backgroundColor(Color.Orange)
    .padding({
      bottom: 10
    })
    .margin({
      left: 12,
      right: 12
    })
    .borderRadius(10)
  }
}