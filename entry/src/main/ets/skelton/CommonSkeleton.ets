/**
 * 通用骨架屏
 * */
@Component
export struct CommonSkeleton {
  @State dataList: Array<string> = new Array(5)

  aboutToAppear() {
    for (let i = 0; i < 3; i++) {
      this.dataList.push("")
    }
  }

  build() {
    List({space: 10}) {
      ForEach(this.dataList, (item, index)=> {
        ListItem() {
          this.itemBuild()
        }
      })
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  itemBuild() {
    Column() {
      Image($r('app.media.back_placeholder'))
        .width('100%')
        .height('200vp')
        .border({radius: '5vp'})

      Stack().width('90%')
        .height('25vp')
        .backgroundColor('#f5f5f5')
        .margin({top: '10vp'})

      Stack().width('70%')
        .height('25vp')
        .backgroundColor('#f5f5f5')
        .margin({top: '5vo'})
    }
    .alignItems(HorizontalAlign.Start)
  }
}