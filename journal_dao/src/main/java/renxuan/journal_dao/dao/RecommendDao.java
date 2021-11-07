package renxuan.journal_dao.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import renxuan.journal_dao.entity.Article;


@Repository("RecommendDao")
public interface RecommendDao {
	public List<Article> selectAll();
	public void insert(Article article);
	public void insertById(String article_id);
	public void update(Article article);

	public void delete(Article article);
	public void deleteById(String article_id);
	public List<Article> select(Article article);
	public List<Article> selectById(String article_id);
}
