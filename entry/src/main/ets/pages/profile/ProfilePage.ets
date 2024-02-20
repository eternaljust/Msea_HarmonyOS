import router from '@ohos.router';
import { PERCENT_100 } from '../../common/constants/CommonConstants';
import Logger from '../../common/utils/Logger';
import UserInfo from '../../common/utils/UserCacheInfo'

@Entry
@Component
@Preview
export struct ProfilePage {
  @State isLogin: boolean = true;
  @State auth: string = '';

  onPageShow() {
    Logger.info('NoticePage onPageShow')
    this.refresh();
  }

  aboutToAppear() {
    Logger.info('ProfilePage aboutToAppear')
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
          .height(PERCENT_100)
          .justifyContent(FlexAlign.Center)
        }
      }
      .height(PERCENT_100)
      .title(getContext(this).resourceManager.getStringSync($r('app.string.tab_profile')))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
      .menus([
        {
          value: '',
          icon: '../../../resources/base/media/ic_profile_settings.png',
          action: () => {
            router.pushUrl({
              url: 'pages/profile/SettingPage'
            })
          }
        }
      ])
    }
  }
}