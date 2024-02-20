// @ts-nocheck
import { PERCENT_100 } from '../../common/constants/CommonConstants'
import { showToast } from '../../common/utils/ComponentUtil';
import { LoginFieldItem, LoginQuestionItem } from '../../model/LoginModel'
import { loginViewModel } from '../../viewmodel/LoginViewModel';

@Entry
@Component
@Preview
struct LoginPage {
  private fieldItems: LoginFieldItem[] = [LoginFieldItem.USERNAME, LoginFieldItem.EMAIL];
  @State loginItem: LoginFieldItem = LoginFieldItem.USERNAME;
  private questionItems: LoginQuestionItem[] = [
    LoginQuestionItem.NO,
    LoginQuestionItem.MOTHER_NAME,
    LoginQuestionItem.GRANDPA_NAME,
    LoginQuestionItem.FATHER_BORN_CITY,
    LoginQuestionItem.ONE_TEACHER_NAME,
    LoginQuestionItem.COMPUTER_MODEL,
    LoginQuestionItem.FAVORITE_RESTAURANT_NAME,
    LoginQuestionItem.LAST_FOUR_DIGITS_OF_DRIVER_LICENSE
  ];
  @State questionItem: LoginQuestionItem = LoginQuestionItem.NO;

  build() {
    Navigation() {
      Column() {
        Blank()

        Column() {
          Row() {
            Text(`${LoginFieldItem.title(this.loginItem)} ▼`)
              .bindMenu(this.getLoginItems())
          }
          .width(PERCENT_100)
          .justifyContent(FlexAlign.Start)

          TextInput({placeholder: `请输入${LoginFieldItem.title(this.loginItem)}`})
            .margin({ top: $r('app.float.margin_padding_10') })

          TextInput({placeholder: '请输入密码'})
            .margin({ top: $r('app.float.margin_padding_10') })
            .type(InputType.Password)

          Row() {
            Text('安全提问：')

            Button(`${LoginQuestionItem.title(this.questionItem)}`)
              .fontColor($r('app.color.app_theme_secondary'))
              .backgroundColor(Color.Transparent)
              .borderColor($r('app.color.app_theme_secondary'))
              .borderWidth(1)
              .height(30)
              .bindMenu(this.getQuestionItems())
          }
          .width(PERCENT_100)
          .margin({ top: $r('app.float.margin_padding_10') })

          if (this.questionItem != LoginQuestionItem.NO) {
            TextInput({placeholder: '请输入答案'})
              .margin({ top: $r('app.float.margin_padding_10') })
          }

          Button('登录')
            .margin({ top: $r('app.float.margin_padding_10')})
            .width(PERCENT_100)
            .onClick(() => {
              showToast('登录');
            })
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

  aboutToAppear() {
    loginViewModel.postData()
  }

  getLoginItems(): {
    value: string;
    action: () => void
  }[] {
    let items: {
      value: string;
      action: () => void
    }[] = [];

    for (let i = 0; i < this.fieldItems.length; i++) {
      items.push(
        {
          value: LoginFieldItem.title(this.fieldItems[i]),
          action: () => {
            this.loginItem = this.fieldItems[i];
          }
        }
      );
    }

    return items;
  }

  getQuestionItems(): {
    value: string;
    action: () => void
  }[] {
    let items: {
      value: string;
      action: () => void
    }[] = [];

    for (let i = 0; i < this.questionItems.length; i++) {
      items.push(
        {
          value: LoginQuestionItem.title(this.questionItems[i]),
          action: () => {
            this.questionItem = this.questionItems[i];
          }
        }
      );
    }

    return items;
  }
}