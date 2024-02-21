import { CommonTopBar } from '../../view/CommonTopBar'
@Component
export default struct HomePage {
  @State message: string = 'Hello World'

  build() {
    Column(){
      CommonTopBar({title: '首页', backButton: false, alpha: 1})
        .align(Alignment.TopStart)

      Stack() {

      }
      .layoutWeight(1)
    }
  }
}