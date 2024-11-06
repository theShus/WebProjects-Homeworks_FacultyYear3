package http.serverSecond;

import http.response.Response;

public class HtmlResponseBack extends Response {

    private final String qod;

    public HtmlResponseBack(String qod) {
        this.qod = qod;
    }

    @Override
    public String getResponseString() {
        String response = "HTTP/1.1 200 OK\r\nContent-Type: text/json\r\nContent-Length: "+qod.length()+"\r\n\r\n";
        response += qod;

        return response;
    }
}