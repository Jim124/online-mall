package com.mindark.onlinemall.util;


import lombok.extern.slf4j.Slf4j;
import org.springframework.web.client.RestTemplate;

@Slf4j
public class HttpUtil {

    public static String getNaMiData(String url){
        /*WebClient webClient = WebClient.create();
        WebClient.ResponseSpec responseSpec = webClient.get()
                .uri(url)
                .retrieve();
        String result = responseSpec.bodyToMono(String.class).block();*/
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(url,String.class);
    }


}
