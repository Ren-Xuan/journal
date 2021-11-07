package renxuan.journal_web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import renxuan.journal_biz.biz.ArticleBiz;
import renxuan.journal_biz.biz.GlobalBiz;
import renxuan.journal_biz.biz.PeriodicalBiz;
import renxuan.journal_biz.biz.UserBiz;
import renxuan.journal_dao.entity.Article;
import renxuan.journal_dao.global.Constant;

@Controller("ArticleController")
public class ArticleController {
	
	@Autowired
	private ArticleBiz articleBiz;
	@Autowired
	private PeriodicalBiz periodicalBiz;
	@Autowired
	private UserBiz userBiz;
	@Autowired
	private GlobalBiz globalBiz;
	@RequestMapping("/article_index")
	public String getAll(HttpServletRequest request,ModelMap modelMap) {
		List<Article> list=globalBiz.selectAll();
		List<Article> recommend=new ArrayList<Article>();
		int cnt=0;
		for(Article article:list) {
			recommend.add(article);
			if(++cnt==Constant.RECOMMEND_NUM)break;
		}
		System.out.println(list);
		System.out.println(globalBiz.selectAllPeriodical());
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("recommend", articleBiz.selectByStage(Constant.ARTICLE_RECOMMEND_STAGE));
		modelMap.addAttribute("periodicals",globalBiz.selectAllPeriodical());
		return "index";
	}
	
	@RequestMapping("/article_search")
	public String getAllByTitle(Map<String, Object>map,
			@Param("article_id")String article_id,
			@Param("title")String title,
			@Param("user_id")String user_id,
			@Param("author")String author,
			@Param("keyword")String keyword,
			@Param("periodical_id")String periodical_id) {
		if(article_id!=null) {
			map.put("list", articleBiz.selectByIdPassed(article_id));
			map.put("title", "文章ID:"+article_id);
		}
		else if(title!=null) {
			map.put("list", articleBiz.selectByTitlePassed(title));
			map.put("title", "文章标题:"+title);
		}
		else if(author!=null) {
			map.put("list", articleBiz.selectByUserNamePassed(author));
			map.put("title", "文章作者:"+author);
		}
		else if(user_id!=null) {
			map.put("list", articleBiz.selectByUserIdPassed(user_id));
			map.put("title", "作者ID:"+user_id);
		}
		else if(keyword!=null) {
			map.put("list", articleBiz.selectByKeywordPassed(keyword));
			map.put("title", "关键字:"+keyword);
		}
		else if(periodical_id!=null) {
			map.put("list", articleBiz.selectByPeriodicalIdPassed(periodical_id));
			map.put("title", "期刊:"+periodical_id);
		}
		else {
			map.put("list", articleBiz.selectAllPassed());
		
		}
		return "search";
	}
	
	@RequestMapping("/article_content")
	public String getArticleById(@Param("articleId")String articleId,Map<String, Object>map) {
		if(articleId==null||articleId=="")return "/article_search";
		Article article= articleBiz.selectById(articleId).get(0);
		article.setViewer(article.getViewer()+1);
		articleBiz.updateViewer(article.getArticle_id(), article.getViewer());
		System.out.println("浏览数+1");
		map.put("result", articleBiz.selectById(articleId));
		return "article";
	}
	
	@RequestMapping("/admin_downFile")
	public String downFile(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("1");
		Article article=null;
		// 得到要下载的文件名
		String article_id = request.getParameter("article_id");
		try {
			article_id = new String(article_id.getBytes("iso8859-1"), "UTF-8");
			// 获取上传文件的目录
			article=articleBiz.selectById(article_id).get(0);
			// 上传位置
//			String fileSaveRootPath = article.getFile_path();
//			String fileName=article.getFile_name();
//			
//			System.out.println(fileSaveRootPath  + fileName);
//			// 得到要下载的文件
//			File file = new File(fileSaveRootPath  + fileName);
//			
//			// 如果文件不存在
//			if (!file.exists()) {
//				request.setAttribute("message", "您要下载的资源已被删除！！");
//				System.out.println("您要下载的资源已被删除！！");
//				return "to_error";
//			}
//			// 处理文件名
//			String realname = fileName.substring(fileName.indexOf("_") + 1);
//			// 设置响应头，控制浏览器下载该文件
//			response.setHeader("content-disposition", "attachment;filename="
//					+ URLEncoder.encode(realname, "UTF-8"));
//			// 读取要下载的文件，保存到文件输入流
//			FileInputStream in = new FileInputStream(fileSaveRootPath + "\\" + fileName);
//			// 创建输出流
//			OutputStream out = response.getOutputStream();
//			// 创建缓冲区
//			byte buffer[] = new byte[1024];
//			int len = 0;
//			// 循环将输入流中的内容读取到缓冲区当中
//			while ((len = in.read(buffer)) > 0) {
//				// 输出缓冲区的内容到浏览器，实现文件下载
//				out.write(buffer, 0, len);
//			}
//			// 关闭文件输入流
//			in.close();
//			// 关闭输出流
//			out.close();
			
		} catch (Exception e) {
			request.setAttribute("message", "文件服务器错误！！");
			System.out.println("文件服务器错误！！");
			return "to_error";
		}
		String redrict =article.getFile_path()+article.getFile_name();
		try{
			redrict = new String(redrict.getBytes("UTF-8"),"UTF-8");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return "redirect:"+redrict;
		
	}
	@RequestMapping("/search_special")
    @ResponseBody
    public ModelAndView addUserNormal(String content){
        ModelAndView mv=new ModelAndView();
        try {
            mv.setViewName("article_search");
        } catch (Exception e) {
            e.printStackTrace();
           mv.addObject("list", articleBiz.selectByTitle(content));
           mv.addObject("title", "搜索内容:"+content);
        }
        return mv;
    }


}
