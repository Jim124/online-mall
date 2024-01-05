package com.mindark.onlinemall.config;

import com.alibaba.druid.util.StringUtils;
import com.mindark.onlinemall.domain.TCustomer;
import com.mindark.onlinemall.service.TCustomerService;
import jakarta.annotation.Resource;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

@Service
public class UserArgumentResolver implements HandlerMethodArgumentResolver {
    @Resource
    TCustomerService tCustomerService;
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        Class<?> clazz = parameter.getParameterType();
        return clazz == TCustomer.class;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {

       HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
       HttpServletResponse response =webRequest.getNativeResponse(HttpServletResponse.class);
       String paramToken = request.getParameter(tCustomerService.COOK_NAME_TOKEN);
       String cookieToken = getCookieValue(request,tCustomerService.COOK_NAME_TOKEN);
       String headToken = request.getHeader(tCustomerService.COOK_NAME_TOKEN);
       String token = StringUtils.isEmpty(paramToken)? cookieToken:paramToken;
       if(token == null) {
           token = headToken;
       }
       return tCustomerService.getByToken(response,token);
    }

    private String getCookieValue(HttpServletRequest request, String cookNameToken) {
        Cookie[] cookies = request.getCookies();
        if(cookies != null) {
            for (Cookie cookie:cookies) {
                if(cookie.getName().equals(cookNameToken)){
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
}
