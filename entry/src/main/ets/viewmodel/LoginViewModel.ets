import Logger from '../common/utils/Logger';
import { httpRequestGet, httpRequestPost } from '../common/utils/NetworkUtil'
import * as xpath from 'xpath';
import { DOMParser } from '@xmldom/xmldom'

class LoginViewModel {
  getData() {
    httpRequestGet('https://www.chongbuluo.com/').then((data) => {
      Logger.info('get http data success', data.data);
    }).catch((err) => {
      Logger.error('get http data failed', err.message);
    });
  }

  postData() {
    let loginfield = encodeURIComponent('username');
    let questionid = '0';
    let username = encodeURIComponent('');
    let password = encodeURI('');
    let answer = encodeURIComponent('');
    let params = `&loginfield=${loginfield}&username=${username}&questionid=${questionid}&answer=${answer}&password=${password}`;
    let url = 'https://www.chongbuluo.com/member.php?mod=logging&action=login&loginsubmit=yes' + params;

    Logger.info(url);
    httpRequestPost(url).then((data) => {
      Logger.info('post http data success', data.data);
      let dom = new DOMParser();
      let xml = (data.data as string).replace(DOCTYPE, '').replace(/\r\n/g, '')
      xml = xml.replace(xmlns, '')
      let doc = dom.parseFromString(xml, 'text/xml');
      let alertError = xpath.select('//div[@class="alert_error"]/p', doc) as Array<Node>;
      let info = xpath.select('//div[@class="info"]/li', doc) as Array<Node>;
      let myinfo = xpath.select('//div[@id="myinfo"]/p/strong/a', doc) as Array<Node>;
      Logger.info('alertError', alertError)
      Logger.info('info', info)
      Logger.info('myinfo', myinfo[0].firstChild.nodeValue)
    }).catch((err) => {
      Logger.error('post http data failed', err.message);
    });
  }
}

const DOCTYPE = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">'
const xmlns = ' xmlns="http://www.w3.org/1999/xhtml"'

export let loginViewModel: LoginViewModel = new LoginViewModel();
