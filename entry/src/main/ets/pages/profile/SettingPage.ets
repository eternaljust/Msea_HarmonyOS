import {  CommonConstants as Const } from '../../common/constants/CommonConstants'
import { UserInfo } from '../../common/utils/UserCacheInfo'
import router from '@ohos.router';
import Logger from '../../common/utils/Logger';

@Entry
@Component
@Preview
struct SettingPage {
  @State isLogin: boolean = true;

  onPageShow() {
    Logger.info('SettingPage onPageShow')
    this.refresh();
  }

  aboutToAppear() {
    Logger.info('SettingPage aboutToAppear')
    this.refresh();
  }

  async refresh() {
    let auth = await UserInfo.getInstance().getAuth() as string;
    this.isLogin = auth != '';
  }

  build() {
    Column() {
      Navigation() {
        Row() {
          if (!this.isLogin) {
            Text($r('app.string.setting_title'))
          } else {
            Text($r('app.string.login_logged_in'))

            Button($r('app.string.setting_logout'))
              .onClick(() => {
                UserInfo.getInstance().reset();
                router.back();
              })
          }
        }
        .width(Const.PERCENT_100)
        .justifyContent(FlexAlign.SpaceAround)
      }
      .height(Const.PERCENT_100)
      .title($r('app.string.setting_title'))
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}