@Entry
@Component
export struct ProfilePage {
  build() {
    Column() {
      Navigation() {
        Text($r('app.string.tab_profile'))
          .fontSize($r('app.float.text_size_headline6_30_medium'))
      }
      .title(getContext(this).resourceManager.getStringSync($r('app.string.tab_profile')))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
    }
  }
}