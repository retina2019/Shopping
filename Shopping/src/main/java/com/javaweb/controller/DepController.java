package com.javaweb.controller;

import com.javaweb.model.Dep;
import com.javaweb.service.DepService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/department")
public class DepController {
    @Resource
    private DepService depService;

    /**
     * 返回jsp
     */


    @RequestMapping(value="/revertAlldeps")
    public ModelAndView List(HttpServletRequest req, HttpServletResponse response ) {
        ModelAndView mv = new ModelAndView();
        List<Dep> listdep = null;
        try {
            String depId = req.getParameter("depId");
            System.out.println("depId:"+ depId);
            listdep = depService.searchByDepId(depId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("departments",listdep);
        mv.setViewName("department/department");//通过model.addAttribute向前端传入数据
        return mv;

    }

}
