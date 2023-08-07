import { PERCENT_100 } from '../../common/constants/CommonConstants'

@Entry
@Component
@Preview
struct LoginPage {
  build() {
    Column() {
      Navigation() {
        Text('账号')
        Text('密码')
      }
      .height(PERCENT_100)
      .title('登录')
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}