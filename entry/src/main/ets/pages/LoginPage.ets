// @ts-nocheck
import StyleConstants from '../common/constants/StyleConstants';
import { CommonConstants } from '../common/constants/CommonConstants';
import CommonUtils from '../common/utils/CommonUtils'

@Entry
@Component
struct LoginPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        LoginTitle()
        LoginBottom()
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Preview
@Component
struct LoginTitle{
  build() {
    Column() {
      Image($r('app.media.icon'))
        .width($r('app.float.logo_image_size'))
        .height($r('app.float.logo_image_size'))
        .margin({bottom:$r('app.float.logo_margin_bottom')})
      Text($r('app.string.login_page'))
        .fontSize('24fp')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))
      Text("登录使用更多服务")
        .fontSize('16fp')
        .fontColor($r('app.color.more_text_color'))
        .margin({
          top: '8vp',
          bottom: '12vp'
        })

    }
    .backgroundColor($r('app.color.background'))
    .justifyContent(FlexAlign.Center)
    .width(StyleConstants.FULL_PARENT)
    .height(StyleConstants.LOGIN_LOGO_HEIGHT)
  }
}

@Preview
@Component
struct LoginBottom {
  @State account: string = ''
  @State password: string = ''

  build() {
    Column() {
      Column() {
        TextInput({placeholder: '账号：'})
          .maxLength(11)
          .type(InputType.Number)
          .inputStyle()
          .onChange((value: string)=>{
            this.account = value;
          })

        Line()
          .width(StyleConstants.FULL_PARENT)
          .height(0.5)
          .margin({
            left: 12,
            right: 12
          })
          .backgroundColor('#OD182431')

        TextInput({placeholder: '密码：'})
          .maxLength(8)
          .type(InputType.Password)
          .inputStyle()
          .onChange((value: string)=>{
            this.password = value;
          })
      }
      .backgroundColor(Color.White)
      .borderRadius(24)

      Row() {
        Text('短信验证码登录')
          .blueTextStyle()
          .onClick(()=>{
            CommonUtils.showToastContent('敬请期待');
          })
        Text('忘记密码')
          .blueTextStyle()
          .onClick(()=>{
            CommonUtils.showToastContent('敬请期待');
          })
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width(StyleConstants.FULL_PARENT)
      .margin({top: '12vp'})
      .padding({
        left: '12vp',
        right: '12vp'
      })

      Button('登录')
        .id(CommonConstants.LOGIN_BUTTON_ID)
        .width(StyleConstants.FULL_PARENT)
        .height('40vp')
        .fontSize('16fp')
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#007DFF')
        .margin({
          top: '68vp',
          bottom: '12vp'
        })
        .onClick(()=>{
          CommonUtils.loginArkTS(this.account, this.password);
        })

      Text('注册账号')
        .fontColor('#007DFF')
        .fontSize('16fp')
        .fontWeight(FontWeight.Medium)
        .onClick(()=>{
          CommonUtils.showToastContent('敬请期待');
        })



    }
    .padding({
      left: 12,
      right: 12
    })
    .backgroundColor($r('app.color.background'))
    .height(StyleConstants.LOGIN_BOTTOM_HEIGHT)
  }
}

@Extend(TextInput) function inputStyle() {
  .placeholderColor('#99182431')
  .height(48)
  .fontSize('16fp')
  .backgroundColor(Color.White)
  .margin({top: 4})
  .padding({
    left: StyleConstants.INPUT_PADDING_LEFT
  })
}

@Extend(Text) function blueTextStyle() {
  .fontColor('#007DFF')
  .fontSize('14fp')
  .fontWeight(FontWeight.Medium)
}