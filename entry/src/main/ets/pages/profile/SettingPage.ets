import { CommonConstants } from '../../common/constants/CommonConstants'
import UserInfo from '../../common/utils/UserCacheInfo'
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
    let auth = await UserInfo.getAuth() as string;
    this.isLogin = auth != '';
  }

  build() {
    Column() {
      Navigation() {
        Row() {
          if (!this.isLogin) {
            Text('设置')
          } else {
            Text('已登录')

            Button('退出登录')
              .onClick(() => {
                UserInfo.setAuth('')
                router.back()
              })
          }
        }
        .width(CommonConstants.PERCENT_100)
        .justifyContent(FlexAlign.SpaceAround)
      }
      .height(CommonConstants.PERCENT_100)
      .title('设置')
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}