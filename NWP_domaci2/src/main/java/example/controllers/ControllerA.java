package example.controllers;

import framework.annotations.Controller;
import framework.annotations.Get;
import framework.annotations.Path;
import framework.annotations.Post;
import framework.annotations.Autowired;
import framework.annotations.Qualifier;
import example.services.ServiceA;
import example.services.ServiceB;
import example.services.ServiceInter;

@Controller
public class ControllerA {

    @Autowired(verbose = true)
    private ServiceA serviceA;

    @Autowired(verbose = true)
    private ServiceB serviceB;

    @Autowired(verbose = true)
    @Qualifier("ServiceC")
    private ServiceInter serviceC;

    @Path(path = "/methodA1")
    @Get
    public void methodA1(){}

    @Path(path = "/methodA2")
    @Post
    public void methodA2(){}
}
