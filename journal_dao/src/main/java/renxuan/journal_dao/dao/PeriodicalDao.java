package renxuan.journal_dao.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import renxuan.journal_dao.entity.Periodical;

@Repository("PeriodicalDao")
public interface PeriodicalDao {
	public void insert(Periodical periodical);
	public void update(Periodical periodical);
	public void delete(Periodical periodical);
	public void deleteById(String periodical_id);
	public List<Periodical> selectAll();
	public List<Periodical> selectAllArticleStageBetween(@Param("minStage")Integer minStage,@Param("maxStage")Integer maxStage);
	public List<Periodical> selectById(String id);
	public List<Periodical> selectByTitle(String title);
	public List<Periodical> selectByArticleTime(@Param("startTime")Date startTime,@Param("endTime")Date endTime);
}
