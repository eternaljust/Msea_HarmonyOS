import * as CommonConstants from  '../constants/CommonConstants'
import promptAction from '@ohos.promptAction';

class ComponentUtil {
  /**
   * Popup window prompt message.
   *
   * @param message Prompt message.
   */
  showToastMessage(message: string | Resource) {
    promptAction.showToast({
      message: message,
      duration: CommonConstants.MESSAGE_DURATION
    });
  };
}

export default new ComponentUtil();