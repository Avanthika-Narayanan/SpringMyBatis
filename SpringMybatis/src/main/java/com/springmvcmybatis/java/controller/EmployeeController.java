package com.springmvcmybatis.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.springmvcmybatis.java.dao.EmployeeMapper;
import com.springmvcmybatis.java.model.Employee;

@Controller
public class EmployeeController  {
	@Autowired
	EmployeeMapper employeeMapper;
	
    @RequestMapping("/")
     	public ModelAndView index() 
    {
    	ModelAndView mav=new ModelAndView("list-employee");
    	mav.addObject("listemployee", employeeMapper.getAllEmployee());//{ key,value} for jsp for each loop
    	return mav;
    }
    
    @RequestMapping("/showFormForAddemployee")
    public ModelAndView showform()
    {
    	ModelAndView mav=new ModelAndView("add-employee");
    			mav.addObject("employee", new Employee());
    	return mav;
    }
    
    
    @RequestMapping("/saveprocess")
    public String saveProcess(@ModelAttribute("employee")Employee employee)
    {
    	//System.out.println("employee object: " + employee );
    	employeeMapper.saveEmployee(employee);
    	return"redirect:/";
    	
    }
    
    @RequestMapping("/deleteemployee")
    public String deleteEmployee(@RequestParam("employeeId")int employeeId)
    {
    	//System.out.println("delete employee:" + employeeId);
    	employeeMapper.deleteEmployee(employeeId);
    	return"redirect:/";
    }
    @RequestMapping("/updatemployee")
    public ModelAndView editEmployee(@RequestParam("employeeId")int employeeId)
    {
    ModelAndView mav=new ModelAndView("add-employee");
    Employee employee=employeeMapper.findById(employeeId);
    mav.addObject("employee", employee);
    return mav;
    
    }
    
    
    
    
    
    
    
    
//    	System.out.println(employeeMapper.getAllEmployee());
//    	return "list-employee";
//		
//    	protected void doGet(HttpServletRequest request , HttpServletResponse response)throws ServletException,IOException
//    	{
//    		String registerForm = "jsps/list-employee.jsp";
//    		RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
//    		dispatcher.forward(request, response);
//    	}
	
}
