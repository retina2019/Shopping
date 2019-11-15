package com.javaweb.controller;

import com.javaweb.model.Dep;
import com.javaweb.service.DepService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
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
    @RequestMapping("/addDep")
    public ModelAndView addDep(HttpServletRequest req, HttpServletResponse response) throws Exception {
        Date date = new Date();
        System.out.println(date.toString()+":add department");
        ModelAndView mv=new ModelAndView();
        List<Dep> dep=depService.queryAll();
        mv.addObject("department",dep);
        mv.setViewName("department/adddepartment");
        return mv;
    }
    @RequestMapping(value="/adddepartment", method= RequestMethod.POST)
    @ResponseBody
//	@ExceptionHandler(HttpMessageNotReadableException.class)
    public String adddepartment(
            @RequestBody Dep dep//user是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("depName:"+dep.getDepName());
        try {

            depService.save(dep);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }
    @RequestMapping("/editDep")
    public ModelAndView editDep(HttpServletRequest req, HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        try{
            String depId = req.getParameter("depId");
            System.out.println("depId:"+ depId);

            Dep dep = depService.queryByDepId(depId);
            mv.addObject("department", dep);//department是向前端传递的参数名。这边传的是对象worker，所以对应前端格式：参数名.对象内容（比如workermessage.workerId)
        }catch (Exception e){
            e.printStackTrace();
        }

        mv.setViewName("department/editdepartment");
        return mv;
    }
    @RequestMapping(value="/submitdepartmentEdit", method=RequestMethod.POST)
    @ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
    public String submitdepartmentEdit(
            @RequestBody Dep department
    ) {
        System.out.println("department.getDepId:"+department.getDepId());
        try {
            depService.edit(department);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "submitEdit success";
    }
}
