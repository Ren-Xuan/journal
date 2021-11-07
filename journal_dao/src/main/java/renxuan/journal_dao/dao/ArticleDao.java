package renxuan.journal_dao.dao;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import renxuan.journal_dao.entity.Article;

@Repository("ArticleDao")
public interface ArticleDao {
	public void insert(Article article);
	public void update(Article article);
	public void updateStage(@Param("article_id")String article_id,@Param("stage")Integer stage);
	public void delete(Article article);
	public void deleteById(String article_id);
	public List<Article> selectAll();
	public List<Article> selectById(String article_id);
	public List<Article> selectByUserId(String userId);
	public List<Article> selectByUserName(String name);

	public List<Article> selectByPeriodicalId(String periodicalId);
	public List<Article> selectByUserDepartment(String department);
	public List<Article> selectByTitle(String title);
	public List<Article> selectByKeyword(String keyword);
	public List<Article> selectByStage(int stage);
	public List<Article> selectByTime(@Param("startTime")Date startTime,@Param("endTime")Date endTime);
	public void updateViewer(@Param("article_id")String article_id,@Param("viewer")Integer viewer);
	public List<Article> selectAllBetweenManagerGrade(@Param("gradeMin")Integer gradeMin,@Param("gradeMax")Integer gradeMax);
	public List<Article> selectAllBetweenArticleStage(@Param("stageMin")Integer stageMin,@Param("stageMax")Integer stageMax);
	public String getFilePathByArticleId(String article_id);
}
