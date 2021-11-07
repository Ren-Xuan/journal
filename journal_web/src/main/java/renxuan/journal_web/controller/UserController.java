package renxuan.journal_web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

import renxuan.journal_biz.biz.ArticleBiz;
import renxuan.journal_biz.biz.GlobalBiz;
import renxuan.journal_biz.biz.PeriodicalBiz;
import renxuan.journal_biz.biz.UserBiz;
import renxuan.journal_dao.entity.Article;
import renxuan.journal_dao.entity.Periodical;
import renxuan.journal_dao.entity.User;
import renxuan.journal_dao.global.Constant;
import renxuan.journal_web.global.UploadUtil;

@Controller("UserController")
public class UserController {
	@Autowired
	private ArticleBiz articleBiz;
	@Autowired
	private PeriodicalBiz periodicalBiz;
	@Autowired
	private UserBiz userBiz;
	@Autowired
	private GlobalBiz globalBiz;

	@RequestMapping("/to_admin")
	public String toLogin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		else {
			return "admin";
		}
	}

	@RequestMapping("/to_admin_home")
	public String toAdminHome(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		else {
			String id = user.getUser_id();
			System.out.println(id);
			List<Article> articles = articleBiz.selectByUserId(id);
			System.out.println(articles);
			map.put("myArticles", articles);
			int totalViewer = 0;
			for (Article article : articles) {
				totalViewer += article.getViewer();
			}
			map.put("totalViewer", totalViewer);
		}
		return "admin_home";
	}

	@RequestMapping("/to_admin_home_article_list")
	public String toAdminHomeArticleList(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		else {
			String id = user.getUser_id();
			System.out.println(id);
			List<Article> articles = articleBiz.selectByUserId(id);

			map.put("myArticles", articles);

		}
		return "admin_home_article_list";
	}

	@RequestMapping("/to_admin_home_article_create")
	public String toAdminHomeArticleCreate(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		else {
			List<Periodical> periodicals = periodicalBiz.selectAll();
			map.put("periodicals", periodicals);
			System.out.println(periodicals);
		}
		return "admin_home_article_create";
	}

	@RequestMapping("/to_admin_home_setting")
	public String toAdminHomeSetting(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
//		else {
//			String id=user.getUser_id();
//			System.out.println(id);
//			List<Article> articles=articleBiz.selectByUserId(id);
//			System.out.println(articles);
//			map.put("myArticles", articles);
//			
//		}
		return "admin_home_setting";
	}

	@RequestMapping("/to_admin_user_list")
	public String toAdminUserList(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		else {
			String id = user.getUser_id();
			System.out.println(id);
			List<User> users = userBiz.selectAllBelowTwoGrade(user);
			System.out.println(users);
			map.put("users", users);
		}
		return "admin_user_list";
	}

	@RequestMapping("/to_admin_user_update")
	public String toAdminUserUpdate(HttpSession session, Map<String, Object> map,
			@Param(value = "user_id")String user_id) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		else if(user_id==null)
		{
			return "to_admin_user_update";
		}
		else {
			User userUper=userBiz.selectUserById(user_id).get(0);
			map.put("userUper", userUper);
		}
		return "admin_user_update";
	}
	@RequestMapping("/to_admin_user_create")
	public String toAdminUserCreate() {
		
		return "admin_user_create";
	}
	@RequestMapping("/to_admin_article_list")
	public String toAdminArticleList(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		else {
			String id = user.getUser_id();
			System.out.println("id:"+id);
			int gradeManager = user.getGrade();
			List<Article> articles = articleBiz.selectAllBelowManagerStage(user);
			System.out.println(articles);
			map.put("articles", articles);
		}
		return "admin_article_list";
	}

	@RequestMapping(value = "/articleSubmitAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject articleSubmitAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "title", required = false) String title, String keyword, String summary,
			String periodical, @RequestParam(value = "file") MultipartFile file,
			@RequestParam(value = "cover") MultipartFile cover) {
		User user = (User) session.getAttribute("user");
		String result = "please login";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null)
			return JSONObject.parseObject(res);
		System.out.println(title + "-" + keyword + "-\n" + summary + "-" + periodical + "\n"
				+ file.getOriginalFilename() + "\n" + cover.getOriginalFilename());

		Map<String, String> fileMap = UploadUtil.fileUpload(file, request);
		Map<String, String> coverMap = UploadUtil.imageUpload(cover, request);
		Article article = new Article();
		article.setArticle_id(UUID.randomUUID().toString().substring(1, 8));
		article.setTitle(title);
		article.setAuthor(user.getName());
		article.setPeriodical_id(periodical);
		article.setKeyword(keyword);
		article.setSummary(summary);
		article.setCover_name(coverMap.get("name"));
		article.setCover_path(coverMap.get("path"));
		article.setFile_name(fileMap.get("name"));
		article.setFile_path(fileMap.get("path"));
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		article.setTime(new Date(System.currentTimeMillis()));

		System.out.println(article);
		if (articleBiz.insert(user, article).equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			result = "添加失败";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println("添加失败");
			return JSONObject.parseObject(res);
		}
	}

	@RequestMapping("to_admin_article_update")
	public String adminArticleUpdate(@Param("article_id") String article_id, HttpSession session,
			Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		
		Article article = articleBiz.selectById(user, article_id).get(0);
		List<Periodical> periodicals = periodicalBiz.selectAll();
		map.put("article", article);
		map.put("periodicals", periodicals);
		return "admin_article_update";
	}

	@RequestMapping(value = "/articleUpdateAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject articleUpdateAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "article_id", required = true) String article_id,
			@RequestParam(value = "title", required = false) String title, String keyword, String summary,
			String periodical, @RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "cover", required = false) MultipartFile cover) {
		User user = (User) session.getAttribute("user");
		String result = "please login";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null)
			return JSONObject.parseObject(res);
		Article article = articleBiz.selectById(user, article_id).get(0);
		if (file != null) {
			Map<String, String> fileMap = UploadUtil.fileUpload(file, request);
			article.setFile_name(fileMap.get("name"));
			article.setFile_path(fileMap.get("path"));
		}
		if (cover != null) {
			Map<String, String> coverMap = UploadUtil.imageUpload(cover, request);
			article.setCover_name(coverMap.get("name"));
			article.setCover_path(coverMap.get("path"));
		}

		if (article != null)
			article.setTitle(title);
		if (periodical != null)
			article.setPeriodical_id(periodical);
		if (keyword != null)
			article.setKeyword(keyword);
		if (summary != null)
			article.setSummary(summary);
		article.setTime(new Date(System.currentTimeMillis()));

		System.out.println(article);
		result = articleBiz.update(user, article);
		if (result.equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println("修改失败");
			return JSONObject.parseObject(res);
		}
	}

	@RequestMapping(value = "/userUpdateAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject userUpdateAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "user_id", required = true) String user_id,
			@RequestParam(value = "name", required = true) String name, String tel, String description,
			String password1, String password2,
			@RequestParam(value = "portrait", required = false) MultipartFile portrait) {
		User opeator = (User) session.getAttribute("user");
		String result = "please login";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";
		User user=userBiz.selectUserById(user_id).get(0);
		if (user == null)
			return JSONObject.parseObject(res);
		if (portrait != null) {

			Map<String, String> fileMap = UploadUtil.imageUpload(portrait, request);
			user.setPortrait_name(fileMap.get("name"));
			user.setPortrait_path(fileMap.get("path"));
		}
		if (name == null) {
			result = "请填写用户名";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		}
		if (!password1.equals(password2)) {
			result = "两次输入密码不一致!";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		}
		
		user.setName(name);
		user.setTel(tel);
		user.setDescription(description);
		user.setPassword(password1);

		result = userBiz.upgrade(opeator, user);
		if (result.equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			session.setAttribute("user",userBiz.selectUserById(opeator.getUser_id()).get(0));
			return JSONObject.parseObject(res);
		} else {
			result = "修改失败";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println("修改失败");
			return JSONObject.parseObject(res);
		}
	}
	@RequestMapping(value = "/userCreateAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject userCreateAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "name", required = true) String name, String tel, String description,
			String password1, String password2,
			@RequestParam(value = "portrait", required = false) MultipartFile portrait) {
		User user=new User();
		user.setUser_id(UUID.randomUUID().toString().substring(0, 5));
		
		String result="";
		String res="";
		if (portrait != null) {

			Map<String, String> fileMap = UploadUtil.imageUpload(portrait, request);
			user.setPortrait_name(fileMap.get("name"));
			user.setPortrait_path(fileMap.get("path"));
		}
		if (name == null) {
			result = "请填写用户名";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		}
		if (!password1.equals(password2)) {
			result = "两次输入密码不一致!";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		}
		
		user.setName(name);
		user.setTel(tel);
		user.setDescription(description);
		user.setPassword(password1);

		result = userBiz.add(user);
		if (result.equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			result = "创建失败";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println("创建失败");
			return JSONObject.parseObject(res);
		}
	}
	

	@RequestMapping(value = "/passAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject passAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "article_id", required = true) String article_id) {
		User user = (User) session.getAttribute("user");
		String result = "please login";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";
		try {

			int newStage = articleBiz.selectById(article_id).get(0).getStage();
			result = articleBiz.updateStage(user.getUser_id(), article_id, newStage + 1);
		} catch (Exception e) {
			result="error"+e.getStackTrace();
		}
		if (result.equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println(result);
			return JSONObject.parseObject(res);
		}
	}
	
	@RequestMapping(value = "/cancelAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject cancelAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "article_id", required = true) String article_id) {
		User user = (User) session.getAttribute("user");
		String result = "please login";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";
		try {

			result = articleBiz.updateStage(user.getUser_id(), article_id, Constant.ARTICLE_STAGE_REJECT);
		} catch (Exception e) {
			result="error"+e.getStackTrace();
		}
		if (result.equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println(result);
			return JSONObject.parseObject(res);
		}
	}
	@RequestMapping(value = "/delAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject delAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "article_id", required = true) String article_id) {
		User user = (User) session.getAttribute("user");
		String result = "please login";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";
		try {
			result = articleBiz.delete(user.getUser_id(), article_id);
		} catch (Exception e) {
			result="error"+e.getStackTrace();
		}
		if (result.equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println(result);
			return JSONObject.parseObject(res);
		}
	}
	
	@RequestMapping(value = "/upstageAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject upstageAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "user_id", required = true) String user_id) {
		User user = (User) session.getAttribute("user");
		String result = "please login";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";
		try {
			User userUper=userBiz.selectUserById(user_id).get(0);
			user=userBiz.selectUserById(user.getUser_id()).get(0);
			System.out.println(userUper);
			System.out.println(user);
			int grade=userUper.getGrade();
			if(user.getGrade()<=grade+1) {
				System.out.println("权限不够");
				result = "权限不够";
				res = "{\"result\":" + "\"" + result + "\"" + "}";
				return JSONObject.parseObject(res);
			}
			userUper.setGrade(userUper.getGrade()+1);
			result = userBiz.upgrade(user.getUser_id(), userUper);
		} catch (Exception e) {
			result="error"+e.getStackTrace();
		}
		if (result.equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println(result);
			return JSONObject.parseObject(res);
		}
	}
	@RequestMapping(value = "/passUserRegisterAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject passUserRegisterAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "user_id", required = true) String user_id) {
		User user = (User) session.getAttribute("user");
		String result = "please login";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";
		try {
			User tourist=userBiz.selectUserById(user_id).get(0);
			user=userBiz.selectUserById(user.getUser_id()).get(0);
			if(user.getGrade()<Constant.USER_MANAGER_GRADE) {
				System.out.println("权限不够");
				result = "权限不够";
				res = "{\"result\":" + "\"" + result + "\"" + "}";
				return JSONObject.parseObject(res);
			}else if (tourist.getChecked()>=Constant.USER_PASSCHECKED_STATE) {
				System.out.println("早已通过审核");
				result = "早已通过审核\"";
				res = "{\"result\":" + "\"" + result + "\"" + "}";
				return JSONObject.parseObject(res);
			}
			tourist.setChecked(Constant.USER_PASSCHECKED_STATE);
			result = userBiz.upgrade(user.getUser_id(), tourist);
		} catch (Exception e) {
			result="error"+e.getStackTrace();
		}
		if (result.equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println(Constant.SUCCESS_INF);
			result = Constant.SUCCESS_INF;
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println(result);
			return JSONObject.parseObject(res);
		}
	}

}
