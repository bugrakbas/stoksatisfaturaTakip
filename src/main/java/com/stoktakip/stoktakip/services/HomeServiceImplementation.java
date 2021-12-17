package com.stoktakip.stoktakip.services;


import java.util.List;

import com.stoktakip.stoktakip.model.Home;
import com.stoktakip.stoktakip.repository.HomeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
class IllerServiceImplementation implements HomeService {

    @Autowired
    HomeRepository illerRepository;


    @Override
    public List<Home> getAllIller() { return (List<Home>) illerRepository.findAll();}

    @Override
    public Home getIllerById(int id) {
        return illerRepository.findById(id).get();
    }

    @Override
    public void addIller(Home iller) {
        illerRepository.save(iller);
    }

    @Override
    public void deleteIller(int id) {
        illerRepository.deleteById(id);
    }


}