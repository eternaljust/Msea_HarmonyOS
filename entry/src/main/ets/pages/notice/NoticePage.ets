@Entry
@Component
export struct NoticePage {
  build() {
    Column() {
      Navigation() {
        Text($r('app.string.tab_notice'))
          .fontSize($r('app.float.text_size_headline6_30_medium'))
          .fontWeight(FontWeight.Medium)
      }
      .title(getContext(this).resourceManager.getStringSync($r('app.string.tab_notice')))
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
    }
  }
}