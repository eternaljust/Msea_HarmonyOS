import { CommonConstants } from  '../constants/CommonConstants'
import promptAction from '@ohos.promptAction';

export function showToast(msg: string | Resource) {
  promptAction.showToast({
    message: msg,
    duration: CommonConstants.MESSAGE_DURATION
  });
}
