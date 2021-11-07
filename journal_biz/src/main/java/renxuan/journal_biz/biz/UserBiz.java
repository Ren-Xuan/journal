package renxuan.journal_biz.biz;

import java.util.List;

import renxuan.journal_dao.entity.User;

public interface UserBiz {
	public String upgrade(User operatorUser,User user);
	public String upgrade(String opeatorUserId,User user);
	public String add(User user);
	public void delete(User operatorUser,String id);
	public void setGreade(User operatorUser,String id,int grade);
	public void setGreade(User operatorUser,User user,int grade);
	public void setChecked(User operatorUser,String id,int checked);
	public void setChecked(User operatorUser,User user,int checked);
	public void setCheckedPass(User operatorUser,String id);
	public void setCheckedPass(User operatorUser,User user);
	public List<User> selectAll();
	public List<User> selectUserById(String userId);
	public List<User> selectAllBelowGrade(User operatorUser);
	public List<User> selectAllBelowTwoGrade(User operatorUser);
	public List<User> selectUserById(User operatorUser,String userId);
}
