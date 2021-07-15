package com.bs.lookify.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.bs.lookify.models.Lookify;

@Repository
public interface LookifyRepository extends CrudRepository<Lookify, Long>{
	
	// this method retrieves all the lookifys from the database
    List<Lookify> findAll();
    
    Optional<Lookify> findById(Long x);
    // this method finds lookifys with create containing the search string
    List<Lookify> findByArtistContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByTitleContaining(String search);
    // this method deletes a language that starts with a specific name
    Long deleteByTitleStartingWith(String search);
    void deleteById(Long id);
    
    List<Lookify> findTop10ByOrderByRatingDesc();
    
    Lookify save(Lookify lookify);

}
