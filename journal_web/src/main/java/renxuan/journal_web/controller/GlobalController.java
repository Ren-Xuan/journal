package renxuan.journal_web.controller;


import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import renxuan.journal_biz.biz.ArticleBiz;
import renxuan.journal_biz.biz.GlobalBiz;
import renxuan.journal_biz.biz.PeriodicalBiz;
import renxuan.journal_biz.biz.UserBiz;
import renxuan.journal_dao.dao.RecommendDao;
import renxuan.journal_dao.dao.RecommendPeriodicalDao;
import renxuan.journal_dao.entity.User;
import renxuan.journal_dao.global.Constant;

@Controller("GlobalController")
public class GlobalController {
	@Autowired
	private GlobalBiz globalBiz;
	@Autowired
	private ArticleBiz articleBiz;
	@Autowired
	private PeriodicalBiz periodicalBiz;
	@Autowired
	private UserBiz userBiz;

	@RequestMapping("/top")
	public void top(Map<String, String> map) {
		map.put("user", "userid");
	}

	@RequestMapping("/to_login")
	public String toLogin(HttpSession session) {

		return "login";
	}
	@RequestMapping("/to_error")
	public String toError(HttpSession session) {

		return "error_page";
	}

	@RequestMapping("/loginAction")
	@ResponseBody
	public boolean loginAction(HttpSession session, String name, String password) {
		// ajax一定要注释responseBody！！！！！！！！！！！
		System.out.println("ajax");
		User user = globalBiz.login(name, password);
		if (user == null) {
			session.setAttribute("user", null);
			return false;
		} else {
			session.setAttribute("user", user);
			return true;
		}

	}
	@RequestMapping("/registerAction")
	@ResponseBody
	public JSONObject registerAction(HttpSession session, 
			@RequestParam(value = "name", required = true)String name, 
			@RequestParam(value = "name", required = true)String password1,
			@RequestParam(value = "name", required = true)String password2,
			@RequestParam(value = "name", required = true)String tel,
			@RequestParam(value = "name", required = true)String department) {
		// ajax一定要注释responseBody！！！！！！！！！！！
		/*
		 * 			"name":name,
                	"tel":tel,
                	"department":department,
                	"password1":password1,//多数据用,分隔
                	"password2":password2//多数据用,分隔
		 * 
		 * 
		 */
		String result = "确认密码输入错误";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";
		if(!password1.equals(password2)) {
			return JSONObject.parseObject(res);
		}
		try {
			User user=new User();
			user.setUser_id(UUID.randomUUID().toString().substring(1,8));
			user.setName(name);
			user.setDepartment(department);
			user.setPassword(password1);
			user.setTel(tel);
			userBiz.add(user);
		} catch (Exception e) {
			result =e.getStackTrace().toString();
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		}
		result =Constant.SUCCESS_INF;
		res = "{\"result\":" + "\"" + result + "\"" + "}";
		return JSONObject.parseObject(res);
	}

	@RequestMapping("/logoutAction")
	@ResponseBody
	public boolean logoutAction(HttpSession session, String name, String password) {
		// ajax一定要注释responseBody！！！！！！！！！！！
		System.out.println("out");
		session.setAttribute("user", null);
		return true;
	}

	@RequestMapping(value = "/articleRecommendAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject articleRecommendAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "article_id", required = true) String article_id) {

		User user = (User) session.getAttribute("user");
		String result = "用户错误";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null)
			return JSONObject.parseObject(res);

		result = globalBiz.recommendArticle(user, article_id);
		res = "{\"result\":" + "\"" + result + "\"" + "}";
		System.out.println(result);
		return JSONObject.parseObject(res);

	}

	@RequestMapping(value = "/articleCancelRecommendAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject articleCancelRecommendAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "article_id", required = true) String article_id) {

		User user = (User) session.getAttribute("user");
		String result = "用户错误";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null)
			return JSONObject.parseObject(res);

		result = globalBiz.recommendCancelArticle(user, article_id);
		res = "{\"result\":" + "\"" + result + "\"" + "}";
		System.out.println(result);
		return JSONObject.parseObject(res);

	}

	@RequestMapping(value = "/periodicalRecommendAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject periodicalRecommendAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "periodical_id", required = true) String periodical_id) {

		User user = (User) session.getAttribute("user");
		String result = "用户错误";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null)
			return JSONObject.parseObject(res);

		result = globalBiz.recommendPeriodical(user, periodical_id);
		res = "{\"result\":" + "\"" + result + "\"" + "}";
		System.out.println(res);
		return JSONObject.parseObject(res);

	}

	@RequestMapping(value = "/periodicalCancelRecommendAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject periodicalCancelRecommendAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "periodical_id", required = true) String periodical_id) {

		User user = (User) session.getAttribute("user");
		String result = "用户错误";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null)
			return JSONObject.parseObject(res);

		result = globalBiz.recommendCancelPeriodical(user, periodical_id);
		res = "{\"result\":" + "\"" + result + "\"" + "}";
		System.out.println(res);
		return JSONObject.parseObject(res);

	}

}
