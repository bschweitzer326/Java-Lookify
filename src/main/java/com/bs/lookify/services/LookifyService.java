package com.bs.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.bs.lookify.models.Lookify;
import com.bs.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	// adding the lookify repository as a dependency
    private final LookifyRepository lookifyRepository;   
    public LookifyService(LookifyRepository lookifyRepository) {
        this.lookifyRepository = lookifyRepository;
    }
    
    // returns all the lookifys
    public List<Lookify> allLookifys() {
        return lookifyRepository.findAll();
    }
    // creates a lookify
    public Lookify createLookify(Lookify b) {
        return lookifyRepository.save(b);
    }
    // retrieves a lookify
    public Lookify findLookify(Long id) {
        Optional<Lookify> optionalLookify = lookifyRepository.findById(id);
        if(optionalLookify.isPresent()) {
            return optionalLookify.get();
        } else {
            return null;
        }
    }
    // update a lookify
    public Lookify updateLookify(Lookify b) {
        return lookifyRepository.save(b);
    }
    // delete a lookify
    public void deleteLookify(Long id) {
    	lookifyRepository.deleteById(id);
    }
    
    public List<Lookify> findLookifys(String query) {
		 return lookifyRepository.findByArtistContaining(query);
	 }
    
    public List<Lookify> topTenLookifys() {
    	return lookifyRepository.findTop10ByOrderByRatingDesc();
    }

    
}
