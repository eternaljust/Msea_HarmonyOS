import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from "@ohos/axios"
import { UrlConstants } from '../constants/UrlConstants'

// 全局 axios 默认值
axios.defaults.baseURL = "http://www.chongbuluo.com/"
axios.defaults.headers.common["Content-Type"] = "application/text/html; charset=utf-8"
axios.defaults.headers.common["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) " +
  "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36"

// 添加请求拦截器
axios.interceptors.request.use((config:InternalAxiosRequestConfig) => {
  // 对请求数据做点什么
  config.params.key = ""
  return config;
}, (error:AxiosError) => {
  // 对请求错误做些什么
  console.error(`axios response error: ${error}`)
  return Promise.reject(error);
});

// 添加响应拦截器
axios.interceptors.response.use((response:AxiosResponse)=> {
  // 对响应数据做点什么
  return response;
}, (error:AxiosError)=> {
  // 对响应错误做点什么
  return Promise.reject(error);
});

/**
 * 登录
 * @param loginfield 登录类型
 * @param questionid 安全提问类型
 * @param username 用户名或者邮箱
 * @param password 密码
 * @param answer 答案
 * @returns
 */
export function getLoginData(
  loginfield: string,
  questionid: string,
  username: string,
  password: string,
  answer: string
): Promise<AxiosResponse<string, null>> {
  return axios({
    url: UrlConstants.login,
    method: 'get',
    params: {
      loginfield: loginfield,
      questionid: questionid,
      username: username,
      password: password,
      answer: answer
    }
  })
}