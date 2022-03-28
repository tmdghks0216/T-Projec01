package Logic;

import java.util.HashMap;

import org.json.simple.JSONObject;

import member.MemVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Trade_SNS {
	public boolean trade_SNS(String phonenum,MemVO vo) {

		String api_key = "";
		String api_secret = "";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phonenum);
		params.put("from", "01025556482");
		params.put("type", "SMS");
		params.put("text", "웹뽀중고마켓 거래 알람입니다.\r\n"
				+vo.getMphone()+"으로 연락/거래 진행바랍니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
			return true;
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
			return false;
		}
	}
}
