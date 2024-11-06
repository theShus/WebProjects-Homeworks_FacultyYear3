package rs.raf.demo;

import java.io.*;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    private String password;
    private static final String [] days = {"monday", "tuesday", "wednesday", "thursday", "friday"};

    private List<String> mondayFood = new ArrayList<>();
    private List<String> tuesdayFood = new ArrayList<>();
    private List<String> wednesdayFood = new ArrayList<>();
    private List<String> thursdayFood = new ArrayList<>();
    private List<String> fridayFood = new ArrayList<>();

    public static Map<String, Integer> mondayAmount = new HashMap<>();
    public static Map<String, Integer> tuesdayAmount = new HashMap<>();
    public static Map<String, Integer> wednesdayAmount = new HashMap<>();
    public static Map<String, Integer> thursdayAmount = new HashMap<>();
    public static Map<String, Integer> fridayAmount = new HashMap<>();

    private final CopyOnWriteArrayList<HttpSession> sessions = new CopyOnWriteArrayList<>();


    // Promenljive u servletu nisu thread safe!

    public HelloServlet() {
        System.out.println("Constructor");
    }

    public void init() {
        System.out.println("init method");
        try {
            loadTxtFiles();
        } catch (URISyntaxException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("service method");
        super.service(req, resp);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("doGet method");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();



        if(request.getParameter("pass") != null && request.getParameter("pass").equalsIgnoreCase(password)) {
            out.println("<h3>Total meals:<h3>");

            for(String food: mondayAmount.keySet()) out.print("<p>Monday: " + food + ": " + mondayAmount.get(food) + "</p>");
            for(String food: tuesdayAmount.keySet()) out.print("<p>Monday: " + food + ": " + tuesdayAmount.get(food) + "</p>");
            for(String food: wednesdayAmount.keySet()) out.print("<p>Monday: " + food + ": " + wednesdayAmount.get(food) + "</p>");
            for(String food: thursdayAmount.keySet()) out.print("<p>Monday: " + food + ": " + thursdayAmount.get(food) + "</p>");
            for(String food: fridayAmount.keySet()) out.print("<p>Monday: " + food + ": " + fridayAmount.get(food) + "</p>");

            out.print("<p />");
            out.println("<form action=\"/hello-servlet\" method=\"post\"><input type=\"submit\" name=\"delete\" value=\"Obrisi\" /></form>");
        }
        else if(request.getSession().getAttribute("monday") != null) {
            out.println("<h1>You have selected the next meals:</h1>");
            out.printf("<p>Monday: %s</p>%n", request.getSession().getAttribute(days[0]));
            out.printf("<p>Tuesday: %s</p>%n", request.getSession().getAttribute(days[1]));
            out.printf("<p>Wednesday: %s</p>%n", request.getSession().getAttribute(days[2]));
            out.printf("<p>Thursday: %s</p>%n", request.getSession().getAttribute(days[3]));
            out.printf("<p>Friday: %s</p>", request.getSession().getAttribute(days[4]));
        } 
        else {
            out.println("<html><body>");
            out.println("<h1>" + "Select your meals for the next week" + "</h1>");
            out.println("<form action=\"/hello-servlet\" method=\"post\">");//form open

            out.println(" <label> Monday:</label>");
            out.println("<select name=\"monday\">");
            for (String s : mondayFood) {
                out.println("<option value=\"" + s + "\">" + s + "</option>");
            }
            out.println("</select> <p/>");

            out.println(" <label> Tuesday:</label>");
            out.println("<select name=\"tuesday\">");
            for (String s : tuesdayFood) {
                out.println("<option value=\"" + s + "\">" + s + "</option>");
            }
            out.println("</select> <p/>");

            out.println(" <label> Wednesday:</label>");
            out.println("<select name=\"wednesday\">");
            for (String s : wednesdayFood) {
                out.println("<option value=\"" + s + "\">" + s + "</option>");
            }
            out.println("</select> <p/>");

            out.println(" <label> Thursday:</label>");
            out.println("<select name=\"thursday\">");
            for (String s : thursdayFood) {
                out.println("<option value=\"" + s + "\">" + s + "</option>");
            }
            out.println("</select> <p/>");

            out.println(" <label> Friday:</label>");
            out.println("<select name=\"friday\">");
            for (String s : fridayFood) {
                out.println("<option value=\"" + s + "\">" + s + "</option>");
            }
            out.println("</select> <p/>");
            out.println("<input type=\"submit\" name=\"submit\" value=\"submit\"> </input> </form>");//form close
            out.println("</body></html>");
        }
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("delete") != null){
            clearOldData();
        }
        else {
            if (checkFilled(request)){
                response.getOutputStream().println("You need to select food for all days");
                response.setStatus(403);
            }
            setValues(request);

            sessions.add(request.getSession());

            if (mondayAmount.containsKey(request.getParameter(days[0]))) {
                mondayAmount.put(request.getParameter(days[0]), mondayAmount.get(request.getParameter(days[0])) + 1);
            } else mondayAmount.put(request.getParameter(days[0]), 1);

            if (tuesdayAmount.containsKey(request.getParameter(days[1]))) {
                tuesdayAmount.put(request.getParameter(days[1]), tuesdayAmount.get(request.getParameter(days[1])) + 1);
            } else tuesdayAmount.put(request.getParameter(days[1]), 1);

            if (wednesdayAmount.containsKey(request.getParameter(days[2]))) {
                wednesdayAmount.put(request.getParameter(days[2]), wednesdayAmount.get(request.getParameter(days[2])) + 1);
            } else wednesdayAmount.put(request.getParameter(days[2]), 1);

            if (thursdayAmount.containsKey(request.getParameter(days[3]))) {
                thursdayAmount.put(request.getParameter(days[3]), thursdayAmount.get(request.getParameter(days[3])) + 1);
            } else thursdayAmount.put(request.getParameter(days[3]), 1);

            if (fridayAmount.containsKey(request.getParameter(days[4]))) {
                fridayAmount.put(request.getParameter(days[4]), fridayAmount.get(request.getParameter(days[4])) + 1);
            } else fridayAmount.put(request.getParameter(days[4]), 1);

            response.sendRedirect("/hello-servlet");
        }
    }

    public void destroy() {
        System.out.println("destroy method");
    }

    private void loadTxtFiles() throws URISyntaxException, IOException {
        Path ponP = Path.of("C:\\Users\\Shus\\Desktop\\v4\\src\\main\\resources\\ponedeljak.txt");
        Path utoP = Path.of("C:\\Users\\Shus\\Desktop\\v4\\src\\main\\resources\\utorak.txt");
        Path sreP = Path.of("C:\\Users\\Shus\\Desktop\\v4\\src\\main\\resources\\sreda.txt");
        Path cetP = Path.of("C:\\Users\\Shus\\Desktop\\v4\\src\\main\\resources\\cetvrtak.txt");
        Path petP = Path.of("C:\\Users\\Shus\\Desktop\\v4\\src\\main\\resources\\petak.txt");
        Path passP = Path.of("C:\\Users\\Shus\\Desktop\\v4\\src\\main\\resources\\password.txt");

        BufferedReader bufferedReader = new BufferedReader(new FileReader(passP.toString()));

        Stream<String> ponLines = Files.lines(ponP);
        Stream<String> utoLines = Files.lines(utoP);
        Stream<String> sreLines = Files.lines(sreP);
        Stream<String> cetLines = Files.lines(cetP);
        Stream<String> petLines = Files.lines(petP);

        this.mondayFood = ponLines.collect(Collectors.toList());
        this.tuesdayFood = utoLines.collect(Collectors.toList());
        this.wednesdayFood = sreLines.collect(Collectors.toList());
        this.thursdayFood = cetLines.collect(Collectors.toList());
        this.fridayFood = petLines.collect(Collectors.toList());
        this.password = bufferedReader.readLine().trim();
    }

    private void clearOldData(){
        for (HttpSession httpSession : sessions)
            httpSession.invalidate();

        mondayAmount.clear();
        tuesdayAmount.clear();
        wednesdayAmount.clear();
        thursdayAmount.clear();
        fridayAmount.clear();
    }

    private boolean checkFilled(HttpServletRequest request){
        for (String day: days) {
            if (request.getParameter(day) == null || request.getParameter(day).equals(""))
                System.out.println(day + " nam pravi problem");
                return false;
        }
        return true;
    }

    private void setValues(HttpServletRequest request){
        for (String day: days)
            request.getSession().setAttribute(day, request.getParameter(day));
    }

    private void printDays( PrintWriter out ) {
        for (String day : days) {
            out.println("<select name=\""+ day + "\">");
            for (String s : mondayFood) {
                out.println("<option value=\"" + s + "\">" + s + "</option>");
            }
            out.println("</select> <p/>");
        }
    }
}
