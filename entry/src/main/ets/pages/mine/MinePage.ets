import image from '@ohos.multimedia.image'
import notification from '@ohos.notificationManager';
import { RoutePath } from '../../route/RoutePath'
import { Router } from '../../route/Router'
import { CommonDialog } from '../../view/CommonDialog'
@Component
@Entry
export default struct MinePage {
  @State dialogTitle: string = '关于'
  @State dialogContent: string = '该项目是基于鸿蒙HarmonyOS Api9版本开发的开眼App（主要使用ArkTs+ArkUI开发），主要用来学习和了解HarmonyOS开发App的使用方式；项目封装了基本的网络请求以及页面网络状态管理等，也封装了部分基础组件和基础组件的使用'

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CommonDialog({
      title: $dialogTitle,
      description: $dialogContent
    })
  })

  aboutToAppear() {}
  aboutToDisappear() {
    this.dialogController = null
  }

  async publishPictureNotification() {
    let resourceManager = getContext(this).resourceManager;
    let imageArray = await resourceManager.getMediaContent($r('app.media.app_icon').id);
    let imageResource = image.createImageSource(imageArray.buffer);
    let pixelMap = await imageResource.createPixelMap();

    let notificationRequest: notification.NotificationRequest = {
      id: 1,
      content: {
        contentType: notification.ContentType.NOTIFICATION_CONTENT_PICTURE,
        picture: {
          title: '好物热销中', // 通知内容标题
          text: '展开查看详情', // 通知内容
          expandedTitle: '今日热门推荐', // 通知展开时的内容标题
          briefText: '这里一定有您喜欢的', // 通知概要内容，是对通知内容的总结
          picture: pixelMap // 通知的图片内容
        }
      }
    }

    notification.publish(notificationRequest).then(() => { // 发布通知
      console.info('publish success');
    }).catch((err) => {
      console.error(`publish failed, dcode:${err.code}, message:${err.message}`);
    });
  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Image($r('app.media.default_avatar'))
            .height(70)
            .width(70)
            .border({radius: 35})
          Text('Harmony-开眼App')
            .fontColor(Color.White)
            .fontSize('16fp')
            .margin({
              top: 10
            })
        }
        .backgroundImage($r('app.media.back_mine'))
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .width('100%')
        .height('250vp')

        this.itemBuilder("关注", $r('app.media.icon_focus'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "focus" })
        })
        this.itemBuilder("分类", $r('app.media.icon_type'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "category" })
        })
        this.itemBuilder("热门", $r('app.media.icon_topic'), () => {
          Router.push(RoutePath.ContainerPage, { "containerType": "topic" })
        })
        this.itemBuilder("关于", $r('app.media.icon_about'), () => {
          this.dialogController.open()
          // this.publishPictureNotification()
        })
      }
      .justifyContent(FlexAlign.Start)
      .height('100%')
    }
  }

  @Builder
  itemBuilder(title: string, icon: Resource, onItemClick?: ()=> void) {
    Stack({alignContent: Alignment.Bottom}) {
      Row() {
        Image(icon).width('25vp').height('25vp')
        Text(title)
          .fontSize('15fp')
          .fontColor('#333333')
          .margin({left: '10vp'})
      }
      .height('50vp')
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .padding({left: '10vp'})

      Divider()
        .color('#f5f5f5')
        .width('100%')

    }
    .height('50vp')
    .width('100%')
    .onClick(() => {
      onItemClick?.()
    })

  }


}