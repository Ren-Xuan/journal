package renxuan.journal_biz.biz;

import java.util.List;

import renxuan.journal_dao.entity.Article;
import renxuan.journal_dao.entity.Periodical;
import renxuan.journal_dao.entity.User;

public interface GlobalBiz {
    User login(String sn,String password);
    //退出有关的是session，在表现层
    void changePassword(User user);
    void changeInformation(User user);
    
    public List<Article> selectAll();
	public String insert(Article article);
	public String update(Article article);

	public String delete(Article article);
	public String deleteById(String article_id);
	public List<Article> select(Article article);
	public List<Article> selectById(String article_id);
	
	public List<Periodical> selectAllPeriodical();
	public String insertPeriodical(Periodical periodical);
	public String insertByPeriodicalId(String periodical_id);
	public String updatePeriodical(Periodical periodical);

	public String deletePeriodical(Periodical periodical);
	public String deleteByPeriodicalId(String periodical_id);
	public List<Periodical> selectPeriodical(Periodical periodical);
	public List<Periodical> selectByPeriodicalId(String article_id);
	
	public String recommendPeriodical(User manager,String periodical_id);
	public String recommendCancelPeriodical(User manager,String periodical_id);
	
	public String recommendArticle(User manager,String article_id);
	public String recommendCancelArticle(User manager,String article_id);
}
