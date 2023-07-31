@Entry
@Component
struct Index {
  private tabsController : TabsController = new TabsController()
  @State currentIndex: number = 0;

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Text($r('app.string.tab_home'))
          .fontSize($r('app.float.text_size_headline6_30_medium'))
          .fontWeight(FontWeight.Medium)
      }
      .tabBar(this.TabBuilder('虫部落', 0, $r('app.media.ic_public_home_filled_selected'), $r('app.media.ic_public_home_filled')))

      TabContent() {
        Text($r('app.string.tab_notice'))
          .fontSize($r('app.float.text_size_headline6_30_medium'))
          .fontWeight(FontWeight.Medium)
      }
      .tabBar(this.TabBuilder('通知', 1, $r('app.media.ic_controlcenter_ring_on_filled_selected'), $r('app.media.ic_controlcenter_ring_on_filled')))

      TabContent() {
        Text($r('app.string.tab_profile'))
          .fontSize($r('app.float.text_size_headline6_30_medium'))
      }
      .tabBar(this.TabBuilder('我的', 2, $r('app.media.ic_public_contacts_filled_selected'), $r('app.media.ic_public_contacts_filled')))
    }
    .height('100%')
    .onChange((index) => {
      this.currentIndex = index
    })
  }

  @Builder TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 24, height: 24 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.app_theme_primary') : $r('app.color.app_text_cccccc'))
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }
}