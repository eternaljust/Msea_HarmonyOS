import router from '@ohos.router';
import { CommonConstants } from '../../common/constants/CommonConstants';
import UserInfo from '../../common/utils/UserCacheInfo'
import Logger from '../../common/utils/Logger';

@Entry
@Component
export struct NoticePage {
  @State isLogin: boolean = true;
  @State auth: string = '';

  onPageShow() {
    Logger.info('NoticePage onPageShow')
    this.refresh();
  }

  aboutToAppear() {
    Logger.info('NoticePage aboutToAppear')
    this.refresh();
  }

  async refresh() {
    let auth = await UserInfo.getAuth() as string;
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
          .height(CommonConstants.PERCENT_100)
          .justifyContent(FlexAlign.Center)
        }
      }
      .height(CommonConstants.PERCENT_100)
      .title(getContext(this).resourceManager.getStringSync($r('app.string.tab_notice')))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
    }
  }
}