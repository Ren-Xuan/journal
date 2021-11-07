package renxuan.journal_biz.biz;

import java.util.Date;
import java.util.List;

import renxuan.journal_dao.entity.Periodical;
import renxuan.journal_dao.entity.User;

public interface PeriodicalBiz {
	public String insert(User manager,Periodical periodical);
	public String delete(User manager,Periodical periodical);
	public String deleteById(User manager,String periodical_id);
	public String update(User manager,Periodical periodical);
	public List<Periodical> selectAll();
	public List<Periodical> selectAllByArticleStageBelow(Integer minStage);
	public List<Periodical> selectById(String periodicalId);
	public List<Periodical> selectByTitleLike(String title);
	public List<Periodical> selectByArticleTime(Date startTime,Date endTime);
	
	
}
