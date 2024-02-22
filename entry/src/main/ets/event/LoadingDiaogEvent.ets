export function LoadingDialogEvent(showLoading: boolean, loadingTips: string = "加载中...") {
  return {
    data: {
      'showLoading': showLoading,
      'loadingTips': loadingTips
    }
  }
}