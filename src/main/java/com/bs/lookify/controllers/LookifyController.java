package com.bs.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bs.lookify.models.Lookify;
import com.bs.lookify.services.LookifyService;

@Controller
public class LookifyController {
	private final LookifyService lookifyService;
	
	 public LookifyController(LookifyService lookifyService) {
	        this.lookifyService = lookifyService;
	    }	
//==================================
//		root page
//==================================

	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
//==================================
//	dashboard page
//==================================	
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Lookify> looks = lookifyService.allLookifys();
        model.addAttribute("look", looks);
		return "dashboard.jsp";
	}
	
//==================================
//	 new page
//==================================	
	
	@RequestMapping("/songs/new")
	public String newSongs(@ModelAttribute("lookify") Lookify lookify, Model model) {
        model.addAttribute("look", new Lookify());
		return "new.jsp";
	}
	
	@RequestMapping(value="/songs/create", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result) {
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
        	lookifyService.createLookify(lookify);
            return "redirect:/dashboard";
        }
    } 

//==================================
//	 show page
//==================================
    
    @RequestMapping("/songs/{id}")
    public String show(@PathVariable("id")Long id, Model model) {
    	model.addAttribute("song", lookifyService.findLookify(id));
        return "showlook.jsp";
    }
    
	@RequestMapping("/search/topten")
	public String topTen(Model model) {
        model.addAttribute("ten", lookifyService.topTenLookifys());
		return "topten.jsp";
	}
    
//==================================
//	 delete page
//==================================
    
    @RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
    	lookifyService.deleteLookify(id);
    	return "redirect:/dashboard";
    }
    
//==================================
//	 search page
//==================================
	
    @RequestMapping(value="/search")
    public String find(@RequestParam(value="query", required=false) String query, Model x) {
        x.addAttribute("songs", lookifyService.findLookifys(query));
        x.addAttribute("query", query);
        return "search.jsp";
    }
    
 //==================================
//	 edit page
//===================================
    
	@RequestMapping("/edit/{id}")
	public String editSongs(@PathVariable("id") Long id, Model model) {
        model.addAttribute("lookify", lookifyService.findLookify(id));
		return "editsong.jsp";
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("lookify") Lookify lookify, BindingResult result) {
        if (result.hasErrors()) {
            return "editsong.jsp";
        } else {
        	lookifyService.updateLookify(lookify);
            return "redirect:/dashboard";
        }
    } 

    
}
