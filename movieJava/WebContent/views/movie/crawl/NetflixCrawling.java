
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class NetflixCrawling {
	
	public NetflixCrawling() {}

	public String netflixCrawling(String search) {

		Document doc = null;
		Elements element = new Elements();

		// 4flix �˻��� ũ�Ѹ�
		String url = "https://www.4flix.co.kr/suggestions.php?stx=" + search;
		String result = "";
		
		try {
			Connection con = Jsoup.connect(url);
			doc = con.post();
			
			element = doc.select("body");
//         System.out.println(element);
			String result = "{\"movieList\":" + element.text() + "}";
//         String result1 = element.text();
//         System.out.println(result);

			JSONParser parser = new JSONParser();
			try {
				JSONObject obj = (JSONObject) parser.parse(result);
				JSONArray listArr = (JSONArray) obj.get("movieList");

				for (int i = 0; i < listArr.size(); i++) {
					JSONObject movie = (JSONObject) listArr.get(i);
					String value = (String)movie.get("value");
//               System.out.println(value); //��ȭ �ڵ�     
					url = "http://www.4flix.co.kr/board/netflix/" + value;
					con = Jsoup.connect(url);
					doc = con.get();
					
					element = doc.select("div.text-block");

						if (element.size() > 0) {
							Elements M_TITLE = new Elements();
							Elements M_SUMMARY = new Elements();
							Elements link = new Elements();
							M_TITLE = element.select("h1");
							M_SUMMARY = element.select("p");
							link = element.select("section ul button a");
							System.out.println("---" + value + "---");
							System.out.println("M_TITLE : " + M_TITLE.text());
							System.out.println("M_SUMMARY : " + M_SUMMARY.text());
							System.out.println("link : " + link.attr("title"));

							result.concat(M_TITLE.text());
							result.concat(M_SUMMARY.text());
							result.concat(link.attr("title"));
							
//							new crawlingNetfilx().crawling(link.attr("title"));
						}
					}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
