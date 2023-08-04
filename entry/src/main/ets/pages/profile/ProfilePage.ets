import Logger from '../../common/utils/Logger';
import UserInfo from '../../common/utils/UserCacheInfo'

@Entry
@Component
@Preview
export struct ProfilePage {
  @State isLogin: boolean = true;
  @State auth: string = '';

  async aboutToAppear() {
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
          Button('登录')
        }
        Button(`toggle ${this.isLogin}`)
          .onClick(() => {
            this.isLogin = !this.isLogin;
          })
      }
      .height('100%')
      .title(getContext(this).resourceManager.getStringSync($r('app.string.tab_profile')))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
    }
  }
}