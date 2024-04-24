import {  CommonConstants as Const } from  '../constants/CommonConstants'
import promptAction from '@ohos.promptAction';

export function showToast(msg: string | Resource) {
  promptAction.showToast({
    message: msg,
    duration: Const.MESSAGE_DURATION
  });
}
