package renxuan.journal_biz.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import renxuan.journal_biz.biz.UserBiz;
import renxuan.journal_dao.dao.UserDao;
import renxuan.journal_dao.entity.User;
import renxuan.journal_dao.global.Constant;

@Service("UserBiz")
public class UserBizImp implements UserBiz{

	@Autowired
	private UserDao userdao;
	@Override
	public String upgrade(User operatorUser, User user) {
		return upgrade(operatorUser.getUser_id(), user);
	}

	@Override
	public String upgrade(String opeatorUserId, User user) {
		
		int operatorGrade=userdao.selectById(opeatorUserId).get(0).getGrade();
		int userGrade=userdao.selectById(user.getUser_id()).get(0).getGrade();
		if(operatorGrade>userGrade||opeatorUserId.equals(user.getUser_id()) ){
			try {
				userdao.update(user);
			}catch (Exception e) {
			e.printStackTrace();
			System.out.println();
			return "修改失败"+e.getMessage();
			}
			
			return "success";
		}else {
			return "无权更改";//没有权限更改
		}
		
	}

	@Override
	public String add(User user) {
		try {
		user.setChecked(Constant.USER_WAITCHECKED_STATE);
		user.setGrade(Constant.USER_GRADE_OF_LOWEST);
		user.setDepartment("游客团队");
		userdao.insert(user);
		}catch (Exception e) {
			e.printStackTrace();
			return "添加失败"+e.getMessage();
		}
		return "success";
	}

	@Override
	public void delete(User operatorUser, String id) {
		int operatorGrade=userdao.selectById(operatorUser.getUser_id()).get(0).getGrade();
		int userGrade=userdao.selectById(id).get(0).getGrade();
		if(operatorGrade<=userGrade)return;//没有权限更改
		userdao.deleteById(id);;
		
	}

	@Override
	public void setGreade(User operatorUser, String id, int grade) {
		int operatorGrade=userdao.selectById(operatorUser.getUser_id()).get(0).getGrade();
		User user=userdao.selectById(id).get(0);
		int userGrade=user.getGrade();
		if(1+operatorGrade<=userGrade)return;//没有权限更改，而且必须是上上级才能操作
		user.setGrade(grade);
		userdao.update(user);
		
	}

	@Override
	public void setGreade(User operatorUser, User user, int grade) {
		int operatorGrade=userdao.selectById(operatorUser.getUser_id()).get(0).getGrade();
		int userGrade=user.getGrade();
		if(1+operatorGrade<=userGrade)return;//没有权限更改，而且必须是上上级才能操作
		user.setGrade(grade);
		userdao.update(user);
	}

	@Override
	public List<User> selectAll() {
		return userdao.selectAll();
		
	}

	@Override
	public List<User> selectUserById(String userId) {
		
		return userdao.selectById(userId);
	}

	@Override
	public List<User> selectAllBelowGrade(User operatorUser) {
		User operator=userdao.selectById(operatorUser.getUser_id()).get(0);
		int operatorGrade=operator.getGrade();
		if(operatorUser.getGrade()==Constant.USER_GRADE_OF_LOWEST)return null;
		List<User> resultSelect=userdao.selectAll();
		List<User> resultReturn=new ArrayList<>();
		for(User user:resultSelect) {
			if(user.getGrade()<operatorGrade) {
				resultReturn.add(user);
			}
		}
		return resultReturn;
		
	}
	
	@Override
	public List<User> selectAllBelowTwoGrade(User operatorUser) {
		User operator=userdao.selectById(operatorUser.getUser_id()).get(0);
		int operatorGrade=operator.getGrade();
		if(operatorUser.getGrade()==Constant.USER_GRADE_OF_LOWEST)return null;
		List<User> resultSelect=userdao.selectAll();
		List<User> resultReturn=new ArrayList<>();
		for(User user:resultSelect) {
			if(user.getGrade()<operatorGrade) {
				resultReturn.add(user);
			}
		}
		return resultReturn;
		
	}
	
	@Override
	public List<User> selectUserById(User operatorUser, String userId) {
		User operator=userdao.selectById(operatorUser.getUser_id()).get(0);
		int operatorGrade=operator.getGrade();
		if(operatorUser.getGrade()==Constant.USER_GRADE_OF_LOWEST)return null;
		List<User> resultSelect=userdao.selectById(userId);
		List<User> resultReturn=new ArrayList<>();
		for(User user:resultSelect) {
			if(user.getGrade()<operatorGrade) {
				resultReturn.add(user);
			}
		}
		return resultReturn;
	}

	@Override
	public void setChecked(User operatorUser, String id, int checked) {
		User operator=userdao.selectById(operatorUser.getUser_id()).get(0);
		int operatorGrade=operator.getGrade();
		User user=userdao.selectById(id).get(0);
		int userGrade=user.getGrade();
		if(operatorGrade>userGrade)return;//没有权限更改，而且必须是上上级才能操作
		user.setChecked(checked);
		userdao.update(user);
		
	}

	@Override
	public void setChecked(User operatorUser, User user, int checked) {
		setChecked(operatorUser, user.getUser_id(), checked);
	}

	@Override
	public void setCheckedPass(User operatorUser, String id) {
		setChecked(operatorUser, id, Constant.USER_PASSCHECKED_STATE);
		
	}

	@Override
	public void setCheckedPass(User operatorUser, User user) {
		setChecked(operatorUser, user.getUser_id(), Constant.USER_PASSCHECKED_STATE);
		
	}

}
