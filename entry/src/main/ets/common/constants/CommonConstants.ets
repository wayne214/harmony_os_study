/**
 * Common constants for all features.
 */
import { NewsTypeBean } from '../../viewmodel/NewsViewModel';
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

  static readonly FULL_HEIGHT_PERCENT: string = '100%';

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

  /**
   * Full the width.
   */
  static readonly FULL_WIDTH: string = '100%';

  /**
   * Full the height.
   */
  static readonly FULL_HEIGHT: string = '100%';

  /**
   * The host address of the server.
   */
  static readonly SERVER: string = 'http://192.168.200.51:9588';

  /**
   * Get the news type.
   */
  static readonly GET_NEWS_TYPE: string = 'news/getNewsType';

  /**
   * Get the news list.
   */
  static readonly GET_NEWS_LIST: string = 'news/getNewsList';

  /**
   * The request success status code.
   */
  static readonly SERVER_CODE_SUCCESS: string = 'success';

  /**
   * The off set coefficient.
   */
  static readonly Y_OFF_SET_COEFFICIENT: number = 0.1;

  /**
   * The page size.
   */
  static readonly PAGE_SIZE: number = 4;

  /**
   * The refresh and load height.
   */
  static readonly CUSTOM_LAYOUT_HEIGHT: number = 70;

  /**
   * Http request success status code.
   */
  static readonly HTTP_CODE_200: number = 200;

  /**
   * The animation delay time.
   */
  static readonly DELAY_ANIMATION_DURATION: number = 300;

  /**
   * The delay time.
   */
  static readonly DELAY_TIME: number = 1000;

  /**
   * The animation duration.
   */
  static readonly ANIMATION_DURATION: number = 2000;

  /**
   * The http timeout duration.
   */
  static readonly HTTP_READ_TIMEOUT: number = 10000;

  /**
   * The TabBars constants.
   */
  static readonly TabBars_UN_SELECT_TEXT_FONT_SIZE: number = 18;
  static readonly TabBars_SELECT_TEXT_FONT_SIZE: number = 24;
  static readonly TabBars_UN_SELECT_TEXT_FONT_WEIGHT: number = 400;
  static readonly TabBars_SELECT_TEXT_FONT_WEIGHT: number = 700;
  static readonly TabBars_BAR_HEIGHT: string = '7.2%';
  static readonly TabBars_HORIZONTAL_PADDING: string  = '2.2%';
  static readonly TabBars_BAR_WIDTH: string = '100%';
  static readonly TabBars_DEFAULT_NEWS_TYPES: Array<NewsTypeBean> = [
    { id: 0, name: '全部' },
    { id: 1, name: '国内' },
    { id: 2, name: '国际' },
    { id: 3, name: '娱乐' },
    { id: 4, name: '军事' },
    { id: 5, name: '体育' },
    { id: 6, name: '科技' },
    { id: 7, name: '财经' }
  ];

  /**
   * The NewsListConstant constants.
   */
  static readonly NewsListConstant_LIST_DIVIDER_STROKE_WIDTH: number = 0.5;
  static readonly NewsListConstant_GET_TAB_DATA_TYPE_ONE: number = 1;
  static readonly NewsListConstant_ITEM_BORDER_RADIUS: number = 16;
  static readonly NewsListConstant_NONE_IMAGE_SIZE: number = 120;
  static readonly NewsListConstant_NONE_TEXT_opacity: number = 0.6;
  static readonly NewsListConstant_NONE_TEXT_size: number = 16;
  static readonly NewsListConstant_NONE_TEXT_margin: number = 12;
  // static readonly NewsListConstant_ITEM_MARGIN_TOP: string = '1.5%';
  static readonly NewsListConstant_LIST_MARGIN_LEFT: string = '3.3%';
  static readonly NewsListConstant_LIST_MARGIN_RIGHT: string = '3.3%';
  // static readonly NewsListConstant_ITEM_HEIGHT: string = '32%';
  static readonly NewsListConstant_LIST_WIDTH: string =  '93.3%';

  /**
   * The NewsTitle constants.
   */
  static readonly NewsTitle_TEXT_FONT_SIZE: number = 20;
  static readonly NewsTitle_TEXT_FONT_WEIGHT: number = 500;
  static readonly NewsTitle_TEXT_MARGIN_LEFT: string = '2.4%';
  static readonly NewsTitle_TEXT_WIDTH: string = '78.6%';
  static readonly NewsTitle_IMAGE_MARGIN_LEFT: string = '3.5%';
  static readonly NewsTitle_IMAGE_WIDTH: string = '11.9%';

  /**
   * The NewsContent constants.
   */
  static readonly NewsContent_WIDTH: string = '93%';
  static readonly NewsContent_HEIGHT: string = '16.8%';
  static readonly NewsContent_MARGIN_LEFT: string = '3.5%';
  static readonly NewsContent_MARGIN_TOP: string = '3.4%';
  static readonly NewsContent_MAX_LINES: number = 2;
  static readonly NewsContent_FONT_SIZE: number = 15;

  /**
   * The NewsSource constants.
   */
  static readonly NewsSource_MAX_LINES: number = 1;
  static readonly NewsSource_FONT_SIZE: number = 12;
  static readonly NewsSource_MARGIN_LEFT: string = '3.5%';
  static readonly NewsSource_MARGIN_TOP: string = '3.4%';
  static readonly NewsSource_HEIGHT: string = '7.2%';
  static readonly NewsSource_WIDTH: string = '93%';

  /**
   * The NewsGrid constants.
   */
  static readonly NewsGrid_MARGIN_LEFT: string = '3.5%';
  static readonly NewsGrid_MARGIN_RIGHT: string = '3.5%';
  static readonly NewsGrid_MARGIN_TOP: string = '5.1%';
  static readonly NewsGrid_WIDTH: string = '93%';
  static readonly NewsGrid_HEIGHT: string = '31.5%';
  static readonly NewsGrid_ASPECT_RATIO: number = 4;
  static readonly NewsGrid_COLUMNS_GAP: number = 5;
  static readonly NewsGrid_ROWS_TEMPLATE: string = '1fr';
  static readonly NewsGrid_IMAGE_BORDER_RADIUS: number = 8;

  /**
   * The RefreshLayout constants.
   */
  static readonly RefreshLayout_MARGIN_LEFT: string = '40%';
  static readonly RefreshLayout_TEXT_MARGIN_BOTTOM: number = 1;
  static readonly RefreshLayout_TEXT_MARGIN_LEFT: number = 7;
  static readonly RefreshLayout_TEXT_FONT_SIZE: number = 17;
  static readonly RefreshLayout_IMAGE_WIDTH: number = 18;
  static readonly RefreshLayout_IMAGE_HEIGHT: number = 18;

  /**
   * The NoMoreLayout constants.
   */
  static readonly NoMoreLayoutConstant_NORMAL_PADDING: number = 8;
  static readonly NoMoreLayoutConstant_TITLE_FONT: string = '16fp';

  /**
   * The RefreshConstant constants.
   */
  static readonly RefreshConstant_DELAY_PULL_DOWN_REFRESH: number = 50;
  static readonly RefreshConstant_CLOSE_PULL_DOWN_REFRESH_TIME: number = 150;
  static readonly RefreshConstant_DELAY_SHRINK_ANIMATION_TIME: number = 500;

  /**
   * Grid column templates.
   */
  static readonly GRID_COLUMN_TEMPLATES: string = '1fr ';

  /**
   * List offset unit.
   */
  static readonly LIST_OFFSET_UNIT: string = 'px';

  /**
   * 设备UUID
   * @type {string}
   */
  static readonly UUID = "3e7ee30c6fc0004a773dc33b0597b5732b145c04";

  /**
   * 设备号
   * @type {string}
   */
  static readonly DEVICE_NUM = "ONEPLUS%20A6000"

}

/**
 * The refresh state enum.
 */
export const enum RefreshState {
  DropDown = 0,
  Release = 1,
  Refreshing = 2,
  Success = 3,
  Fail = 4
}

/**
 * The newsList state enum.
 */
export const enum PageState {
  Loading = 0,
  Success = 1,
  Fail = 2
}

/**
 * The request content type enum.
 */
export const enum ContentType {
  JSON = 'application/json'
}

/**
 * route for second page
 */
export const SECOND_PAGE: string = 'pages/SimpleVideoPlay';

/**
 * route param
 */
export const SOURCE: string = 'source';

/**
 * video net address
 */
export const NET: string = '网络视频地址*****';

/**
 * toast message
 */
export const MESSAGE: string = '请检查网络';

/**
 * init time of string
 */
export const START_TIME: string = '00:00';

/**
 * video net address
 */
export const ZERO_STR: string = '0';

/**
 * time split
 */
export const SPLIT: string = ':';

/**
 * default opacity
 */
export const DEFAULT_OPACITY: number = Number.parseFloat('0.2');

/**
 * slider small track thick ness
 */
export const SMALL_TRACK_THICK_NESS: number = 2;

/**
 * slider big track thick ness
 */
export const BIG_TRACK_THICK_NESS: number = 4;

/**
 * the divide of single and double
 */
export const COMMON_NUM_DOUBLE: number = 10;

/**
 * the minute of one hour
 */
export const COMMON_NUM_MINUTE: number = 60;

/**
 * common font weight
 */
export const COMMON_NUM_FONT_WEIGHT: number = 500;

/**
 * toast duration
 */
export const COMMON_NUM_DURATION: number = 5000;

/**
 * module list
 */
export const LIST: string[] = ['最近播放', '为你推荐'];

/**
 * full percent
 */
export const ALL_PERCENT: string = '100%';

/**
 * Image Size
 */
export const IMAGE_SIZE: number = 24;

/**
 * component with or height percent
 */
export const enum STRING_PERCENT {
  SLIDER_WITH = '46.7%',
  NINETY_PERCENT = '88%',
  INDEX_COMPONENT_WITH_PERCENT = '93.3%',
  INDEX_SWIPER_HEIGHT_PERCENT = '24.1%',
  INDEX_MODULE_HEIGHT_PERCENT = '22.8%',
  INDEX_SWIPER_LEFT_RIGHT_MARGIN = '3.3%'
}

/**
 * margin or font size
 */
export const enum MARGIN_FONT_SIZE {
  FIRST_MARGIN = 12,
  SECOND_MARGIN = 16,
  THIRD_MARGIN = 18,
  FOURTH_MARGIN = 24,
  FIFTH_MARGIN = 50,
  SIXTH_MARGIN = 94,
  SEVENTH_MARGIN = 132
}

/**
 * video resource type
 */
export const enum VIDEO_TYPE {
  INNER = 'inner',
  NET = 'net'
}

/**
 * Attribute Styles in a Stack Layout
 */
export const enum STACK_STYLE {
  IMAGE_Z_INDEX = 2,
  PROGRESS_VALUE = 0,
  PROGRESS_TOTAL = 100,
  PROGRESS_STROKE_WIDTH = 15,
  PROGRESS_SCALE_COUNT = 15,
  PROGRESS_SCALE_WIDTH = 5,
  PROGRESS_Z_INDEX = 1,
  PROGRESS_WIDTH = 80,
  PROGRESS_STEP = 10,
  MILLI_SECONDS = 100
}