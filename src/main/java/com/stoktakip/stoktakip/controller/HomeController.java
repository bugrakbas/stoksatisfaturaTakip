package com.stoktakip.stoktakip.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.stoktakip.stoktakip.model.Home;
import com.stoktakip.stoktakip.services.HomeService;

@Controller
@RequestMapping(value="/iller")
public class HomeController{

    @Autowired
    HomeService illerService;


    @RequestMapping(value="/list", method=RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("iller_list"); //.jsp yazılmayacak
        List<Home> illerList = illerService.getAllIller();
        model.addObject("illerList", illerList);

        return model;
    }



    @RequestMapping(value="/addIller/", method=RequestMethod.GET)
    public ModelAndView addIller() {

        ModelAndView model = new ModelAndView();
        Home iller = new Home();
        model.addObject("illerForm", iller);
        model.setViewName("iller_form");

        return model;
    }



    @RequestMapping(value="/editIller/{id}", method=RequestMethod.GET)
    public ModelAndView editIller(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Home iller = illerService.getIllerById(id);
        model.addObject("illerForm", iller);
        model.setViewName("iller_form");

        return model;
    }


    @RequestMapping(value="/addIller", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("illerForm") Home iller) {

        illerService.addIller(iller);
        return new ModelAndView("redirect:/iller/list");

    }

    @RequestMapping(value="/deleteIller/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        illerService.deleteIller(id);
        return new ModelAndView("redirect:/iller/list");

    }



}