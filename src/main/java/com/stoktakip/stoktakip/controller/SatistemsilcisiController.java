package com.stoktakip.stoktakip.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.stoktakip.stoktakip.model.Satistemsilcisi;
import com.stoktakip.stoktakip.services.SatistemsilcisiService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value="/satistemsilcisi")
public class SatistemsilcisiController{

    @Autowired
    SatistemsilcisiService satistemsilcisiService;

    @RequestMapping(value="/satistemsilcisi_login", method = RequestMethod.POST )
    public ModelAndView login(@ModelAttribute("satistemsilcisi") Satistemsilcisi satistemsilcisi , HttpServletResponse response, HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        List<Satistemsilcisi> satistemsilcileri = satistemsilcisiService.getAllSatistemsilcisi();
        for(Satistemsilcisi satistemsilcisi1 : satistemsilcileri){
            if(satistemsilcisi1.getKullaniciadi().equals(satistemsilcisi.getKullaniciadi()) && satistemsilcisi1.getSifre().equals(satistemsilcisi.getSifre())) {
                model.addObject("satistemsilcisi", satistemsilcisi1);
                Cookie cookie = new Cookie("satistemsilcisi", satistemsilcisi.getKullaniciadi());
                cookie.setMaxAge(7 * 24 * 60 * 60); // expires in 7 days
                response.addCookie(cookie);
                request.getSession().setAttribute("adi", satistemsilcisi.getKullaniciadi());

                model.setViewName("satistemsilcisi_anasayfa");
                return model;
            }
        }
        model.setViewName("redirect:/satistemsilcisi/satistemsilcisi_login");
        return model;
    }

    @RequestMapping(value = "/satistemsilcisi_login", method = RequestMethod.GET)
    public ModelAndView loginPage(){
        ModelAndView model = new ModelAndView("satistemsilcisi_login");
        return model;
    }
    @GetMapping({"/musteri/musteri"})
    public String home4(){
        return"musteri_anasayfa";
    }

    @RequestMapping(value="/list", method=RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView model = new ModelAndView("satistemsilcisi_list"); //
        List<Satistemsilcisi> satistemsilcisiList = satistemsilcisiService.getAllSatistemsilcisi();
        model.addObject("satistemsilcisiList", satistemsilcisiList);

        return model;
    }



    @RequestMapping(value="/addSatistemsilcisi/", method=RequestMethod.GET)
    public ModelAndView addSatistemsilcisi() {

        ModelAndView model = new ModelAndView();
        Satistemsilcisi satistemsilcisi = new Satistemsilcisi();
        model.addObject("satistemsilcisiForm", satistemsilcisi);
        model.setViewName("satistemsilcisi_form");

        return model;
    }



    @RequestMapping(value="/editSatistemsilcisi/{id}", method=RequestMethod.GET)
    public ModelAndView editSatistemsilcisi(@PathVariable int id) {
        ModelAndView model = new ModelAndView();

        Satistemsilcisi satistemsilcisi = satistemsilcisiService.getSatistemsilcisiById(id);
        model.addObject("satistemsilcisiForm", satistemsilcisi);
        model.setViewName("satistemsilcisi_form");

        return model;
    }


    @RequestMapping(value="/addSatistemsilcisi", method=RequestMethod.POST)
    public ModelAndView add(@ModelAttribute("satistemsilcisiForm") Satistemsilcisi satistemsilcisi) {

        satistemsilcisiService.addSatistemsilcisi(satistemsilcisi);
        return new ModelAndView("redirect:/satistemsilcisi/list");

    }

    @RequestMapping(value="/deleteSatistemsilcisi/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") int id) {

        satistemsilcisiService.deleteSatistemsilcisi(id);
        return new ModelAndView("redirect:/satistemsilcisi/list");

    }



}