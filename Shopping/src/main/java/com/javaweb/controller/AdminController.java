package com.javaweb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.javaweb.model.Admin;
import com.javaweb.model.Dep;
import com.javaweb.model.User;
import com.javaweb.service.AdminService;
import com.javaweb.service.DepService;
import com.javaweb.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;
    @Resource
    private DepService depService;
    @RequestMapping(value="/admin", method= RequestMethod.POST)
    @ResponseBody
//	@ExceptionHandler(HttpMessageNotReadableException.class)
    public String admin(
            @RequestBody Admin admin//admin是对象，要与model里面的相对应，传递整个对象时用@RequestBody
            , HttpServletResponse response
    ) {

        System.out.println("userName:"+admin.getUserName());
        try {
            adminService.save(admin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "test success";
    }
    @RequestMapping(value="/administrators")
    public ModelAndView administrators(HttpServletRequest req, HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("user/administrator");
        return mv;
    }
    @ResponseBody
    @RequestMapping(value="/getadminList", method= RequestMethod.GET, produces="text/plain;charset=utf-8")
    public String getadminList(HttpServletRequest req, HttpServletResponse response) {
        List<Admin> listadmin = null;
        int count=0;
        try {
            response.setContentType("text/html;charset=utf-8");
            String userId = req.getParameter("userId");
            String userName=req.getParameter("userName");
            int state= Integer.parseInt(req.getParameter("state"));
            String start = req.getParameter("start");
            String pageSize = req.getParameter("length");
            if(null==pageSize || pageSize.equals("")) pageSize ="10";
            String orderNum = req.getParameter("order[0][column]");
            String orderData = req.getParameter("columns["+orderNum+"][data]");
            String orderDir = req.getParameter("order[0][dir]");
            String orderSql = " order by " + orderData + " " + orderDir;
            int startIndex = Integer.parseInt(start);
            System.out.println("userId:"+ userId );
            System.out.println("userName"+userName);
            listadmin = adminService.queryByConditions(userId,userName,state,startIndex,Integer.parseInt(pageSize),orderSql);
            count=adminService.countByConditions(userId,userName,state);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map map = new HashMap<String,Object>();
        map.put("data",listadmin);
        map.put("recordsTotal",count);
        map.put("recordsFiltered",count);
        String str= JSON.toJSONString(map, SerializerFeature.WriteMapNullValue);//JSON.toJSONString中序列化空字符串遇到的坑，当某些字段为空时，转换成字符串时必须加SerializerFeature.WriteMapNullValue
        System.out.println(str);
        return str;
    }
    @RequestMapping("/editadmin")
	public ModelAndView editadmin(HttpServletRequest req, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		try{
			String userId = req.getParameter("userId");
			System.out.println("userId:"+ userId);

			 Admin admin = adminService.queryByUerId(userId);
            List<Dep> dep=depService.queryAll();
			mv.addObject("adminmessage", admin);//adminmessage是向前端传递的参数名。这边传的是对象worker，所以对应前端格式：参数名.对象内容（比如workermessage.workerId)
            mv.addObject("department",dep);
		}catch (Exception e){
			e.printStackTrace();
		}

		mv.setViewName("user/editadminstrator");
		return mv;
	}

	@RequestMapping(value="/adminsubmitEdit", method=RequestMethod.POST)
	@ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
	public String adminsubmitEdit(
			@RequestBody Admin admin
	) {
		System.out.println("admin.getUserId:"+admin.getUserId());
		try {
			adminService.edit(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "submitEdit success";
	}
}
