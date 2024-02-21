/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import ItemData from './ItemData';
import {
  SWIPER_IMAGES,
  CENTER_GRID_DATA,
  LIST_IMAGE_DATA,
  MINE_LIST_DATA
} from '../common/data/SourceData';

/**
 * Binds data to components and provides interfaces.
 */
export class MainViewModel2 {
  tabTitle = [
    {
      index: 0,
      title: "首页",
      imageActivated: $r('app.media.icon_sel_home'),
      imageOriginal: $r('app.media.icon_unsel_home')
    },
    {
      index: 1,
      title: "发现",
      imageActivated: $r('app.media.icon_sel_find'),
      imageOriginal: $r('app.media.icon_unsel_find')
    },
    {
      index: 2,
      title: "热门",
      imageActivated: $r('app.media.icon_sel_hot'),
      imageOriginal: $r('app.media.icon_unsel_hot')
    },
    {
      index: 3,
      title: "我的",
      imageActivated: $r('app.media.icon_sel_mine'),
      imageOriginal: $r('app.media.icon_unsel_mine')
    }
  ]
}

export default new MainViewModel2();