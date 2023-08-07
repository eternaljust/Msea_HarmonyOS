import { PERCENT_100 } from '../../common/constants/CommonConstants'

@Entry
@Component
@Preview
struct SettingPage {
  build() {
    Column() {
      Navigation() {
        Text('设置')
      }
      .height(PERCENT_100)
      .title('设置')
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}