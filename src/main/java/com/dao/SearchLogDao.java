package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.SearchLogBean;

@Repository
public class SearchLogDao {

	@Autowired
	JdbcTemplate stmt; // query run

	public List<SearchLogBean> getAllLogs() {
		return stmt.query("select s.searchId, s.name , u.firstName from search_log s , users u where s.userId = u.id",
				new BeanPropertyRowMapper<>(SearchLogBean.class));
	}
}