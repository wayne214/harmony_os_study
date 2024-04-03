import router from '@ohos.router';
import Logger from '../common/utils/Logger'

export class Router {
  /**
   * router.pushUrl()：目标页不会替换当前页，而是压入页面栈。这样可以保留当前页的状态，并且可以通过返回键或者调用router.back()方法返回到当前页。
     router.replaceUrl()：目标页会替换当前页，并销毁当前页。这样可以释放当前页的资源，并且无法返回到当前页。

   Standard：标准实例模式，也是默认情况下的实例模式。每次调用该方法都会新建一个目标页，并压入栈顶。

   Single：单实例模式。即如果目标页的url在页面栈中已经存在同url页面，则离栈顶最近的同url页面会被移动到栈顶，并重新加载；
   如果目标页的url在页面栈中不存在同url页面，则按照标准模式跳转。

   * */
  static push(url: string, params?: Object) {
    router.pushUrl({url: url, params: params}, router.RouterMode.Standard, (err)=> {
      if (err) {
        Logger.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      Logger.info(`pushUrl success ${url}}`)
    })
  }

  static replace(url: string, params?: Object) {
    router.replaceUrl({url: url, params: params}, router.RouterMode.Standard, (err)=> {
      if (err) {
        Logger.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      Logger.info(`pushUrl success ${url}}`)
    })
  }
}