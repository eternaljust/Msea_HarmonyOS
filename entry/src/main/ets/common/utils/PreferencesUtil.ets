import dataPreferences from '@ohos.data.preferences';
import * as CommonConstants from  '../constants/CommonConstants'
import { showToast } from './ComponentUtil';
import Logger from './Logger';

let context = getContext(this);
let preferences: dataPreferences.Preferences = null;

class PreferencesUtil {
  /**
   * Read the specified Preferences persistence file and load the data into the Preferences instance.
   */
  async getPreferencesFromStorage() {
    try {
      preferences = await dataPreferences.getPreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch (err) {
      Logger.error(`Failed to get preferences, Cause: ${err.message}`);
    }
  }

  /**
   * Deletes the specified Preferences persistence file from memory and removes the Preferences instance.
   */
  async deletePreferences() {
    try {
      await dataPreferences.deletePreferences(context, CommonConstants.PREFERENCES_NAME);
    } catch(err) {
      Logger.error(`Failed to delete preferences, Cause: ${err.message}`);
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
    if (preferences === null) {
      await this.getPreferencesFromStorage();
    }
    try {
      let promise = preferences.put(key, value);
      promise.then(() => {
        Logger.info(`Succeeded in put value: ${value} of key: ${key}.`);
        // Store the Preference instance in the preference persistence file
        try {
          let promise = preferences.flush();
          promise.then(() => {
            Logger.info(`Succeeded in flush value: ${value} of key: ${key}.`);
          }).catch((err) => {
            Logger.info("Failed to flush. code =" + err.code + ", message =" + err.message);
          })
        } catch (err) {
          Logger.info("Failed to flush. code =" + err.code + ", message =" + err.message);
        }
      }).catch((err) => {
        Logger.info(`Failed to put value of '${key}'. code =` + err.code + ', message =' + err.message);
      })
    } catch(err) {
      Logger.info(`Failed to put value of '${key}'. code =` + err.code + ', message =' + err.message);
    }
  }

  /**
   * Get preference data.
   *
   * @param {string} key - Indicates the key of the preferences. It cannot be {@code null} or empty.
   */
  async get(key: string) {
    let value: dataPreferences.ValueType;
    if (preferences === null) {
      await this.getPreferencesFromStorage();
    }
    try {
      value = await preferences.get(key, '');
      Logger.info(`Succeeded in get value: ${value} of key: ${key}.`);
    } catch (err) {
      Logger.info(`Failed to get value of '${key}'. code =` + err.code + ', message =' + err.message);
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
    if (preferences === null) {
      await this.getPreferencesFromStorage();
    }
    try {
      await preferences.delete(key);
    } catch (err) {
      Logger.info(`Failed delete put value of '${key}'. code =` + err.code + ', message =' + err.message);
    }
    // Store the Preference instance in the preference persistence file
    await preferences.flush();
  }
}

export default new PreferencesUtil();