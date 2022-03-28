package Logic;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Certified_SNS {
	public void certified_sns(String phone,String key) {

		String api_key = "";
		String api_secret = "";
		Message coolsms = new Message(api_key, api_secret);
		

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone);
		params.put("from", "01025556482");
		params.put("type", "SMS");
		params.put("text", "안녕하세요, 웹뽀 중고마켓입니다.\r\n"
         		+ "인증번호는 "+key+"입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}
