package plan.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import plan.dao.IPlanDao;
import plan.dao.PlanDaoImpl;
import plan.service.IPlanService;
import plan.service.PlanServiceImpl;
import plan.vo.CombinePlanVO;

@WebServlet("/plan/insert.do")
public class InsertController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 요청으로부터 JSON 데이터를 읽어옵니다.
            StringBuilder sb = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }

            // JSON 데이터 파싱
            JSONParser parser = new JSONParser();
            JSONObject jsonData = (JSONObject) parser.parse(sb.toString());

            
            // 시작날짜 종료날짜 인서트 전역 변수 선언.
            String startDate = null;
            String endDate = null;
            String planTitle = null;
            
            CombinePlanVO insert = new CombinePlanVO();
            
            // 'content' 키 처리
            JSONObject content = (JSONObject) jsonData.get("content");
            if (content != null) {
                planTitle = (String) content.get("planTitle");
                startDate = (String) content.get("startDate");
                endDate = (String) content.get("endDate");
                String memId = (String)content.get("memId");
                System.out.println("Plan Title: " + planTitle);
                System.out.println("Start Date: " + startDate);
                System.out.println("End Date: " + endDate);
                System.out.println("Member Id " + memId);
                
                insert.setPlan_title(planTitle);
                insert.setMem_id(memId); // 이 부분은 필요에 따라 조정
                
            }
            
            
            List<CombinePlanVO> detailList = new ArrayList<>();

            // 키값을 꺼낸다.
            Set<String> keys = jsonData.keySet();
            for (String key : keys) {
            	//
                if (key.startsWith("Day")) {
                    String dayNumber = key.substring(4);
                    JSONArray placesArray = (JSONArray) jsonData.get(key);

                    for (Object placeObj : placesArray) {
                        JSONObject place = (JSONObject) placeObj; 
                        String name = (String) place.get("name");
                        String latitude =  (String) place.get("latitude");
                        String longitude =  (String) place.get("longitude");
                        String cityname = (String) place.get("cityname");

                        System.out.println("Day: " + dayNumber);
                        System.out.println("Place Name: " + name);
                        System.out.println("Latitude: " + latitude);
                        System.out.println("Longitude: " + longitude);
                        System.out.println("City Name: " + cityname);
                        System.out.println();
                        
                        
                        CombinePlanVO insertDetail = new CombinePlanVO();

                        insertDetail.setPlan_date_day(Integer.parseInt(dayNumber));
                        insertDetail.setPlan_date_start(startDate);
                        insertDetail.setPlan_date_end(endDate);
                        insertDetail.setPlan_area_name(name);
                        insertDetail.setPlan_area_lati(Double.parseDouble(latitude));
                        insertDetail.setPlan_area_long(Double.parseDouble(longitude));
                        insertDetail.setCity_name(cityname);

                        detailList.add(insertDetail);
                        
                    }
                }
            }
            
            IPlanService service = PlanServiceImpl.getInstance();
            service.planInsertWithDetails(insert, detailList);

            //브라우저 도큐먼트 콘솔창 성공 메세지 출력
            response.getWriter().write("성공");
            response.sendRedirect(request.getContextPath() + "/plan/list.do");

        } catch (ParseException e) {
            // 파싱 오류 처리
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid JSON data");
        }
    }
}
