package com.dchdemo.cms.controllers;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpStatus;
 
@Path("/policy")
public class PolicyService {
 
	@GET
	@Path("/{polNum}")
	public Response getPolicy (@PathParam("polNum") String polNum ) throws Exception {

		String uri = "/api/policy/" + polNum;
		
		int status = HttpStatus.SC_OK;
		String output = "";
		
		try{
		
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