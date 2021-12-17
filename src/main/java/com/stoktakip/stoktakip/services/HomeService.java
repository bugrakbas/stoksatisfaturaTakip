package com.stoktakip.stoktakip.services;


import java.util.List;

import com.stoktakip.stoktakip.model.Home;

public interface HomeService {

    public List<Home> getAllIller();

    public Home getIllerById(int id);

    public void addIller(Home Iller);

    public void deleteIller(int id);


}