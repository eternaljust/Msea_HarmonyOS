import dataPreferences from '@ohos.data.preferences';
import promptAction from '@ohos.promptAction';
import * as CommonConstants from  '../constants/CommonConstants'
import Logger from './Logger';

let context = getContext(this);
let preference: dataPreferences.Preferences = null;

class PreferencesUtil {
  /**
   * Read the specified Preferences persistence file and load the data into the Preferences instance.
   */
  async getPreferencesFromStorage() {
    try {
      preference = await dataPreferences.getPreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch (err) {
      Logger.error(`Failed to get preferences, Cause: ${err}`);
    }
  }

  /**
   * Deletes the specified Preferences persistence file from memory and removes the Preferences instance.
   */
  async deletePreferences() {
    try {
      await dataPreferences.deletePreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch(err) {
      Logger.error(`Failed to delete preferences, Cause: ${err}`);
    };
    preference = null;
    this.showToastMessage('删除数据成功！');
  }

  /**
   * Save the data to the Preferences.
   *
   * @param {string} key - Indicates the key of the preferences to modify. It cannot be {@code null} or empty.
   * @param {ValueType} value - Indicates the value of the preferences.
   */
  async put(key: string, value: dataPreferences.ValueType) {
    if (preference === null) {
      await this.getPreferencesFromStorage();
    }
    try {
      await preference.put(key, value);
    } catch (err) {
      Logger.error(`Failed to put value, Cause: ${err}`);
    }
    // Store the Preference instance in the preference persistence file
    await preference.flush();
  }

  /**
   * Get preference data.
   *
   * @param {string} key - Indicates the key of the preferences. It cannot be {@code null} or empty.
   */
  async get(key: string) {
    let value: dataPreferences.ValueType;
    if (preference === null) {
      await this.getPreferencesFromStorage();
    }
    try {
      value = await preference.get(key, '');
    } catch (err) {
      Logger.error(`Failed to get value, Cause: ${err}`);
    }
    return value;
  }

  /**
   * Save the data to the Preferences.
   *
   * @param {string} key - Indicates the key of the preferences to modify. It cannot be {@code null} or empty.
   * @param {ValueType} value - Indicates the value of the preferences.
   */
  async delete(key: string) {
    if (preference === null) {
      await this.getPreferencesFromStorage();
    }
    try {
      await preference.delete(key);
    } catch (err) {
      Logger.error(`Failed to delete value, Cause: ${err}`);
    }
    // Store the Preference instance in the preference persistence file
    await preference.flush();
  }

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

export default new PreferencesUtil();