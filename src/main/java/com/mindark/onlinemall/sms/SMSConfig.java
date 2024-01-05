package com.mindark.onlinemall.sms;

import lombok.Data;
import lombok.Getter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "sms")
@Data
@Getter
public class SMSConfig {
    private String content;
    private String apiKey;
    private String url;
    private String chinaContent;
    private int maxCount;
}
