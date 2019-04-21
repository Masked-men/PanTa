package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.po.Users;

public class DemoDao {
	private static final String JDBC_URL = "jdbc:mysql://47.107.60.42:3306/LoginDemo?serverTimezone=Asia/Shanghai";
	private static final String JDBC_USER = "root";
	private static final String JDBC_PASSWORD = "893210165";
	private static Connection conn = null;

	public DemoDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*
	 * 0为发生错误 1为登陆成功 2为密码错误 3为用户名不存在
	 */
	public int LoginStatus(Users users) {
		try (PreparedStatement pre = conn.prepareStatement("SELECT * FROM tasks WHERE username =?")) {

			pre.setObject(1, users.getUsername());
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				if (rs.getString("pw").equals(users.getPassword())) {
					users.setId(rs.getInt("id"));
					return 1;
				}
				return 2;
			}
			return 3;
		} catch (SQLException e) {
			return 0;
		}
	}

	/*
	 * 0为发生错误 1为用户名未被使用过 2为用户名已存在
	 */
	public int RegistStatus(Users users) {

		try (PreparedStatement pre = conn.prepareStatement("SELECT username FROM tasks WHERE username =?")) {
			pre.setObject(1, users.getUsername());
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
				return 2;
			}
			return 1;
		} catch (SQLException e) {
			return 0;
		}
	}

	public boolean doRegist(Users user) {
		try (PreparedStatement pre = conn.prepareStatement("INSERT INTO tasks(username,pw) VALUES (?,?)")) {
			pre.setObject(1, user.getUsername());
			pre.setObject(2, user.getPassword());
			if (pre.executeUpdate() == 1) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	// public void insertDate(Users user) {
	// try (PreparedStatement pre = conn.prepareStatement("UPDATE tasks SET
	// newLoginTime = ? WHERE id=?")) {
	// Timestamp ts = new Timestamp(System.currentTimeMillis());
	// pre.setTimestamp(1, ts);
	// pre.setInt(2, user.getId());
	// pre.executeUpdate();
	// } catch (SQLException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// }
	//
	// public String getDate(Users user) {
	// try (PreparedStatement pre = conn.prepareStatement("SELECT ? FROM tasks
	// WHERE id=? AND ? IS NOT NULL")) {
	// pre.setObject(1, "lastLoginTime");
	// pre.setObject(2, user.getId());
	// pre.setObject(3, "lastLoginTime");
	// ResultSet rs = pre.executeQuery();
	// if (rs.next()) {
	// Timestamp ts = rs.getTimestamp("lastLoginTime");
	// SimpleDateFormat sdf = new SimpleDateFormat("YYYY年MM月dd日 HH点mm分");
	//
	/// ************************************************有点烂，这里刷新lastLoginTime
	// **********************************************************/
	// pre.setObject(1, "newLoginTime");
	// pre.setObject(2, user.getId());
	// pre.setObject(3, "newLoginTime");
	// ResultSet rs2 = pre.executeQuery();
	// if (rs2.next()) {
	// Timestamp ts2 = rs.getTimestamp("newLoginTime");
	// try (PreparedStatement pre1 = conn
	// .prepareStatement("UPDATE tasks SET lastLoginTime = ? WHERE id=?")) {
	// pre.setTimestamp(1, ts2);
	// pre.setInt(2, user.getId());
	// pre.executeUpdate();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	/// ********************************************************************************************************************************/
	// return sdf.format(ts);
	// }
	// return "公元前2333年";
	// } catch (
	//
	// SQLException e) {
	// e.printStackTrace();
	// return "Geter is erro.";
	// }
	// }
}
