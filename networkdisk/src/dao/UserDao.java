package dao;

import util.DaoSupport;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import model.User;

public class UserDao {
	
	/**
	 * @param user
	 * @return
	 */
	public static User load(User user){
		String sql = "select * from user where email = ? and password = md5(?)";
		Object param[] = {user.getEmail(),user.getPassword()};
		return (User) DaoSupport.queryOne(sql, param, User.class);
	}
	
	/**
	 * @param username
	 * @return
	 */
	public static User loadByUsername(String username){
		String sql = "select * from user where username = ?";
		Object param[] = {username};
		return (User) DaoSupport.queryOne(sql, param, User.class);
	}
	
	/**
	 * @param username
	 * @return
	 */
	public static User loadById(long id){
		String sql = "select * from user where id = ?";
		Object param[] = {id};
		return (User) DaoSupport.queryOne(sql, param, User.class);
	}
	
	/**
	 * @param user
	 * @return
	 */
	public static long save(User user){
		String sql = "insert into user (email,username,password,joindate,gender,portrait) values(?,?,md5(?),?,?,'portrait')";
		Object params[] = {user.getEmail(),user.getUsername(),user.getPassword(),user.getJoindate(),user.getGender()};
		return DaoSupport.save(sql, params);
	}
	
	/**
	 * 通过email或者手机号 加password验证用户的存在
	 * @param user
	 * @return
	 */
	public static User confirm(User user){
		//判断是邮箱还是电话
		String regExp = "^[1]([3][0-9]{1}|59|58|88|89)[0-9]{8}$";
		Pattern p = Pattern.compile(regExp);
		Matcher m = p.matcher(user.getEmail());
		if(m.find()){
			//如果是手机号
			String sql = "select * from user where tel = ?";
			Object[] param = {user.getEmail()};
			User u = (User)DaoSupport.queryOne(sql, param, User.class);
			//验证验证码
			if(u!=null){
				//todo
			}
			return u;
			
		}else{
			//否则是邮箱登录
			String sql = "select * from user where email = ? and password = md5(?)";
			Object[] param = {user.getEmail(),user.getPassword()};
			User u = (User)DaoSupport.queryOne(sql, param, User.class);
			return u;
		}
		
		
		
	}
	
	/**
	 * 验证用户名是否存在，存在则返回"0"，不存在返回"1" 
	 * @param username
	 * @return
	 */
	public static String confirmUsername(String username){
		String sql = "select count(*) from user where username='" + username + "'";
		Long count = (Long) DaoSupport.query(sql);
		String result;
		if(count > 0){
			result = "0";
		}else{
			result = "1";
		}
		return result;
	}
	
	/**
	 * 验证email是否存在，存在则返回"0"，不存在返回"1" 
	 * @param email
	 * @return
	 */
	public static String confirmEmail(String email){
		String sql = "select count(*) from user where email='" + email + "'";
		Long count = (Long) DaoSupport.query(sql);
		String result;
		if(count > 0){
			result = "0";
		}else{
			result = "1";
		}
		return result;
	}
	
	/**
	 * 更新用户名
	 * @param user
	 */
	public static void updateUsername(User user){
		String sql = "update user set username=? where id = ?";
		Object params[] = {user.getUsername(),user.getId()};
		DaoSupport.update(sql, params);
	}
	
	/**
	 * 更改Email
	 * @param user
	 */
	public static void updateEmail(User user){
		String sql = "update user set email = ? where id = ?";
		Object params[] = {user.getEmail(),user.getId()};
		DaoSupport.update(sql, params);
	}
	
	/**
	 * 更改password
	 * @param user
	 */
	public static void updatePassword(User user){
		String sql = "update user set password = md5(?) where id = ?";
		Object params[] = {user.getPassword(),user.getId()};
		DaoSupport.update(sql, params);
	}
	
	/**
	 * @param uId
	 */
	public static void updatePortrait(Long uId){
		String sql = "update user set portrait = ? where id = ?";
		Object params[] = {uId+"",uId};
		DaoSupport.update(sql, params);
	}
}
