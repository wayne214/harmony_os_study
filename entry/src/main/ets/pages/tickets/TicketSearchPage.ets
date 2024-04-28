import promptAction from '@ohos.promptAction'
@Entry
@Component
struct TicketSearchPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Column() {
        Row(){
          Column({space: 5}){
            Text("北京")
              .fontSize(20)
              .fontWeight(FontWeight.Medium)
              .fontColor('#132968')
            Text("BeiJing")
              .fontSize(13)
              .fontColor('#132968')
              .margin({top: 10})
          }
          .width(70)

          Rect()
          .height(1)
          .width(40)
          .margin(7)

          Column({
            space: 5
          }){}
          .width(40)

          Rect()
            .height(1)
            .width(40)
            .margin(7)

          Column({space: 5}){
            Text("济南")
              .fontSize(20)
              .fontWeight(FontWeight.Medium)
              .fontColor('#132968')
            Text("JiNan")
              .fontSize(13)
              .fontColor('#132968')
          }
          .width(70)
        }
        .height(92)
        .backgroundColor(Color.Pink)
        .justifyContent(FlexAlign.SpaceAround)

        DatePicker({
          start: new Date(),
          end: new Date("2025-1-1")
        })
          .padding(3)
          .height(165)
          .width(230)

        Button({type: ButtonType.Normal}){
          Text("开始查询")
            .fontSize(18)
            .fontColor(Color.White)
            .margin({left: 80, right: 80, top: 5, bottom: 5})
        }
        .margin(20)
        .height(35)
        .backgroundColor('#FC6A68')
        .borderRadius(8)
        .onClick(()=>{
          promptAction.showToast({
            message: '恭喜您!购票成功，请尽快前往取票窗口取票'
          })
        })
      }
      .padding(5)
      .height(350)
      .width('100%')
    }
    .height('100%')
    .width('100%')
  }
}