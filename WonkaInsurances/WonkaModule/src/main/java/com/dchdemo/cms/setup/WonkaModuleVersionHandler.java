package com.dchdemo.cms.setup;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.glassfish.jersey.servlet.ServletContainer;

import info.magnolia.module.DefaultModuleVersionHandler;
import info.magnolia.module.InstallContext;
import info.magnolia.module.delta.NodeExistsDelegateTask;
import info.magnolia.module.delta.RegisterServletTask;
import info.magnolia.module.delta.Task;
import info.magnolia.module.model.ServletDefinition;
import info.magnolia.module.model.ServletParameterDefinition;

/**
 * This class is optional and lets you manage the versions of your module,
 * by registering "deltas" to maintain the module's configuration, or other type of content.
 * If you don't need this, simply remove the reference to this class in the module descriptor xml.
 *
 * @see info.magnolia.module.DefaultModuleVersionHandler
 * @see info.magnolia.module.ModuleVersionHandler
 * @see info.magnolia.module.delta.Task
 */
public class WonkaModuleVersionHandler extends DefaultModuleVersionHandler {
	
	@Override
    protected List<Task> getStartupTasks(InstallContext ctx) {
        
		List<Task> listOfTasks = new ArrayList<Task>();
		
		listOfTasks.add(newJerseyWebServlet());
		return listOfTasks;
		
    }
	
	@SuppressWarnings("rawtypes")
	private Task newJerseyWebServlet(){
		
		String servletName = "Jersey Web Application";
		String servletMappingUrl = "/.api/*";
		Class servletClass = ServletContainer.class;
		
		Map<String, String> parameters = new HashMap<String,String>();
		parameters.put("jersey.config.server.provider.packages", "com.dchdemo.cms.controllers");
		
		Task newServletTask = registerNewServlet( servletName, servletClass, servletMappingUrl, servletName, parameters );
		return newServletTask;
	}
	
	@SuppressWarnings("rawtypes")
	private Task registerNewServlet( String name, Class servletClass, String mappingUrl, String comments, Map<String, String> parameters ){
		
		ServletDefinition servletDefinition = new ServletDefinition();
		servletDefinition.setName(name);
		servletDefinition.setClassName(servletClass.getCanonicalName());
		servletDefinition.setComment(comments);
		servletDefinition.addMapping(mappingUrl);
		
		if( parameters != null && !parameters.isEmpty() ){
		
			Set<String> keys = parameters.keySet();
			for (String paramKeys : keys) {
				
				String paramValues = parameters.get(paramKeys);
				ServletParameterDefinition paramDefination = new ServletParameterDefinition();
				paramDefination.setName(paramKeys);
				paramDefination.setValue(paramValues);
				
				servletDefinition.addParam(paramDefination);
			}
		
		}
		
		RegisterServletTask registerTask = new RegisterServletTask(servletDefinition);
		NodeExistsDelegateTask servletExistsTask = new NodeExistsDelegateTask( "Register " + name + " servlet", "/server/filters/servlets/" + name, null, registerTask );
		
		return servletExistsTask;
	}
	
}