import {  CommonConstants as Const } from '../../common/constants/CommonConstants'
import { showToast } from '../../common/utils/ComponentUtil';
import { LoginFieldItem, LoginQuestionItem } from '../../model/LoginModel'
import router from '@ohos.router';
import { BindMenuNormalItem } from '../../view/Widget'
import { loginViewModel } from '../../viewmodel/LoginViewModel';
import { getResourceText } from '../../common/utils/ResourceUtil'
import { UserInfo } from '../../common/utils/UserCacheInfo'

@Entry
@Component
@Preview
struct LoginPage {
  @State loginItem: LoginFieldItem = LoginFieldItem.USERNAME;
  @State questionItem: LoginQuestionItem = LoginQuestionItem.NO;
  @State username: string = '';
  @State password: string = '';
  @State answer: string = '';

  build() {
    Navigation() {
      Column() {
        Blank()

        Column() {
          Row() {
            Text(`${LoginFieldItem.title(this.loginItem)} ▼`)
              .bindMenu(this.getLoginItems())
          }
          .width(Const.PERCENT_100)
          .justifyContent(FlexAlign.Start)

          TextInput({
            placeholder:
            `${getResourceText($r('app.string.login_input_placeholder'))}${LoginFieldItem.title(this.loginItem)}`
          })
            .margin({ top: $r('app.float.margin_padding_10') })
            .onChange(value => (this.username = value))

          TextInput({ placeholder: getResourceText($r('app.string.login_input_placeholder_password')) })
            .margin({ top: $r('app.float.margin_padding_10') })
            .type(InputType.Password)
            .onChange((value) => this.password = value)

          Row() {
            Text($r('app.string.login_safe_ask_question'))

            Button(`${LoginQuestionItem.title(this.questionItem)}`)
              .fontColor($r('app.color.app_theme_primary'))
              .backgroundColor(Color.Transparent)
              .borderColor($r('app.color.app_theme_primary'))
              .borderWidth(1)
              .height(30)
              .bindMenu(this.getQuestionItems())
          }
          .width(Const.PERCENT_100)
          .margin({ top: $r('app.float.margin_padding_10') })

          if (this.questionItem != LoginQuestionItem.NO) {
            TextInput({ placeholder: getResourceText($r('app.string.login_input_placeholder_answer')) })
              .margin({ top: $r('app.float.margin_padding_10') })
              .onChange(value => this.answer = value)
          }

          Button($r('app.string.login_title'))
            .backgroundColor($r('app.color.app_theme_primary'))
            .margin({ top: $r('app.float.margin_padding_10')})
            .width(Const.PERCENT_100)
            .enabled(this.username.length != 0 && this.password.length != 0)
            .onClick(() => this.login())
        }
        .width(300)
        .justifyContent(FlexAlign.Center)

        Blank()
      }
      .height(Const.PERCENT_100)
    }
    .width(Const.PERCENT_100)
    .height(Const.PERCENT_100)
    .title($r('app.string.login_title'))
    .titleMode(NavigationTitleMode.Mini)
  }

  getLoginItems(): BindMenuNormalItem[] {
    let items = LoginFieldItem.allCases().map(value => {
      let item: BindMenuNormalItem = {
        value: LoginFieldItem.title(value),
        action: () => { this.loginItem = value }
      };
      return item;
    });
    return items;
  }

  getQuestionItems(): BindMenuNormalItem[] {
    let items = LoginQuestionItem.allCases().map(value => {
      let item: BindMenuNormalItem = {
        value: LoginQuestionItem.title(value),
        action:
        () => this.questionItem = value,
      };
      return item;
    });
    return items;
  }

  async login() {
    let result: [boolean, string] = await loginViewModel.login(
      this.loginItem,
      this.questionItem,
      this.username,
      this.password,
      this.answer
    );

    if (result[0]) {
      UserInfo.getInstance().setAuth('123456');
      router.back();
    }
    showToast(result[1]);
  }
}