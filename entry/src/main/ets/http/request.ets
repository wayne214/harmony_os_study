import HttpBuilder from './http'
import showToast from '../common/utils/ToastUtils'

//接口发送超时
const READ_TIMEOUT = 100000
//接口读取超时
const CONNECT_TIMEOUT = 100000

const httpClient = new HttpBuilder({
  readTimeout: READ_TIMEOUT,
  connectTimeout: CONNECT_TIMEOUT
})

export default httpClient