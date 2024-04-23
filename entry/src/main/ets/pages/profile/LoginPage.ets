import { PERCENT_100 } from '../../common/constants/CommonConstants'
import { showToast } from '../../common/utils/ComponentUtil';
import { LoginFieldItem, LoginQuestionItem } from '../../model/LoginModel'
import router from '@ohos.router';
import { BindMenuNormalItem } from '../../view/Widget'
// import { loginViewModel } from '../../viewmodel/LoginViewModel';

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
              // .bindMenu(this.getLoginItems())
          }
          .width(PERCENT_100)
          .justifyContent(FlexAlign.Start)

          TextInput({placeholder: `请输入${LoginFieldItem.title(this.loginItem)}`})
            .margin({ top: $r('app.float.margin_padding_10') })
            .onChange(value => (this.username = value))

          TextInput({placeholder: '请输入密码'})
            .margin({ top: $r('app.float.margin_padding_10') })
            .type(InputType.Password)
            .onChange((value) => this.password = value)

          Row() {
            Text('安全提问：')

            Button(`${LoginQuestionItem.title(this.questionItem)}`)
              .fontColor($r('app.color.app_theme_primary'))
              .backgroundColor(Color.Transparent)
              .borderColor($r('app.color.app_theme_primary'))
              .borderWidth(1)
              .height(30)
              // .bindMenu(this.getQuestionItems())
          }
          .width(PERCENT_100)
          .margin({ top: $r('app.float.margin_padding_10') })

          if (this.questionItem != LoginQuestionItem.NO) {
            TextInput({placeholder: '请输入答案'})
              .margin({ top: $r('app.float.margin_padding_10') })
              .onChange(value => this.answer = value)
          }

          Button('登录')
            .backgroundColor($r('app.color.app_theme_primary'))
            .margin({ top: $r('app.float.margin_padding_10')})
            .width(PERCENT_100)
            .enabled(this.username.length != 0 && this.password.length != 0)
            // .onClick(() => this.login())
        }
        .width(300)
        .justifyContent(FlexAlign.Center)

        Blank()
      }
      .height(PERCENT_100)
    }
    .width(PERCENT_100)
    .height(PERCENT_100)
    .title('登录')
    .titleMode(NavigationTitleMode.Mini)
  }

  // getLoginItems(): BindMenuNormalItem[] {
  //   let items = loginViewModel.fieldItems.map(value => {
  //     let item: BindMenuNormalItem = {
  //       value: LoginFieldItem.title(value),
  //       action: () => { this.loginItem = value }
  //     };
  //     return item;
  //   });
  //   return items;
  // }
  //
  // getQuestionItems(): BindMenuNormalItem[] {
  //   let items = loginViewModel.questionItems.map(value => {
  //     let item: BindMenuNormalItem = {
  //       value: LoginQuestionItem.title(value),
  //       action:
  //       () => this.questionItem = value,
  //     };
  //     return item;
  //   });
  //   return items;
  // }
  //
  // async login() {
  //   let result: [boolean, string] = await loginViewModel.login(
  //     this.loginItem,
  //     this.questionItem,
  //     this.username,
  //     this.password,
  //     this.answer
  //   );
  //
  //   if (result[0]) {
  //     router.back()
  //   }
  //   showToast(result[1])
  // }
}