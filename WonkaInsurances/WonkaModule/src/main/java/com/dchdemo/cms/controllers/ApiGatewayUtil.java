package com.dchdemo.cms.controllers;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

public class ApiGatewayUtil {

	private static String urlGateway;
	private static CommonResponseHandler responseHandler = new CommonResponseHandler();
	
	static{
		init();
	}
	
	private static void init(){
		
		urlGateway = System.getProperty( "ISB_URL" );
        if (urlGateway == null || urlGateway.isEmpty()) {
        	urlGateway = "http://localhost:8080";
        }
	}
	
	public static String getDataFromGateway( String uri ) throws Exception {
    	
    	CloseableHttpClient httpclient = HttpClients.createDefault();
    	HttpGet httpget = new HttpGet( urlGateway + uri );
    	httpget.addHeader("Accept", "application/json");
    	
        String responseBody = httpclient.execute(httpget, responseHandler);
        return responseBody;
    	
    }
	
	public static String putDataToGateway( String uri, String jsonBody ) throws Exception {
    	
    	CloseableHttpClient httpclient = HttpClients.createDefault();
    	HttpPut httpput = new HttpPut( urlGateway + uri );
    	httpput.addHeader("Accept", "application/json");
    	
    	HttpEntity entity = new StringEntity(jsonBody);
    	httpput.setEntity(entity);

        String responseBody = httpclient.execute( httpput, responseHandler );
        return responseBody;
    	
    }
	
}
