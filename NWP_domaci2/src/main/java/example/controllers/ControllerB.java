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
public class ControllerB {

    @Autowired(verbose = true)
    private ServiceA serviceA;

    @Autowired(verbose = true)
    private ServiceB serviceB;

    @Autowired(verbose = true)
    @Qualifier("ServiceC")
    private ServiceInter serviceC;

    @Path(path = "/methodB1")
    @Get
    public void methodB1(){}

    @Path(path = "/methodB2")
    @Post
    public void methodB2(){}
}
