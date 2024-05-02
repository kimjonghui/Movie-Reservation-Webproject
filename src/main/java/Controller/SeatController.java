package Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.google.gson.*;

import DTO.SeatDTO;
import Service.SeatService;

@WebServlet("/Seat")
public class SeatController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userID = req.getParameter("userID");
		String theaterName = req.getParameter("theaterName");
		String screenNumber = req.getParameter("screenNumber");
		int screenNumberInt = 999;
	    if (screenNumber != null && !screenNumber.isEmpty()) {
	        screenNumberInt = Integer.valueOf(screenNumber);
	    }
		String time = req.getParameter("time");
		SeatService service = new SeatService();
		try {
			List<SeatDTO> seatList;
			if (userID != null) {
				seatList = service.getSeatListWithUserID(userID);
			} else if(time.equals("Alltime")) {
				seatList = service.getSeatListWithoutTime(theaterName,screenNumberInt);
			} else {
				seatList = service.getSeatList(theaterName,screenNumberInt,time);
				if(seatList.size() == 0) { // List가 비어있을 경우
					service.addFakeData(theaterName, screenNumberInt, time);
					seatList = service.getSeatList(theaterName, screenNumberInt, time);
				}
			}
			Gson gson = new Gson();
			String json = gson.toJson(seatList);
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().write(json);
			System.out.println(json);
		} catch(Exception e) {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("An error occurred while fetching movie data.");
            e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    // 클라이언트에서 전송한 데이터 추출
	    String theaterName = req.getParameter("theaterName");
	    int screenNumber = Integer.parseInt(req.getParameter("screenNumber"));
	    String time = req.getParameter("time");
	    String seatInfo = req.getParameter("seatInfo");
	    String userID = req.getParameter("userID");
	    // 좌석 정보 처리
	    SeatService seatService = new SeatService();
	    String[] seatsArray = seatInfo.split(" ");
	    for (String seat : seatsArray) {
	        String[] parts = seat.split("-");
	        if (parts.length == 2) {
	            String row = parts[0]; // 행 추출
	            String column = parts[1]; // 열 추출
	            seatService.insert(theaterName, screenNumber, row, column, "booked", time, userID);
	        } else {
	            // 유효하지 않은 좌석 형식 처리
	            System.out.println("Invalid seat format: " + seat);
	        }
	        System.out.println("success");
	    }

	    // 클라이언트에게 응답 전송
	    resp.setContentType("text/plain");
	    resp.setCharacterEncoding("UTF-8");
	    resp.getWriter().write("success");
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StringBuilder sb = new StringBuilder();
		String line;
		try (BufferedReader reader = req.getReader()) {
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
		}
		JSONObject json = new JSONObject(sb.toString());
		System.out.println(json.toString());
		String theaterName = json.getString("theaterName");
		String screenNumber = json.getString("screenNumber");
		String time = json.getString("time");
		String row = json.getString("row");
		String column = json.getString("column");
        int screenNumberInt = 999;
        if (screenNumber != null && !screenNumber.isEmpty()) {
        	screenNumberInt = Integer.valueOf(screenNumber);
        }
        
        System.out.println(theaterName + screenNumber + time + row + column);
        
        SeatService seatService = new SeatService();
        
        seatService.delete(theaterName, screenNumberInt, row, column, time);
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("success");
	}

}