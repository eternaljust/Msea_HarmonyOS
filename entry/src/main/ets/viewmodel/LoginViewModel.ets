import Logger from '../common/utils/Logger';
import xpath from 'xpath';
import { DOMParser } from '@xmldom/xmldom'
import { getLoginData } from '../common/utils/AxiosApi';
import { LoginFieldItem, LoginQuestionItem } from '../model/LoginModel';

class LoginViewModel {
  fieldItems: LoginFieldItem[] = [LoginFieldItem.USERNAME, LoginFieldItem.EMAIL];
  questionItems: LoginQuestionItem[] = LoginQuestionItem.allCases();

  async login(
    loginfield: string,
    questionid: string,
    username: string,
    password: string,
    answer: string
  ): Promise<[boolean, string]> {
    try {
      let data = await getLoginData(loginfield, questionid, username, password, answer);
      let html = data.data as string;
      Logger.info(data.data);
      let dom = new DOMParser();
      let xml = html.replace(DOCTYPE, '').replace(/\r\n/g, '');
      xml = xml.replace(xmlns, '');
      let doc = dom.parseFromString(xml, 'text/xml');

      if (html.includes('欢迎您回来')) {
        let myinfo = xpath.select('//div[@id="myinfo"]/p/strong/a', doc) as Array<Node>;
        let lv = myinfo[0].firstChild?.nodeValue ?? '';
        let name = myinfo[1].firstChild?.nodeValue ?? '';
        let message = `欢迎您回来，${lv} ${name}`;
        Logger.debug('mesa myinfo', message);
        return [true, message];
      } else {
        let alertError = xpath.select('//div[@class="alert_error"]/p', doc, true);
        if (xpath.isNodeLike(alertError)) {
          let value = alertError.firstChild?.nodeValue ?? '';
          Logger.debug('mesa alert', value);
          return [false, value];
        } else {
          let info = xpath.select('//div[@class="info"]/li', doc, true);
          if (xpath.isNodeLike(info)) {
            let value = info.firstChild?.nodeValue ?? '';
            Logger.debug('mesa info', value);
            return [false, value];
          } else {
            return [false, '数据解析异常'];
          }
        }
      }
    } catch (error) {
      Logger.error(error.message);
      return [false, error.message]
    }
  }
}

const DOCTYPE = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
const xmlns = ' xmlns="http://www.w3.org/1999/xhtml"'

export let loginViewModel: LoginViewModel = new LoginViewModel();
