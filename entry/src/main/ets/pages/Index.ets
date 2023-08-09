import PreferencesUtil from '../common/utils/PreferencesUtil';
import { HomePage } from './home/HomePage';
import { NoticePage } from './notice/NoticePage';
import { ProfilePage } from './profile/ProfilePage';
import { getResourceText } from '../common/utils/ResourceUtil'

@Entry
@Component
struct Index {
  private tabsController : TabsController = new TabsController();
  @State currentIndex: number = 0;

  async aboutToAppear() {
    // Get the lightweight storage db file from memory.
    await PreferencesUtil.getPreferencesFromStorage();
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        HomePage()
      }
      .tabBar(this.TabBuilder(
        getResourceText($r('app.string.tab_home')),
        0,
        $r("app.media.ic_tab_home_selected"),
        $r("app.media.ic_tab_home_normal")
      ))

      TabContent() {
        NoticePage()
      }
      .tabBar(this.TabBuilder(
        getResourceText($r('app.string.tab_notice')),
        1,
        $r("app.media.ic_tab_profile_selected"),
        $r("app.media.ic_tab_profile_normal")
      ))

      TabContent() {
        ProfilePage()
      }
      .tabBar(this.TabBuilder(
        getResourceText($r('app.string.tab_profile')),
        2,
        $r("app.media.ic_tab_notice_selected"),
        $r("app.media.ic_tab_notice_normal")
      ))
    }
    .height('100%')
    .onChange((index) => {
      this.currentIndex = index;
    })
  }

  @Builder TabBuilder(
    title: string,
    targetIndex: number,
    selectedImg: Resource,
    normalImg: Resource
  ) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 24, height: 24 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.app_theme_primary') : $r('app.color.app_tab_text'))
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