package com.springmvcmybatis.java.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.springmvcmybatis.java.model.Employee;
import com.springmvcmybatis.java.util.MyBatisUtil;
@Repository
public class EmployeeMapper 
{
	public List<Employee> getAllEmployee()
	{
		SqlSession session=MyBatisUtil.getSqlSessionFactory().openSession();
		List<Employee> employeeList=session.selectList("getAllEmployee");
		session.commit();
		session.close();
		return employeeList;
		
	}
	public void saveEmployee(Employee employee) {
		SqlSession session=MyBatisUtil.getSqlSessionFactory().openSession();
		session.insert("insertemployee", employee);
		session.commit();
		session.close();
	}
	public void deleteEmployee(int employeeId)
	{
		SqlSession session=MyBatisUtil.getSqlSessionFactory().openSession();
		session.delete("deleteEmployee", employeeId); 
		session.commit();
		session.close();
	}
	public Employee findById(int employeeId)
	{
		SqlSession session=MyBatisUtil.getSqlSessionFactory().openSession();
		Employee employee=(Employee)session.selectOne("findById", employeeId);//this will give the employee object
		session.commit();
		session.close();
		return employee;
	}
}
