import router from '@ohos.router';
import {  CommonConstants as Const } from '../../common/constants/CommonConstants';
import Logger from '../../common/utils/Logger';
import { UserInfo } from '../../common/utils/UserCacheInfo'
import { getResourceText } from '../../common/utils/ResourceUtil';

@Entry
@Component
@Preview
export struct ProfilePage {
  @State isLogin: boolean = false;

  onPageShow() {
    Logger.info('NoticePage onPageShow')
    this.refresh();
  }

  aboutToAppear() {
    Logger.info('ProfilePage aboutToAppear')
    this.refresh();
  }

  async refresh() {
    let auth = await UserInfo.getInstance().getAuth() as string;
    this.isLogin = auth != '';
  }

  build() {
    Column() {
      Navigation() {
        if (this.isLogin) {
          Text(getResourceText($r('app.string.login_logged_in')))
        } else {
          Column() {
            Button($r('app.string.login_title'))
              .backgroundColor($r('app.color.app_theme_primary'))
              .onClick(() => {
                this.refresh()
                router.pushUrl({
                  url: 'pages/profile/LoginPage'
                })
              })
          }
          .height(Const.PERCENT_100)
          .justifyContent(FlexAlign.Center)
        }
      }
      .height(Const.PERCENT_100)
      .title($r('app.string.tab_profile'))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
      .menus([
        {
          value: '',
          icon: '../../../resources/base/media/ic_settings_filled.svg',
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