package renxuan.journal_dao.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import renxuan.journal_dao.entity.Periodical;

@Repository("RecommendPeriodicalDao")
public interface RecommendPeriodicalDao {
	public List<Periodical> selectAll();
	public void insert(Periodical periodical);
	public void insertById(String periodical_id);
	public void update(Periodical periodical);

	public void delete(Periodical periodical);
	public void deleteById(String periodical_id);
	public List<Periodical> select(Periodical periodical);
	public List<Periodical> selectById(String periodical_id);
}