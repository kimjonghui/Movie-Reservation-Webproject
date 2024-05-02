package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DTO.MovieDTO;
import Service.MovieService;

@WebServlet("/Movie")
public class MovieController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title"); // 클라이언트로부터 제목을 동적으로 받음
        MovieService service = new MovieService();
        try {
            MovieDTO movie = service.getMovie(title);
            Gson gson = new Gson();
            String json = gson.toJson(movie);
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
}