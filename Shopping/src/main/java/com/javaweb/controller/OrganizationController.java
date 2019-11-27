package com.javaweb.controller;

import com.javaweb.model.Organization;
import com.javaweb.service.OrganizationService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/organization")
public class OrganizationController {
    @Resource
    private OrganizationService organizationService;
    @RequestMapping(value="/organization")
    public ModelAndView assess(HttpServletRequest req, HttpServletResponse response){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("organization");
        return mv;
    }

    @RequestMapping("getTreeDate")
    @ResponseBody
    public List<Organization> getTreeDate(@RequestParam(defaultValue="0")int  id) throws Exception {

        List<Organization> list=organizationService.getTree(id);
        return list;
    }

}
