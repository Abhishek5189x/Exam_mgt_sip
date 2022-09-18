package com.exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.exam.entity.Subject;

public class SubjectDao {

	static Connection con;

	public SubjectDao(Connection con) {

		this.con = con;

	}

	public ArrayList<Subject> getAllSubjectByUId(int id) {
		ArrayList<Subject> list = new ArrayList<>();

		try {

			String q = "select * from subject where facultyid=?";
			PreparedStatement pst = this.con.prepareStatement(q);
			pst.setInt(1, id);
			ResultSet set = pst.executeQuery();
			while (set.next()) {
				Subject c = new Subject(set.getInt("subId"), set.getString("subName"), set.getInt("facultyid"),
						set.getInt("subYear"), set.getInt("subSem"), set.getInt("subCreadit"));
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public String subNmById(int id) {
		String sub = null;

		try {
			System.out.print("Hello me subNmById try bock");
			String q = "SELECT subName FROM SUBJECT WHERE subId=?";
			System.out.print("----------------" + id);
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, id);
			// Statement pst
			// =con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			// ResultSet rs = pst.executeQuery("SELECT subName FROM SUBJECT WHERE
			// subId=103");
			ResultSet rs = pst.executeQuery();
			rs.next();
			sub = rs.getString(1);
			System.out.println("value  " + rs.getString(1));

		} catch (Exception e) {
			System.out.print("Hello me subNmById catch bock");
			e.printStackTrace();
		}

		return sub;

	}
	
	public int subIdByName(String nm) {
		int sub = 0;

		try {
			System.out.print("Hello me subIdByName try bock");
			String q = "SELECT subId FROM SUBJECT WHERE subName=?";
			System.out.print("----------------" + nm);
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, nm);
			// Statement pst
			// =con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			// ResultSet rs = pst.executeQuery("SELECT subName FROM SUBJECT WHERE
			// subId=103");
			ResultSet rs = pst.executeQuery();
			rs.next();
			sub = rs.getInt(1);
			System.out.println("value is : " + rs.getInt(1));

		} catch (Exception e) {
			System.out.print("Hello me subIdByName catch bock");
			e.printStackTrace();
		}

		return sub;

	}
	public int subYrByName(String nm) {
		int yr = 0;

		try {
			System.out.print("Hello me subYrByName try bock");
			String q = "SELECT subYear FROM SUBJECT WHERE subName=?";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, nm);

			ResultSet rs = pst.executeQuery();
			rs.next();
			yr = rs.getInt(1);
			System.out.println("value is : " + rs.getInt(1));

		} catch (Exception e) {
			System.out.print("Hello me subYrByName catch bock");
			e.printStackTrace();
		}

		return yr;

	}
	// SELECT * FROM SUBJECT WHERE isExam=1 AND subYear=3;
		
}
