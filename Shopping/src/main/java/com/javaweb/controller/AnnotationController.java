package com.javaweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.Date;

	/**
	 *
	 * @author stone
	 *
	 */
	@Controller
	@RequestMapping("/annotation")
	public class AnnotationController {

		/**
		 * 返回jsp
		 * @param response
		 */
//		@RequestMapping("/getJSP")
//		public ModelAndView getJSP(HttpServletRequest req, HttpServletResponse response){
//
//
//			Date date = new Date();
//			System.out.println(date.toString()+":getJSP");
//			try {
//				String str = "";
//				if(req.getParameter("userName")!= null){
//					str = new String(req.getParameter("userName").getBytes("ISO-8859-1"),"utf-8") ;
//				}
//				System.out.println("======="+str);
//			} catch (UnsupportedEncodingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			//1、收集参数、验证参数
//			//2、绑定参数到命令对象
//			//3、将命令对象传入业务对象进行业务处理
//			//4、选择下一个页面
//			ModelAndView mv = new ModelAndView();
//			//添加模型数据 可以是任意的POJO对象
//			mv.addObject("message", "Hello World!");
//			//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
//			mv.setViewName("hello");
//			return mv;
//		}
//
//		/**
//		 * 提交数据
//		 * @param req
//		 * @param response
//		 * @return
//		 */
//		@RequestMapping(value="/sendData", method= RequestMethod.GET, params="userName=123")
//		public ModelAndView sendData(HttpServletRequest req, HttpServletResponse response, Model model){
//
//			Date date = new Date();
//			System.out.println(date.toString()+":sendData");
//
//			String username = req.getParameter("userName");
//			System.out.println(username);
//			//1、收集参数、验证参数
//			//2、绑定参数到命令对象
//			//3、将命令对象传入业务对象进行业务处理
//			//4、选择下一个页面
//			ModelAndView mv = new ModelAndView();
//			//添加模型数据 可以是任意的POJO对象
//			mv.addObject("message", "提交成功!");
//			//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
//			mv.setViewName("success");
//			return mv;
//		}
//
//		@RequestMapping(value="/sendName/{username}", method= RequestMethod.GET)
//		public ModelAndView sendName(@PathVariable String username, Model model) {
//			System.out.println("sendName:"+username);
//
//			ModelAndView mv = new ModelAndView();
//			mv.addObject("message", "提交成功!");
//			//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
//			mv.setViewName("success");
//			return mv;
//		}
//
//		@RequestMapping(value="/sendParams", method= RequestMethod.POST)
//		public ModelAndView sendParams(
//				@RequestParam(required = true, value="username", defaultValue = "默认用户名") String name,
//				Model model) {
//			System.out.println("sendName:"+name);
//
//			ModelAndView mv = new ModelAndView();
//			mv.addObject("message", "提交成功!");
//			//设置逻辑视图名，视图解析器会根据该名字解析到具体的视图页面
//			mv.setViewName("success");
//			return mv;
//		}


	
}
