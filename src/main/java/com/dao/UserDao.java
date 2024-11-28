package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean register(User u) {
		boolean f = false;

		try {
			String sql = "INSERT INTO user_dtls (full_name, email, password, age, phone_number, address, gender) VALUES (?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setInt(4, u.getAge());
			ps.setString(5, u.getPhoneNumber());
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getGender());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User login(String em, String psw) {
		User u = null;

		try {
			String sql = "select * from user_dtls where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));               // Assuming the ID is in the first column
				u.setFullName(rs.getString(2));       // Assuming Full Name is in the second column
				u.setEmail(rs.getString(3));          // Assuming Email is in the third column
				u.setPassword(rs.getString(4));       // Assuming Password is in the fourth column
				u.setAge(rs.getInt(5));               // Assuming Age is in the fifth column
				u.setPhoneNumber(rs.getString(6));    // Assuming Phone Number is in the sixth column
				u.setAddress(rs.getString(7));        // Assuming Address is in the seventh column
				u.setGender(rs.getString(8));         // Assuming Gender is in the eighth column
			}


		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}
	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from user_dtls where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update user_dtls set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public boolean isEmailUsed(String email) {
		boolean f = false;
		try {
			String sql = "select * from user_dtls where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean editUserProfile(User user) {
		boolean f = false;
		try {
			System.out.println("Attempting to update user profile for user ID: " + user.getId());
			String sql = "UPDATE user_dtls SET full_name=?, email=?, password=?, age=?, phone_number=?, address=?, gender=? WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setInt(4, user.getAge());
			ps.setString(5, user.getPhoneNumber());
			ps.setString(6, user.getAddress());
			ps.setString(7, user.getGender());
			ps.setInt(8, user.getId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
				System.out.println("User profile updated successfully for user ID: " + user.getId());
			} else {
				System.out.println("Failed to update user profile for user ID: " + user.getId());
			}
		} catch (Exception e) {
			System.out.println("Error updating user profile: " + e.getMessage());
			e.printStackTrace();
		}
		return f;
	}


	public User getUserById(int id) {
		User user = null;
		try {
			System.out.println("Fetching user with ID: " + id);
			String sql = "SELECT * FROM user_dtls WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User(
						rs.getString("full_name"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getInt("age"),
						rs.getString("phone_number"),
						rs.getString("address"),
						rs.getString("gender")
				);
				user.setId(rs.getInt("id"));
				System.out.println("User fetched successfully for ID: " + id);
			} else {
				System.out.println("No user found for ID: " + id);
			}
		} catch (Exception e) {
			System.out.println("Error fetching user by ID: " + e.getMessage());
			e.printStackTrace();
		}
		return user;
	}

	public List<User> getAllUser() {
		List<User> list = new ArrayList<User>();
		User d = null;
		try {

			String sql = "select * from user_dtls order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new User();
				d.setId(rs.getInt(1));
				d.setFullName(rs.getString(2));
				d.setEmail(rs.getString(3));
				d.setPassword(rs.getString(4));
				list.add(d);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean deleteUser(int id) {
		boolean f = false;
		try {
			String sql = "delete from user_dtls where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}