package com.hexagon.springmvc.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class DispatcherApplicationInitializer implements WebApplicationInitializer{
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		context.register(MyMvcConfig.class);
		
		DispatcherServlet dis = new DispatcherServlet(context);
		
		ServletRegistration.Dynamic registration = servletContext.addServlet("dispatcherServlet", dis);
		registration.setLoadOnStartup(1);
		registration.addMapping("/");
		registration.setAsyncSupported(true);
		
	}
}
