package renxuan.journal_biz.biz.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import renxuan.journal_biz.biz.PeriodicalBiz;
import renxuan.journal_dao.dao.PeriodicalDao;
import renxuan.journal_dao.dao.UserDao;
import renxuan.journal_dao.entity.Article;
import renxuan.journal_dao.entity.Periodical;
import renxuan.journal_dao.entity.User;
import renxuan.journal_dao.global.Constant;

@Service("PeriodicalBiz")
public class PeriodicalBizImp implements PeriodicalBiz{
	@Autowired
	private PeriodicalDao periodicalDao;
	@Autowired
	private UserDao userDao;

	// 管理员权限
	public boolean qualifiedManage(User user) {
		User newUser = userDao.selectById(user.getUser_id()).get(0);
		System.out.println(userDao.selectById(user.getUser_id()));
		if (newUser.getGrade() >= Constant.USER_MANAGER_HIGHER_GRADE)
			return true;
		return false;
	}

	public boolean qualifiedManage(String userId) {
		User newUser = userDao.selectById(userId).get(0);
		if (newUser.getGrade() >= Constant.USER_MANAGER_HIGHER_GRADE)
			return true;

		return false;
	}

	@Override
	public String insert(User manager,Periodical periodical) {
		if(!qualifiedManage(manager.getUser_id()))return "权限不足无法操作";
		
		try {
			periodicalDao.insert(periodical);
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		return Constant.SUCCESS_INF;
		
	}

	@Override
	public String delete(User manager,Periodical periodical) {
		if(!qualifiedManage(manager.getUser_id()))return "权限不足无法操作";
		try {
			periodicalDao.deleteById(periodical.getPeriodical_id());
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public String deleteById(User manager,String periodical_id) {
		if(!qualifiedManage(manager.getUser_id()))return "权限不足无法操作";
		try {
			periodicalDao.deleteById(periodical_id);
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		return Constant.SUCCESS_INF;
		
	}
	@Override
	public String update(User manager,Periodical periodical) {
		if(!qualifiedManage(manager.getUser_id()))return "权限不足无法操作";
		periodicalDao.update(periodical);
		try {
			
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		return Constant.SUCCESS_INF;
	}


	@Override
	public List<Periodical> selectAll() {
		return periodicalDao.selectAll();
	}

	@Override
	public List<Periodical> selectById(String periodicalId) {
		return periodicalDao.selectById(periodicalId);
	}

	@Override
	public List<Periodical> selectByTitleLike(String title) {
		return periodicalDao.selectByTitle(title);
	}

	@Override
	public List<Periodical> selectByArticleTime(Date startTime, Date endTime) {
		if(startTime==null&&endTime==null)return periodicalDao.selectAll();
		if(startTime==null)return periodicalDao.selectByArticleTime(new Date(0, 0, 0, 0, 0, 0), endTime);
		if(endTime==null)return periodicalDao.selectByArticleTime(startTime, new Date(9999, 1, 1, 1, 1, 1));
		return periodicalDao.selectByArticleTime(startTime, endTime);
	}

	

	@Override
	public List<Periodical> selectAllByArticleStageBelow(Integer minStage) {
		//当查询到期刊没有文章或者文章没有审核的时候应该也搜索到
		List<Periodical> list=periodicalDao.selectAllArticleStageBetween(minStage, Integer.MAX_VALUE);
		List<Periodical> listAll=periodicalDao.selectAll();
		for(Periodical periodical:listAll) {
			List<Article>articles= periodical.getArticles();
			for(int i=0;i<articles.size();i++) {
				if(articles.get(i).getStage()<minStage) {
					articles.remove(i);
				}
			}
		}
		return listAll;
	}



		
}
