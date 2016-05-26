package com.dchdemo.cms.controllers;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class ApiGatewayUtil {

	private static String urlGateway;
	
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
    	
    	// Create a custom response handler
        ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

            @Override
            public String handleResponse( final HttpResponse response	) throws ClientProtocolException, IOException {
                int status = response.getStatusLine().getStatusCode();
                if (status >= 200 && status < 300) {
                	
                    HttpEntity entity = response.getEntity();
                    return entity != null ? EntityUtils.toString(entity) : null;
                    
                } else {
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            }

        };

        String responseBody = httpclient.execute(httpget, responseHandler);
        return responseBody;
    	
    }
}
