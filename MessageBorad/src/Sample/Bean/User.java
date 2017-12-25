package Sample.Bean;

import java.io.Serializable;

import javax.ws.rs.QueryParam;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "user")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@QueryParam("userId")
	private Integer userId;
	@QueryParam("nickname")
	private String nickname;
	@QueryParam("username")
	private String username;
	@QueryParam("password")
	private String password;
	@QueryParam("roll")
	private Integer roll;//角色：0为普通用户 1为管理员
	@QueryParam("isRegis")
	private Integer isRegis;//注册时判断是否已被注册
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public Integer getRoll() {
		return roll;
	}
	public void setRoll(Integer roll) {
		this.roll = roll;
	}
	
	public Integer getIsRegis() {
		return isRegis;
	}
	public void setIsRegis(Integer isRegis) {
		this.isRegis = isRegis;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", nickname=" + nickname + ", username=" + username + ", password=" + password
				+ ", roll=" + roll + ", isRegis=" + isRegis + "]";
	}
	
	

}
