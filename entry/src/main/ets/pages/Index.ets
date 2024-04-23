import { HomePage } from './home/HomePage';
import { NoticePage } from './notice/NoticePage';
import { ProfilePage } from './profile/ProfilePage';
import { BottomTabsList } from '../model/IndexModel'

@Entry
@Component
struct Index {
  private tabsController : TabsController = new TabsController();
  @State currentIndex: number = 0;

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        HomePage()
      }
      .tabBar(this.TabBuilder(0))

      TabContent() {
        NoticePage()
      }
      .tabBar(this.TabBuilder(1))

      TabContent() {
        ProfilePage()
      }
      .tabBar(this.TabBuilder(2))
    }
    .height('100%')
    .onChange((index) => {
      this.currentIndex = index;
    })
  }

  @Builder TabBuilder(
    targetIndex: number
  ) {
    Column() {
      Image(this.currentIndex === targetIndex ?
      BottomTabsList[targetIndex].selectedIcon : BottomTabsList[targetIndex].normalIcon)
        .size({ width: 24, height: 24 })

      Text(BottomTabsList[targetIndex].text)
        .fontColor(this.currentIndex === targetIndex ?
        $r('app.color.app_theme_primary') : $r('app.color.app_tab_text'))
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
}