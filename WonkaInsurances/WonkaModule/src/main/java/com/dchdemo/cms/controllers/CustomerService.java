package com.dchdemo.cms.controllers;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;

import info.magnolia.cms.security.User;
import info.magnolia.context.MgnlContext;

@Path("/customer")
public class CustomerService {

	@GET
	public Response getCustomerData(){
		
		int status = HttpStatus.SC_OK;
		String output = "";
		
		try{
			
			User user = MgnlContext.getUser();
			String uri = "/api/customer/" + user.getName();
			
			output = ApiGatewayUtil.getDataFromGateway(uri);
			if( StringUtils.isEmpty(output) ){
				status = HttpStatus.SC_NOT_FOUND;
			}
		
		}catch(Exception ex){
			status = HttpStatus.SC_INTERNAL_SERVER_ERROR;
		}
		
		return Response
				.status(status)
				.entity(output)
				.build();
	}
}
