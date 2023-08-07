import router from '@ohos.router';
import { PERCENT_100 } from '../../common/constants/CommonConstants';
import UserInfo from '../../common/utils/UserCacheInfo'

@Entry
@Component
export struct NoticePage {
  @State isLogin: boolean = true;
  @State auth: string = '';

  aboutToAppear() {
    this.refresh();
  }

  onPageShow() {
    this.refresh();
  }

  async refresh() {
    let auth = <string> await UserInfo.getAuth();
    this.auth = auth;
    this.isLogin = auth != '';
  }

  build() {
    Column() {
      Navigation() {
        if (this.isLogin) {
          Text('已登录' + this.auth)
        } else {
          Column() {
            Button('登录')
              .backgroundColor($r('app.color.app_theme_primary'))
              .onClick(() => {
                UserInfo.setAuth('12345678')
                this.refresh()
                router.pushUrl({
                  url: 'pages/profile/LoginPage'
                })
              })
          }
          .height(PERCENT_100)
          .justifyContent(FlexAlign.Center)
        }
      }
      .height(PERCENT_100)
      .title(getContext(this).resourceManager.getStringSync($r('app.string.tab_notice')))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
    }
  }
}