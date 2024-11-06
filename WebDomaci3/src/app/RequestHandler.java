package app;

import http.HttpMethod;
import http.Request;
import http.response.Response;
import http.serverMain.Server;

public class RequestHandler {
    public Response handle(Request request) throws Exception {
        if (request.getPath().equals("/quote") && request.getHttpMethod().equals(HttpMethod.GET)) {
            return (new QuoteController(request)).doGet();
        } else if (request.getPath().equals("/save-quote") && request.getHttpMethod().equals(HttpMethod.POST)) {
            return (new QuoteController(request)).doPost();
        }

        throw new Exception("Page: " + request.getPath() + ". Method: " + request.getHttpMethod() + " not foundd!");
    }
}
