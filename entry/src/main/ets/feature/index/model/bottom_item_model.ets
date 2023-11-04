export interface NavItem {
  icon_normal: Resource;
  icon_selected: Resource;
  icon_color_normal: Resource;
  icon_color_selected: Resource;
  title: Resource;
  title_color_normal: Resource;
  title_color_selected: Resource;
  id: number;
}

// tabId
export enum BottomTabId {
  HOME,
  ROAMING,
  TOPIC,
  USER_CENTER,
}

export const BottomTabList: NavItem[] = [
  {
    icon_normal: $r('app.media.icon_bottom_tab_home'),
    icon_selected: $r('app.media.icon_bottom_tab_home'),
    icon_color_normal: $r('app.color.col_333333'),
    icon_color_selected: $r('app.color.col_007dff'),
    title: $r('app.string.bottom_tab_home'),
    title_color_normal: $r('app.color.col_333333'),
    title_color_selected: $r('app.color.col_007dff'),
    id: BottomTabId.HOME
  },
  {
    icon_normal: $r('app.media.icon_bottom_tab_tape'),
    icon_selected: $r('app.media.icon_bottom_tab_tape'),
    icon_color_normal: $r('app.color.col_333333'),
    icon_color_selected: $r('app.color.col_007dff'),
    title: $r('app.string.bottom_tab_roaming'),
    title_color_normal: $r('app.color.col_333333'),
    title_color_selected: $r('app.color.col_007dff'),
    id: BottomTabId.ROAMING
  },
  {
    icon_normal: $r('app.media.icon_bottom_tab_topic'),
    icon_selected: $r('app.media.icon_bottom_tab_topic'),
    icon_color_normal: $r('app.color.col_333333'),
    icon_color_selected: $r('app.color.col_007dff'),
    title: $r('app.string.bottom_tab_topic'),
    title_color_normal: $r('app.color.col_333333'),
    title_color_selected: $r('app.color.col_007dff'),
    id: BottomTabId.TOPIC
  },
  {
    icon_normal: $r('app.media.icon_bottom_tab_user'),
    icon_selected: $r('app.media.icon_bottom_tab_user'),
    icon_color_normal: $r('app.color.col_333333'),
    icon_color_selected: $r('app.color.col_007dff'),
    title: $r('app.string.bottom_tab_mine'),
    title_color_normal: $r('app.color.col_333333'),
    title_color_selected: $r('app.color.col_007dff'),
    id: BottomTabId.USER_CENTER
  },
]