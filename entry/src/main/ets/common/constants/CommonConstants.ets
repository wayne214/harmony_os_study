/**
 * Common constants for all features.
 */
export class CommonConstants {
  /**
   * Search font weight.
   */
  static readonly SEARCH_FONT_WEIGHT: number = 10;

  /**
   * The placeholder of search component.Currently, component interfaces do not support the Resource type.
   * Therefore, you need to define constants. The default prompt in the search box does not support
   * internationalization.
   */
  static readonly SEARCH_PLACEHOLDER: string = 'Search...';

  /**
   * The font family of search component.
   */
  static readonly SEARCH_FONT_FAMILY: string = 'serif';

  /**
   * The percentage of search component.
   */
  static readonly SEARCH_WIDTH_PERCENT: string = '100%';

  /**
   * Number of tab contents.
   */
  static readonly TAB_SIZE: number = 5;

  /**
   * Layout weight of the bottom tab.
   */
  static readonly TAB_LAYOUT_WEIGHT: number = 1;

  /**
   * Number of detail list contents.
   */
  static readonly DETAIL_PAGE_LIST_SIZE: number = 2;

  /**
   * Number of list contents.
   */
  static readonly LIST_SIZE: number = 20;

  /**
   * Layout weight of the list title.
   */
  static readonly LIST_TITLE_LAYOUT_WEIGHT: number = 1;

  /**
   * Layout weight of the list.
   */
  static readonly LIST_LAYOUT_WEIGHT: number = 1;

  /**
   * Max lines of the list title.
   */
  static readonly LIST_TITLE_MAX_LINES: number = 1;

  /**
   * Detail page url.
   */
  static readonly PAGE_NAME: string = 'pages/DetailPage';

  /**
   * Key to transfer parameters when replace pages.
   */
  static readonly KEY_PARAM_DATA: string = 'data';

  /**
   * Breakpoint xs.
   */
  static readonly BREAK_POINT_XS: string = 'xs';

  /**
   * Breakpoint sm.
   */
  static readonly BREAK_POINT_SM: string = 'sm';

  /**
   * Breakpoint md.
   */
  static readonly BREAK_POINT_MD: string = 'md';

  /**
   * Breakpoint lg.
   */
  static readonly BREAK_POINT_LG: string = 'lg';

  /**
   * The break point value.
   */
  static readonly BREAK_POINTS_VALUE: Array<string> = ['320vp', '600vp', '840vp'];

  /**
   * The number of columns for SM device.
   */
  static readonly COLUMN_SM: number = 4;

  /**
   * The number of columns for MD device.
   */
  static readonly COLUMN_MD: number = 8;

  /**
   * The number of columns for LG device.
   */
  static readonly COLUMN_LG: number = 12;

  /**
   * The number of gutter x for device.
   */
  static readonly GUTTER_X: number = vp2px(24);

  /**
   * The number of span for SM device.
   */
  static readonly SPAN_SM: number = 4;

  /**
   * The number of span for MD device.
   */
  static readonly SPAN_MD: number = 6;

  /**
   * The number of span for LG device.
   */
  static readonly SPAN_LG: number = 8;

  /**
   * The number of offset for MD device.
   */
  static readonly OFFSET_MD: number = 1;

  /**
   * The number of offset for LG device.
   */
  static readonly OFFSET_LG: number = 2;

  /**
   * The percentage of tabs component.
   */
  static readonly TABS_WIDTH_PERCENT: string = '100%';

  /**
   * The full percentage of component.
   */
  static readonly FULL_WIDTH_PERCENT: string = '100%';

  /**
   * The percentage of list width.
   */
  static readonly LIST_WIDTH_PERCENT: string = '100%';

  /**
   * The percentage of list height.
   */
  static readonly LIST_HEIGHT_PERCENT: string = '100%';

  /**
   * The percentage of column component.
   */
  static readonly COLUMN_WIDTH_PERCENT: string = '100%';

  /**
   * The percentage of height in column component.
   */
  static readonly COLUMN_HEIGHT_PERCENT: string = '100%';

  /**
   * The percentage of width in row component.
   */
  static readonly ROW_WIDTH_PERCENT: string = '100%';

  /**
   * Tab bar height.
   */
  static readonly TAB_BAR_HEIGHT_PERCENT: string = '100%';

  /**
   * Tab height.
   */
  static readonly TAB_HEIGHT_PERCENT: string = '50%';

  /**
   * Login text.
   */
  static readonly LOGIN_TEXT: string = 'login';

  /**
   * The common utils tag.
   */
  static readonly TAG_COMMON_UTILS: string = 'CommonUtils';

  /**
   * Main page url.
   */
  static readonly MAIN_PAGE_URL: string = 'pages/MainPage';

  /**
   * Login page url.
   */
  static readonly LOGIN_PAGE_URL: string = 'pages/LoginPage';

  /**
   * Toast duration.
   */
  static readonly TOAST_DURATION: number = 3000;

  /**
   * Login page button id.
   */
  static readonly LOGIN_BUTTON_ID: string = 'loginButtonId';

  /**
   * Tablet device type.
   */
  static readonly TABLET_DEVICE_TYPE: string = 'tablet';

  /**
   * The main ability tag.
   */
  static readonly TAG_ABILITY: string = 'EntryAbility';

  /**
   * The login page tag.
   */
  static readonly TAG_LOGIN_PAGE: string = 'LoginPage';

  /**
   * The main page tag.
   */
  static readonly TAG_MAIN_PAGE: string = 'MainPage';

  /**
   * The mine page list item cell tag.
   */
  static readonly TAG_LIST_ITEM: string = 'ListItem';

  /**
   * The mine page tag.
   */
  static readonly TAG_MINE_PAGE: string = 'MinePage';

  /**
   * Title text of the home page.
   */
  static readonly HOME_TITLE: string = '首页';

  /**
   * Title text of the setting page.
   */
  static readonly MINE_TITLE: string = '我的';

  /**
   * Home tab index.
   */
  static readonly HOME_TAB_INDEX: number = 0;

  /**
   * Mine tab index.
   */
  static readonly MINE_TAB_INDEX: number = 1;

  /**
   * Swiper cache count of the number 3.
   */
  static readonly SWIPER_CACHE_COUNT: number = 3;

  /**
   * Break point sm of the tag.
   */
  static readonly SM: string = 'sm';

  /**
   * Break point md of the tag.
   */
  static readonly MD: string = 'md';

  /**
   * Break point lg of the tag.
   */
  static readonly LG: string = 'lg';

  /**
   * Width condition sm filter.
   */
  static readonly WIDTH_CONDITION_SM: string = '(320vp<=width<520vp)';

  /**
   * Width condition md filter.
   */
  static readonly WIDTH_CONDITION_MD: string = '(520vp<=width<840vp)';

  /**
   * Width condition lg filter.
   */
  static readonly WIDTH_CONDITION_LG: string = '(840vp<=width)';

}