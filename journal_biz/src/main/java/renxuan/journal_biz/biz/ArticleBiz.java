package renxuan.journal_biz.biz;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import renxuan.journal_dao.entity.Article;
import renxuan.journal_dao.entity.User;

public interface ArticleBiz {
	public String insert(User user,Article article);
	public String update(User user,Article article);
	public String updateStage(User user,String articleId,int stage);
	public String delete(User user,String articleId);
	public String cancel(User user,String articleId);//文章变为审核状态
	
	
	public String  insert(String userId,Article article);
	public String update(String userId,Article article);
	public String updateStage(String userId,String articleId,int stage);
	public String delete(String userId,String articleId);
	public String cancel(String userId,String articleId);
	
	//everyone is qualified
	public List<Article> selectAll();
	public List<Article> selectAllPassed();
	
	public List<Article> selectById(String articleId);
	public List<Article> selectByUserId(String userId);
	public List<Article> selectByUserName(String name);	
	public List<Article> selectByPeriodicalId(String periodicalId);
	public List<Article> selectByUserDepartment(String department);
	public List<Article> selectByTitle(String title);
	public List<Article> selectByKeyword(String keyword);
	public List<Article> selectByStage(int stage);
	public List<Article> selectByTime(@Param("startTime")Date startTime,@Param("endTime")Date endTime);
	public List<Article> selectByIdPassed(String articleId);
	public List<Article> selectByUserIdPassed(String userId);
	public List<Article> selectByUserNamePassed(String name);	
	public List<Article> selectByPeriodicalIdPassed(String periodicalId);
	public List<Article> selectByUserDepartmentPassed(String department);
	public List<Article> selectByTitlePassed(String title);
	public List<Article> selectByKeywordPassed(String keyword);
	public List<Article> selectByStagePassed(int stage);
	public List<Article> selectByTimePassed(@Param("startTime")Date startTime,@Param("endTime")Date endTime);
	//must be qualified还方便以后设置人均下载次数和下载记录等等
	public String getFilePathByArticleId(User user,String articleId);
	public List<Article> selectAll(User user);
	public List<Article> selectById(User user,String articleId);
	public List<Article> selectByUserId(User user,String userId);
	public List<Article> selectByUserName(User user,String name);
	
	public String updateViewer(@Param("article_id")String article_id,@Param("viewer")Integer viewer);
	public List<Article> selectAllBetweenManagerGrade(User manager,@Param("gradeMin")Integer gradeMin,@Param("gradeMax")Integer gradeMax);
	public List<Article> selectAllBetweenManagerStage(User manager,@Param("stageMin")Integer stageMin,@Param("stageMax")Integer stageMax);
	public List<Article> selectAllBelowManagerStage(User manager);
}
