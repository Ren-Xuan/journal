package renxuan.journal_biz.biz.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import renxuan.journal_biz.biz.ArticleBiz;
import renxuan.journal_dao.dao.ArticleDao;
import renxuan.journal_dao.dao.UserDao;
import renxuan.journal_dao.entity.Article;
import renxuan.journal_dao.entity.User;
import renxuan.journal_dao.global.Constant;

@Service("ArticleBiz")
public class ArticleBizImp implements ArticleBiz {

	@Autowired
	private ArticleDao articleDao;
	@Autowired
	private UserDao userDao;

	/*
	 * 事务的麻烦点有一部分就是当后台数据库更新信息(被取消资格之类的) 那么一些敏感操作不能仅仅通过前台数据来验证 但是对于这些啸网站
	 * 暂时就用很低的安全检测就行了
	 * 
	 */
	// 管理员权限和修改权限
	public boolean qualifiedAlter(User user, Article article) {
		User newUser = userDao.selectById(user.getUser_id()).get(0);
		if (newUser.getUser_id().equals(article.getUser_id()))
			return true;// 修改用户是当前文章作者
		if (newUser.getGrade() >= Constant.USER_MANAGER_GRADE)
			return true;
		return false;
	}

	public boolean qualifiedAlter(String userId, Article article) {
		User newUser = userDao.selectById(userId).get(0);
		if (newUser.getUser_id().equals(article.getUser_id()))
			return true;// 修改用户是当前文章作者
		if (newUser.getGrade() >= Constant.USER_MANAGER_GRADE)
			return true;

		return false;
	}

	public boolean qualifiedAlter(String userId, String articleId) {
		User newUser = userDao.selectById(userId).get(0);
		if (newUser.getUser_id().equals(articleDao.selectById(articleId).get(0).getUser_id()))
			return true;// 修改用户是当前文章作者
		if (newUser.getGrade() >= Constant.USER_MANAGER_GRADE)
			return true;

		return false;
	}

	// 管理员权限
	public boolean qualifiedManage(User user) {
		User newUser = userDao.selectById(user.getUser_id()).get(0);
		System.out.println(userDao.selectById(user.getUser_id()));
		if (newUser.getGrade() >= Constant.USER_MANAGER_GRADE)
			return true;
		return false;
	}

	public boolean qualifiedManage(String userId) {
		User newUser = userDao.selectById(userId).get(0);
		if (newUser.getGrade() >= Constant.USER_MANAGER_GRADE)
			return true;

		return false;
	}

	// 下载权限/普通权限/非游客权限
	public boolean qualifiedDownload(User user) {
		User newUser = userDao.selectById(user.getUser_id()).get(0);
		if (newUser == null)
			return false;// 空用户
		if (newUser.getChecked() == Constant.USER_UNCHECKED_STATE
				|| newUser.getChecked() == Constant.USER_WAITCHECKED_STATE)
			return false;// 审核未通过

		return true;
	}

	public boolean qualifiedDownload(String userId) {
		User newUser = userDao.selectById(userId).get(0);
		if (newUser == null)
			return false;// 空用户
		if (newUser.getChecked() == Constant.USER_UNCHECKED_STATE
				|| newUser.getChecked() == Constant.USER_WAITCHECKED_STATE)
			return false;// 审核未通过
		return true;
	}

	@Override
	public String insert(User user, Article article) {
		System.out.println(article);
		return insert(user.getUser_id(), article);

	}

	@Override
	public String update(User user, Article article) {
		return update(user.getUser_id(), article);
	}

	@Override
	public String updateStage(User user, String articleId, int stage) {
		return updateStage(user.getUser_id(), articleId, stage);

	}

	@Override
	public String delete(User user, String articleId) {
		return delete(user.getUser_id(), articleId);
	}

	@Override
	public String cancel(User user, String articleId) {
		return cancel(user.getUser_id(), articleId);
	}

	@Override
	public String insert(String userId, Article article) {
		try {

			
			
			article.setUser_id(userId);
			article.setStage(Constant.ARTICLE_STAGE_WAITING);
			System.out.println(article);
			articleDao.insert(article);
			return "success";
		} catch (Exception e) {
			return "error" + e.getMessage();
		}
	}

	@Override
	public String update(String userId, Article article) {
		try {
			if (!qualifiedAlter(userId, article) )
				return "not qualified";
			article.setStage(Constant.ARTICLE_STAGE_WAITING);
			articleDao.update(article);
			return "success";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "error" + e.getMessage();
		}
	}

	@Override
	public String updateStage(String userId, String articleId, int stage) {
		try {
			if (!qualifiedManage(userId))
				return "not qualified";
			articleDao.updateStage(articleId, stage);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error" + e.getMessage();
		}
	}

	@Override
	public String delete(String userId, String articleId) {
		try {
			Article article = articleDao.selectById(articleId).get(0);
			String oldUserId = article.getUser_id();
			if (!qualifiedAlter(userId, articleId))
				return "not qualified";
			articleDao.deleteById(articleId);
			return "success";
		} catch (Exception e) {
			return "error" + e.getMessage();
		}
	}

	@Override
	public String cancel(String userId, String articleId) {
		try {
			Article article = articleDao.selectById(articleId).get(0);
			
			if (!qualifiedAlter(userId, articleId) )
				return "not qualified";
			article.setStage(Constant.ARTICLE_STAGE_WAITING);
			articleDao.update(article);
			return "success";
		} catch (Exception e) {
			return "error" + e.getMessage();
		}
	}

	@Override
	public List<Article> selectAll() {
		return articleDao.selectAll();
	}

	@Override
	public List<Article> selectById(String articleId) {
		return articleDao.selectById(articleId);
	}

	@Override
	public List<Article> selectByUserId(String userId) {
		return articleDao.selectByUserId(userId);
	}

	@Override
	public List<Article> selectByUserName(String name) {
		return articleDao.selectByUserName(name);
	}

	@Override
	public List<Article> selectByPeriodicalId(String periodicalId) {
		return articleDao.selectByPeriodicalId(periodicalId);
	}

	@Override
	public List<Article> selectByUserDepartment(String department) {
		return articleDao.selectByUserDepartment(department);
	}

	@Override
	public List<Article> selectByTitle(String title) {
		return articleDao.selectByTitle(title);
	}

	@Override
	public List<Article> selectByKeyword(String keyword) {
		return articleDao.selectByKeyword(keyword);
	}

	@Override
	public List<Article> selectByStage(int stage) {
		return articleDao.selectByStage(stage);
	}

	@Override
	public List<Article> selectByTime(Date startTime, Date endTime) {
		return articleDao.selectByTime(startTime, endTime);
	}
	
	
	
	
	@Override
	public List<Article> selectAllPassed() {
		return pass(articleDao.selectAll());
	}

	@Override
	public List<Article> selectByIdPassed(String articleId) {
		return pass(articleDao.selectById(articleId));
	}

	@Override
	public List<Article> selectByUserIdPassed(String userId) {
		return pass(articleDao.selectByUserId(userId));
	}

	@Override
	public List<Article> selectByUserNamePassed(String name) {
		return pass(articleDao.selectByUserName(name));
	}

	@Override
	public List<Article> selectByPeriodicalIdPassed(String periodicalId) {
		return pass(articleDao.selectByPeriodicalId(periodicalId));
	}

	@Override
	public List<Article> selectByUserDepartmentPassed(String department) {
		return pass(articleDao.selectByUserDepartment(department));
	}

	@Override
	public List<Article> selectByTitlePassed(String title) {
		return pass(articleDao.selectByTitle(title));
	}

	@Override
	public List<Article> selectByKeywordPassed(String keyword) {
		return pass(articleDao.selectByKeyword(keyword));
	}

	@Override
	public List<Article> selectByStagePassed(int stage) {
		return pass(articleDao.selectByStage(stage));
	}

	@Override
	public List<Article> selectByTimePassed(Date startTime, Date endTime) {
		return pass(articleDao.selectByTime(startTime, endTime));
	}

	@Override
	public String getFilePathByArticleId(User user, String articleId) {
		return articleDao.getFilePathByArticleId(articleId);
	}

	// 下载权限才能查看带有文件的查询结果
	@Override
	public List<Article> selectAll(User user) {
		if (!qualifiedDownload(user))
			return null;
		return articleDao.selectAll();
	}

	@Override
	public List<Article> selectById(User user, String articleId) {
		if (!qualifiedDownload(user))
			return null;
		return articleDao.selectById(articleId);
	}

	@Override
	public List<Article> selectByUserId(User user, String userId) {
		if (!qualifiedDownload(user))
			return null;
		return articleDao.selectByUserId(userId);
	}

	@Override
	public List<Article> selectByUserName(User user, String name) {
		if (!qualifiedDownload(user))
			return null;
		return articleDao.selectByUserName(name);
	}

	@Override
	public String updateViewer(String article_id, Integer viewer) {
		articleDao.updateViewer(article_id, viewer);
		return "success";
	}

	@Override
	public List<Article> selectAllBetweenManagerGrade(User manager, Integer gradeMin, Integer gradeMax) {
		if (!qualifiedManage(manager))
			return null;
		System.out.println(manager.getGrade());
		int managerGrade = manager.getGrade();
		if (managerGrade < gradeMax)
			gradeMax = managerGrade;// 管理员等级低于请求所需要的等级
		return articleDao.selectAllBetweenManagerGrade(gradeMin, gradeMax);
	}

	@Override
	public List<Article> selectAllBetweenManagerStage(User manager, Integer stageMin, Integer stageMax) {
		if (!qualifiedManage(manager))
			return null;
		System.out.println(manager.getGrade());
		int managerGrade = manager.getGrade();
		if (managerGrade < stageMax)
			stageMax = managerGrade;

		return articleDao.selectAllBetweenManagerGrade(stageMin, stageMax);
	}

	@Override
	public List<Article> selectAllBelowManagerStage(User manager) {
		if (!qualifiedManage(manager))
			return null;
		System.out.println(manager.getGrade()+":"+manager);
		int managerGrade = manager.getGrade();
		if (managerGrade < 2)
			return null;
		/**
		 * 文章状态stage与用户等级权限也有挂钩 级别为2的最低级管理员管理文章状态为0的文章也就是待审核的
		 * 级别为3的管理员审核文章状态为1的也就是初审过了的文章
		 */

		return articleDao.selectAllBetweenArticleStage(managerGrade - 2, managerGrade - 2);
	}
	
	private List<Article> pass(List<Article>articles) {
		for(int i=0;i<articles.size();i++) {
			if(articles.get(i).getStage()<Constant.ARTICLE_PASSED_STAGE) {
				articles.remove(i);
			}
		}
		return articles;
	}
}
