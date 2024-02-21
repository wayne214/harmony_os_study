/**
 * 通用 Dialog 弹窗组件
 * */
@CustomDialog
export struct CommonDialog {
  @BuilderParam contentBuilder?: () => void

  @Link title: Resource
  @Link description: Resource
  // 确认按钮
  private positiveText = "确认"
  // 取消按钮
  private negativeText = "取消"
  // 确认按钮回调
  private positiveCallback: () => void
  // 取消按钮回调
  private negativeCallback: () => void
  // 是否展示确认按钮
  private showPositive = true
  // 是否展示取消按钮
  private showNegative = true
  // 弹窗控制器
  controller: CustomDialogController

  aboutToAppear(){}

  build() {
    Stack() {
      Column() {
        Text(this.title)
          .fontSize('16fp')
          .fontColor('#d81e06')
          .fontWeight(FontWeight.Bold)
          .maxLines(1)
          .height('50fp')
          .textAlign(TextAlign.Center)
          .textOverflow({overflow: TextOverflow.Ellipsis})

        Divider().color('#f5f5f5')

        Text(this.description)
          .fontSize('15fp')
          .fontColor('#555555')
          .textAlign(TextAlign.Start)
          .padding('20fp')

        Divider().color('#f5f5f5').padding(0)

        Row() {
          Text(this.negativeText)
            .flexShrink(1)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
            .visibility(this.showNegative ? Visibility.Visible : Visibility.None)
            .onClick(()=>{
              this.negativeCallback?.()
              this.controller.close()
            })

          Divider()
            .color('#f5f5f5')
            .vertical(true)
            .visibility((this.showPositive && this.showNegative) ? Visibility.Visible : Visibility.None)

          Text(this.positiveText)
            .textAlign(TextAlign.Center)
            .layoutWeight(1)
            .fontColor('#d81e06')
            .visibility(this.showPositive ? Visibility.Visible : Visibility.None)
            .onClick(()=> {
              this.positiveCallback?.()
              this.controller.close()
            })
        }
        .height('50vp')
        .width('100%')


      }
      .backgroundColor('#ffffff')
      .border({radius: '6vp'})
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
  }
}