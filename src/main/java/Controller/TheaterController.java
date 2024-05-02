package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DTO.TheaterDTO;
import Service.TheaterService;

@WebServlet("/Theater")
public class TheaterController extends HttpServlet {
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 서비스 객체를 선언
        TheaterService service = null;
        try {
            // 서비스 객체를 생성
            service = new TheaterService();
            // 서비스를 통해 영화관 데이터를 가져옴
            List<TheaterDTO> theaterList;
            // 서비스를 통해 모든 영화관 데이터를 가져옴
            theaterList = service.getAllTheaters();
            // theaterList를 JSON 형식으로 변환
            Gson gson = new Gson();
            String json = gson.toJson(theaterList);
            // JSON 형식의 데이터를 응답으로 전송
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
        } catch (Exception e) {
            // 예외 발생 시 예외를 적절히 처리하고 오류 응답을 반환
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("An error occurred while fetching theater data.");
            e.printStackTrace();
        }
    }
}
