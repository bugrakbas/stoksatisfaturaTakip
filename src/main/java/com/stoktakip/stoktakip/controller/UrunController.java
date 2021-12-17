package com.stoktakip.stoktakip.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.stoktakip.stoktakip.model.Urun;
import com.stoktakip.stoktakip.services.UrunService;

@Controller
@RequestMapping(value="/urun")
public class UrunController{

    @Autowired
    UrunService urunService;


    @RequestMapping(value="/list", method=RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("urun_list"); //.jsp yazılmayacak
        List<Urun> urunList = urunService.getAllUrun();
        model.addObject("urunList", urunList);

        return model;
    }
    @GetMapping({"/musteri/musteri"})
    public String home4(){
        return"musteri_anasayfa";
    }


    @RequestMapping(value="/addUrun/", method=RequestMethod.GET)
    public ModelAndView addUrun() {

        ModelAndView model = new ModelAndView();
        Urun urun = new Urun();
        model.addObject("urunForm", urun);
        model.setViewName("urun_form");

        return model;
    }



    @RequestMapping(value="/editUrun/{id}", method=RequestMethod.GET)
    public ModelAndView editUrun(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

       Urun urun = urunService.getUrunById(id);
        model.addObject("urunForm", urun);
        model.setViewName("urun_form");

        return model;
    }


    @RequestMapping(value="/addUrun", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("urunForm") Urun urun) {

        urunService.addUrun(urun);
        return new ModelAndView("redirect:/urun/list");

    }

    @RequestMapping(value="/deleteUrun/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        urunService.deleteUrun(id);
        return new ModelAndView("redirect:/urun/list");

    }



}