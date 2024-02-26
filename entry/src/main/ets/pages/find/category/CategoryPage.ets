import { ViewStateConstant } from '../../../common/constants/ViewStateConstant'
import ImageRegexUtils from '../../../common/utils/ImageRegexUtils'
import Logger from '../../../common/utils/Logger'
import { BaseDataSourceWrapper } from '../../../model/BaseDataSourceWrapper'
import { CategoryModel, CategoryModelChild } from '../../../model/CategoryModel'
import { RoutePath } from '../../../route/RoutePath'
import { Router } from '../../../route/Router'
import { StateComponent } from '../../../view/StateComponent'
import CategoryViewModel from '../../../viewmodel/CategoryViewModel'
@Component
export struct CategoryPage {
  @State viewState: string = ViewStateConstant.VIEW_STATE_LOADING
  @State dataList: CategoryModel = []
  @State dataSource: BaseDataSourceWrapper<CategoryModelChild> = new BaseDataSourceWrapper<CategoryModelChild>([])
  @Consume @Watch("onHomeTabSelected") homeTabSelected: number
  @Consume @Watch("onFindTabSelectedIndex") findCurrentIndex: number
  private hasInit = false

  aboutToAppear() {
    CategoryViewModel.observeState((state)=> this.viewState = state)
    if(this.hasInit) {
      this.loadNet()
    }
  }

  /**
   * 懒加载处理逻辑-监听主体页面的tab
   */
  onHomeTabSelected() {
    Logger.debug("Category-homeTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  /**
   * 懒加载处理逻辑--监听发现页面的tab
   */
  onFindTabSelectedIndex() {
    Logger.debug("Category-onFindTabSelectedIndex>>>", `FindIndex:${this.findCurrentIndex}>>>HomeIndex${this.homeTabSelected}`)
    this.initData()
  }

  initData() {
    if (!this.hasInit && this.homeTabSelected == 1 && this.findCurrentIndex == 1) {
      this.loadNet()
      this.hasInit = true
    }
  }

  loadNet() {
    CategoryViewModel.getCategoryDataList((result)=> {
      this.dataList = result
      this.dataSource = new BaseDataSourceWrapper<CategoryModelChild>(this.dataList)
    })
  }

  build() {
    Stack() {
      StateComponent({
        viewState: this.viewState,
        retryCallback: ()=> {
          this.loadNet()
        }
      }) {
        Grid() {
          LazyForEach(this.dataSource, (item: CategoryModelChild, index: number)=> {
            GridItem() {
              Stack() {
                Image(ImageRegexUtils(item.bgPicture))
                  .border({radius: '5vp'})
                  .alt($r('app.media.back_placeholder'))


                Text(item.name)
                  .fontColor(Color.White)
                  .fontSize('30fp')
                  .fontWeight(FontWeight.Bold)
              }
              .border({radius: '5vp'})
            }
            .onClick(()=> {
              Router.push(RoutePath.CategoryDetailPage, {
                'headerImage' : item.headerImage,
                "title" : item.name,
                "id" : item.id
              })
            })

          })
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .height('100%')
        .padding({
          left: 10,
          right: 10,
          top: 10,
          bottom: 50
        })
      }
    }
  }
}