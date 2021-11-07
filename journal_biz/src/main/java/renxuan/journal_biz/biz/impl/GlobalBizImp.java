package renxuan.journal_biz.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import renxuan.journal_biz.biz.GlobalBiz;
import renxuan.journal_dao.dao.ArticleDao;
import renxuan.journal_dao.dao.PeriodicalDao;
import renxuan.journal_dao.dao.RecommendDao;
import renxuan.journal_dao.dao.RecommendPeriodicalDao;
import renxuan.journal_dao.dao.UserDao;
import renxuan.journal_dao.entity.Article;
import renxuan.journal_dao.entity.Periodical;
import renxuan.journal_dao.entity.User;
import renxuan.journal_dao.global.Constant;

@Service("GlobalBiz")
public class GlobalBizImp implements GlobalBiz{

	@Autowired
	private UserDao userdao;
	@Autowired
	private PeriodicalDao periodicalDao;
	@Autowired
	private ArticleDao articleDao;
	@Autowired
	private RecommendDao recommendDao;
	@Autowired
	private RecommendPeriodicalDao recommendPeriodicalDao;
	
	@Override
	public User login(String sn, String password) {
		if(sn==null||password==null) {
			return null;
		}
		List<String>passwordByIdList=userdao.selectPasswordById(sn);
		List<String>passwordByTelList=userdao.selectPasswordByTel(sn);
		if(passwordByIdList.size()!=0) {
			if(password.equals(passwordByIdList.get(0))) {
				return userdao.selectById(sn).get(0);
			}else {
				return null;
			}
		}else if (passwordByTelList.size()!=0) {
			if(password.equals(passwordByTelList.get(0))) {
				return userdao.selectByTel(sn).get(0);
			}else {
				return null;
			}
		}else {
			return null;
		}

	}

	@Override
	public void changePassword(User user) {
		userdao.update(user);
	}

	@Override
	public void changeInformation(User user) {
		userdao.update(user);
	}

	@Override
	public List<Article> selectAll() {
		List<Article> recommends=recommendDao.selectAll();
//		List<Article> articles=new ArrayList<>();
//		for(Article recommend:recommends) {
//			articles.add(articleDao.selectById(recommend.getArticle_id()).get(0));
//		}
		return recommends;
	}

	@Override
	public String insert(Article article) {
		if (article.getStage()<=Constant.ARTICLE_STAGE_WAITING) {
			return "文章未审核";
		}
		else if (article.getStage()<Constant.ARTICLE_RECOMMEND_STAGE) {
			return "文章未二审";
		}
		try {
			recommendDao.insert(article);
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public String update(Article article) {
		if (article.getStage()<=Constant.ARTICLE_STAGE_WAITING) {
			return "文章未审核";
		}
		else if (article.getStage()<Constant.ARTICLE_RECOMMEND_STAGE) {
			return "文章未二审";
		}
		try {
			recommendDao.update(article);
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public String delete(Article article) {
		try {
			recommendDao.delete(article);
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public String deleteById(String article_id) {
		try {
			recommendDao.deleteById(article_id);
		} catch (Exception e) {
			return "error"+e.getMessage();
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public List<Article> select(Article article) {
		List<Article> recommends=recommendDao.select(article);
		
		return recommends;
	}

	@Override
	public List<Article> selectById(String article_id) {
		List<Article> recommends=recommendDao.selectById(article_id);
		
		return recommends;
	}

	@Override
	public List<Periodical> selectAllPeriodical() {
		return recommendPeriodicalDao.selectAll();
	}

	@Override
	public String insertPeriodical(Periodical periodical) {
		try {
			recommendPeriodicalDao.insertById(periodical.getPeriodical_id());
		} catch (Exception e) {
			return "插入错误";
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public String insertByPeriodicalId(String periodical_id) {
		try {
			recommendPeriodicalDao.insertById(periodical_id);
		} catch (Exception e) {
			return "插入错误";
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public String updatePeriodical(Periodical periodical) {
		try {
			recommendPeriodicalDao.update(periodical);
		} catch (Exception e) {
			return "修改错误";
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public String deletePeriodical(Periodical periodical) {
		try {
			recommendPeriodicalDao.deleteById(periodical.getPeriodical_id());
		} catch (Exception e) {
			return "删除错误";
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public String deleteByPeriodicalId(String periodical_id) {
		try {
			recommendPeriodicalDao.deleteById(periodical_id);
		} catch (Exception e) {
			return "删除错误";
		}
		return Constant.SUCCESS_INF;
	}

	@Override
	public List<Periodical> selectPeriodical(Periodical periodical) {
		return selectByPeriodicalId(periodical.getPeriodical_id());
	}

	@Override
	public List<Periodical> selectByPeriodicalId(String article_id) {
		return selectByPeriodicalId(article_id);
	}

	@Override
	public String recommendPeriodical(User manager, String periodical_id) {
		Integer userGrade=userdao.selectById(manager.getUser_id()).get(0).getGrade();
		Periodical periodical =periodicalDao.selectById(periodical_id).get(0);
		if(userGrade<Constant.USER_MANAGER_HIGHER_GRADE)return "权限不足";
		recommendPeriodicalDao.insert(periodical);
		return Constant.SUCCESS_INF;
	}

	@Override
	public String recommendCancelPeriodical(User manager, String periodical_id) {
		Integer userGrade=userdao.selectById(manager.getUser_id()).get(0).getGrade();
		Periodical periodical =periodicalDao.selectById(periodical_id).get(0);
		if(userGrade<Constant.USER_MANAGER_HIGHER_GRADE)return "权限不足";
		recommendPeriodicalDao.delete(periodical);
		return Constant.SUCCESS_INF;
	}

	@Override
	public String recommendArticle(User manager, String article_id) {
		Integer userGrade=userdao.selectById(manager.getUser_id()).get(0).getGrade();
		if(userGrade<Constant.USER_MANAGER_HIGHER_GRADE)return "权限不足";
		return this.insert(articleDao.selectById(article_id).get(0));
	}

	@Override
	public String recommendCancelArticle(User manager, String article_id) {
		Integer userGrade=userdao.selectById(manager.getUser_id()).get(0).getGrade();
		if(userGrade<Constant.USER_MANAGER_HIGHER_GRADE)return "权限不足";
		return this.deleteById(articleDao.selectById(article_id).get(0).getArticle_id());
	}

}
