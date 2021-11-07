package renxuan.journal_web.controller;

import java.util.Date;
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

import renxuan.journal_biz.biz.PeriodicalBiz;
import renxuan.journal_biz.biz.UserBiz;
import renxuan.journal_dao.entity.Article;
import renxuan.journal_dao.entity.Periodical;
import renxuan.journal_dao.entity.User;
import renxuan.journal_dao.global.Constant;
import renxuan.journal_web.global.UploadUtil;

@Controller("PeriodicalController")
public class PeriodicalController {

	@Autowired
	private PeriodicalBiz periodicalBiz;
	@Autowired
	private UserBiz userBiz;

	@RequestMapping("to_admin_periodical_create")
	public String adminPeriodicalCreate(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";

		return "admin_periodical_create";
	}

	@RequestMapping("to_admin_periodical_update")
	public String adminPeriodicalUpdate(HttpSession session, @Param("periodical_id") String periodical_id,
			Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		Periodical periodical = periodicalBiz.selectById(periodical_id).get(0);
		System.out.println(periodical);
		map.put("periodical", periodical);
		return "admin_periodical_update";
	}

	@RequestMapping("to_admin_periodical_list")
	public String adminPeriodicalList(HttpSession session, Map<String, Object> map) {
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		
		map.put("periodicals", periodicalBiz.selectAllByArticleStageBelow(Constant.ARTICLE_RECOMMEND_STAGE));
		return "admin_periodical_list";
	}

	@RequestMapping(value = "/periodicalSubmitAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject articleSubmitAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "title", required = true) String title,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "preface", required = true) String preface,
			@RequestParam(value = "cover") MultipartFile cover) {

		User user = (User) session.getAttribute("user");
		String result = "密码错误";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null||!password.equals(user.getPassword()))
			return JSONObject.parseObject(res);
		Map<String, String> coverMap = UploadUtil.imageUpload(cover, request);
		Periodical periodical = new Periodical();
		periodical.setPeriodical_id(UUID.randomUUID().toString().substring(1, 8));
		periodical.setPeriodical_title(title);
		if (preface != null)
			periodical.setPreface(preface);
		periodical.setCover_name(coverMap.get("name"));
		periodical.setCover_path(coverMap.get("path"));

		System.out.println(periodical);
		if (periodicalBiz.insert(user, periodical).equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println("success");
			result = "success";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			result = "添加失败";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println("添加失败");
			return JSONObject.parseObject(res);
		}
	}

	@RequestMapping(value = "/periodicalUpdateSubmitAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject articleUpdateSubmitAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "periodical_id", required = true) String periodical_id,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "password", required = true) String password,
			@RequestParam(value = "preface", required = false) String preface,
			@RequestParam(value = "cover", required = false) MultipartFile cover) {

		User user = (User) session.getAttribute("user");
		String result = "密码错误";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null||!password.equals(user.getPassword()))
			return JSONObject.parseObject(res);

		Periodical periodical = periodicalBiz.selectById(periodical_id).get(0);
		if (title != null)
			periodical.setPeriodical_title(title);
		if (preface != null)
			periodical.setPreface(preface);
		if (cover != null) {
			Map<String, String> coverMap = UploadUtil.imageUpload(cover, request);
			periodical.setCover_name(coverMap.get("name"));
			periodical.setCover_path(coverMap.get("path"));
		}
		System.out.println(periodical);
		if (periodicalBiz.update(user, periodical).equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println("success");
			result = "success";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			result = "修改失败";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println("修改失败");
			return JSONObject.parseObject(res);
		}
	}
	
	@RequestMapping(value = "/periodicalDeleteAction", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject articleDeleteAction(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "periodical_id", required = true) String periodical_id) {

		User user = (User) session.getAttribute("user");
		
		String result = "密码错误";
		String res = "{\"result\":" + "\"" + result + "\"" + "}";

		if (user == null)
			return JSONObject.parseObject(res);
		
		System.out.println("delete"+periodical_id);
		if (periodicalBiz.deleteById(user, periodical_id).equalsIgnoreCase(Constant.SUCCESS_INF)) {
			System.out.println("success");
			result = "success";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			return JSONObject.parseObject(res);
		} else {
			result = "删除失败";
			res = "{\"result\":" + "\"" + result + "\"" + "}";
			System.out.println("删除失败");
			return JSONObject.parseObject(res);
		}
	}
	
}
