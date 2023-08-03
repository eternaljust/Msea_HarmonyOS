@Entry
@Component
export struct HomePage {
  build() {
    Column() {
      Navigation() {
        Text($r('app.string.tab_home'))
          .fontSize($r('app.float.text_size_headline6_30_medium'))
          .fontWeight(FontWeight.Medium)
      }
      .title(getContext(this).resourceManager.getStringSync($r('app.string.tab_home')))
      .mode(NavigationMode.Auto)
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
    }
  }
}