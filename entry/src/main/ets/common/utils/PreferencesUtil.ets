import dataPreferences from '@ohos.data.preferences';
import * as CommonConstants from  '../constants/CommonConstants'
import { showToast } from './ComponentUtil';
import Logger from './Logger';

let preferences: dataPreferences.Preferences = null;

class PreferencesUtil {
  /**
   * Read the specified Preferences persistence file and load the data into the Preferences instance.
   */
  async getPreferencesFromStorage(context: Context) {
    try {
      preferences = await dataPreferences.getPreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch (e) {
      Logger.error(`Failed to get preferences, error: ${e}`);
    }
  }

  /**
   * Deletes the specified Preferences persistence file from memory and removes the Preferences instance.
   */
  async deletePreferences(context: Context) {
    try {
      await dataPreferences.deletePreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch(e) {
      Logger.error(`Failed to delete preferences, error: ${e}`);
    };
    preferences = null;
    showToast('删除数据成功！');
  }

  /**
   * Save the data to the Preferences.
   *
   * @param {string} key - Indicates the key of the preferences to modify. It cannot be {@code null} or empty.
   * @param {ValueType} value - Indicates the value of the preferences.
   */
  async put(key: string, value: dataPreferences.ValueType) {
    try {
      await preferences.put(key, value);
      // Store the Preference instance in the preference persistence file
      await preferences.flush();
    } catch (e) {
      Logger.info(`Failed put value of '${key}'. error: ${e}`);
    }
  }

  /**
   * Get preference data.
   *
   * @param {string} key - Indicates the key of the preferences. It cannot be {@code null} or empty.
   */
  async get(key: string) {
    try {
      let value = await preferences.get(key, '');
      Logger.info(`Succeeded get value: ${value} of key: ${key}.`);
      return value
    } catch (e) {
      Logger.info(`Failed get value of '${key}'. error: ${e}`);
      return ''
    }
  }

  /**
   * Save the data to the Preferences.
   *
   * @param {string} key - Indicates the key of the preferences to modify. It cannot be {@code null} or empty.
   * @param {ValueType} value - Indicates the value of the preferences.
   */
  async delete(key: string) {
    try {
      await preferences.delete(key);
      // Store the Preference instance in the preference persistence file
      await preferences.flush();
    } catch (e) {
      Logger.info(`Failed delete value of '${key}'. error: ${e}`);
    }
  }
}

export default new PreferencesUtil();