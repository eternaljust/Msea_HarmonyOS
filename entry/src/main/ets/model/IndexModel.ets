interface BottomTabsItem {
  normalIcon: Resource;
  selectedIcon: Resource;
  text: Resource;
}

export const BottomTabsList: Array<BottomTabsItem> = [
  {
    normalIcon: $r('app.media.ic_tab_home_normal'),
    selectedIcon: $r('app.media.ic_tab_home_selected'),
    text: $r('app.string.tab_home')
  },
  {
    normalIcon: $r('app.media.ic_tab_notice_normal'),
    selectedIcon: $r('app.media.ic_tab_notice_selected'),
    text: $r('app.string.tab_notice')
  },
  {
    normalIcon: $r('app.media.ic_tab_profile_normal'),
    selectedIcon: $r('app.media.ic_tab_profile_selected'),
    text: $r('app.string.tab_profile')
  }
]