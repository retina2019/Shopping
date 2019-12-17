package com.javaweb.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.javaweb.model.Dep;
import com.javaweb.model.Shop;
import com.javaweb.model.TestModel;
import com.javaweb.model.User;
import com.javaweb.service.DepService;
import com.javaweb.service.ShopService;
import com.javaweb.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author stone
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {


	@Resource
	private UserService userService;
	private DepService depService;
	@Resource
	private ShopService shopService;

	/** 
     * 返回jsp
     * @param response 
     */
	@RequestMapping(value="/user", method= RequestMethod.POST)
	@ResponseBody
//	@ExceptionHandler(HttpMessageNotReadableException.class)
	public String user(
			@RequestBody User user//user是对象，要与model里面的相对应，传递整个对象时用@RequestBody
			, HttpServletResponse response
	) {

		System.out.println("userName:"+user.getUserName());
		try {
			userService.save(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "test success";
	}
	@RequestMapping(value="/users")
	public ModelAndView users(HttpServletRequest req, HttpServletResponse response) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/user");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value="/getList", method= RequestMethod.GET, produces="text/plain;charset=utf-8")
	public String getList(HttpServletRequest req, HttpServletResponse response) {
		List<User> listuser = null;
		int count=0;
		try {
			response.setContentType("text/html;charset=utf-8");
			String userId = req.getParameter("userId");
			String userName=req.getParameter("userName");
			int sex= Integer.parseInt(req.getParameter("sex"));
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
			listuser = userService.queryByConditions(userId,userName,sex,startIndex,Integer.parseInt(pageSize),orderSql);
			count=userService.countByConditions(userId,userName,sex);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map map = new HashMap<String,Object>();
		map.put("data",listuser);
		map.put("recordsTotal",count);
		map.put("recordsFiltered",count);
		String str= JSON.toJSONString(map, SerializerFeature.WriteMapNullValue);//JSON.toJSONString中序列化空字符串遇到的坑，当某些字段为空时，转换成字符串时必须加SerializerFeature.WriteMapNullValue
		System.out.println(str);
		return str;
	}
	@RequestMapping("/edituser")
	public ModelAndView edituser(HttpServletRequest req, HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		try{
			String userId = req.getParameter("userId");
			System.out.println("userId:"+ userId);

			User user = userService.queryByUerId(userId);
			mv.addObject("usermessage", user);//workermessage是向前端传递的参数名。这边传的是对象worker，所以对应前端格式：参数名.对象内容（比如workermessage.workerId)
		}catch (Exception e){
			e.printStackTrace();
		}

		mv.setViewName("user/edituser");
		return mv;
	}
	@RequestMapping(value="/submitEdit", method=RequestMethod.POST)
	@ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
	public String submitEdit(
			@RequestBody User user
	) {
		System.out.println("worker.getuserId:"+user.getUserId());
		try {
			userService.edit(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "submitEdit success";
	}
	@RequestMapping(value="/deleteuser", method=RequestMethod.POST)
	@ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
	public String deleteuser(
			@RequestBody User user//传递整个对象时用@RequestBody
	) {
		System.out.println("userId:"+user.getUserId());
		try {
			userService.deleteByUserId(user.getUserId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "删除成功！！！";
	}
//	@RequestMapping(value="/shoppers")
//	public ModelAndView shoppers(HttpServletRequest req, HttpServletResponse response) {
//
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("user/shopper");
//		return mv;
//	}
//	@ResponseBody
//	@RequestMapping(value="/getshopList", method= RequestMethod.GET, produces="text/plain;charset=utf-8")
//	public String getshopList(HttpServletRequest req, HttpServletResponse response) {
//		List<Shop> listshop = null;
//		int count=0;
//		try {
//			response.setContentType("text/html;charset=utf-8");
//			String shopId = req.getParameter("shopId");
//			String shopName=req.getParameter("shopName");
//			String start = req.getParameter("start");
//			String pageSize = req.getParameter("length");
//			if(null==pageSize || pageSize.equals("")) pageSize ="10";
//			String orderNum = req.getParameter("order[0][column]");
//			String orderData = req.getParameter("columns["+orderNum+"][data]");
//			String orderDir = req.getParameter("order[0][dir]");
//			String orderSql = " order by " + orderData + " " + orderDir;
//			int startIndex = Integer.parseInt(start);
//			System.out.println("shopId:"+ shopId );
//			System.out.println("shopName"+shopName);
//			listshop = shopService.queryByShopConditions(shopId,shopName,startIndex,Integer.parseInt(pageSize),orderSql);
//			count=shopService.countByShopConditions(shopId,shopName);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		Map map = new HashMap<String,Object>();
//		map.put("data",listshop);
//		map.put("recordsTotal",count);
//		map.put("recordsFiltered",count);
//		String str= JSON.toJSONString(map, SerializerFeature.WriteMapNullValue);//JSON.toJSONString中序列化空字符串遇到的坑，当某些字段为空时，转换成字符串时必须加SerializerFeature.WriteMapNullValue
//		System.out.println(str);
//		return str;
//	}
//	@RequestMapping("/editshoper")
//	public ModelAndView editshoper(HttpServletRequest req, HttpServletResponse response){
//		ModelAndView mv = new ModelAndView();
//		try{
//			String shopId = req.getParameter("shopId");
//			System.out.println("shopId:"+ shopId);
//
//			Shop shop = shopService.queryByShopId(shopId);
//			mv.addObject("shopmessage", shop);//shopmessage是向前端传递的参数名。这边传的是对象shop，所以对应前端格式：参数名.对象内容（比如shopmessage.shopId)
//		}catch (Exception e){
//			e.printStackTrace();
//		}
//
//		mv.setViewName("user/editshopper");
//		return mv;
//	}
//
//	@RequestMapping(value="/submitshopEdit", method=RequestMethod.POST)
//	@ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
//	public String submitshopEdit(
//			@RequestBody Shop shop
//	) {
//		System.out.println("shop.getShopId:"+shop.getShopId());
//		try {
//			shopService.edit(shop);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "submitEdit success";
//	}
//	@RequestMapping(value="/deleteshoper", method=RequestMethod.POST)
//	@ResponseBody//@ResponsBody的作用是将java 对象转为json格式的数据，可以把具体的数据反馈到前端
//	public String deleteshoper(
//			@RequestBody Shop shop//传递整个对象时用@RequestBody
//	) {
//		System.out.println("shopId:"+shop.getShopId());
//		try {
//			shopService.deleteByShopId(shop.getShopId());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "删除成功！！！";
//	}
//
//	@RequestMapping(value="/shop", method= RequestMethod.POST)
//	@ResponseBody
////	@ExceptionHandler(HttpMessageNotReadableException.class)
//	public String shop(
//			@RequestBody Shop shop//shop是对象，要与model里面的相对应，传递整个对象时用@RequestBody
//			, HttpServletResponse response
//	) {
//
//		System.out.println("shopName:"+shop.getShopName());
//		try {
//			shopService.save(shop);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "test success";
//	}

}
