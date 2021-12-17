package com.stoktakip.stoktakip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class AnasayfaController {

    @GetMapping({"/"})

    public String home() {

        return "musteri_login_list";

    }

    @GetMapping({"/satistemsilcisi_login_list"})

    public String home2() {

        return "satistemsilcisi_login_list";

    }
    @GetMapping({"/musteri_list"})
    public String home3(){
        return "musteri_list";
    }
    @GetMapping({"/musteri/musteri"})
    public String home4(){
        return"musteri_anasayfa";
    }
    @GetMapping({"/satistemsilcisi_list"})
    public String home5(){
        return "satistemsilcisi_list";
    }






}