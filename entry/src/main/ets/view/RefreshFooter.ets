@Component
export struct RefreshFooter {
  @Prop showFooter: boolean

  build() {
    Row() {
      Text("数据加载中，请稍后...")
        .fontColor('#333333')
        .fontSize('15fp')
    }
    .width('100%')
    .height('50vp')
    .backgroundColor('#FFF8F8F8')
    .visibility(this.showFooter ? Visibility.Visible : Visibility.None)
    .justifyContent(FlexAlign.Center)
  }
}