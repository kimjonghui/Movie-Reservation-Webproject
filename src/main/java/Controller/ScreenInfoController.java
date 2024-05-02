package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DTO.ScreenInfoDTO;
import Service.ScreenInfoService;

@WebServlet("/ScreenInfo")
public class ScreenInfoController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String theaterName = req.getParameter("theaterName");
        String screenNumber = req.getParameter("screenNumber");
        ScreenInfoService service = new ScreenInfoService();
        try {
        	if(screenNumber == null) {
        		List<ScreenInfoDTO> screenInfoList = service.getScreenInfoList(theaterName);
        		Gson gson = new Gson();
        		String json = gson.toJson(screenInfoList);
        		resp.setContentType("application/json");
        		resp.setCharacterEncoding("UTF-8");
        		resp.getWriter().write(json);
        	} else {
        		int screenNumberInt = Integer.parseInt(screenNumber);
        		ScreenInfoDTO screenInfo = service.getScreenInfo(theaterName, screenNumberInt);
        		if (screenInfo == null) {
        			resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
        			resp.getWriter().write("No screen info found for the given parameters.");
        			return;
        		}
        		Gson gson = new Gson();
        		String json = gson.toJson(screenInfo);
        		resp.setContentType("application/json");
        		resp.setCharacterEncoding("UTF-8");
        		resp.getWriter().write(json);
        	}
        } catch(Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("An error occurred while fetching screenInfo data.");
            e.printStackTrace();
        }
    }
}
