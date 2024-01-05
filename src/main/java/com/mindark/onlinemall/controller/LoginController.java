package com.mindark.onlinemall.controller;

import com.mindark.onlinemall.form.LoginForm;
import com.mindark.onlinemall.result.Result;
import com.mindark.onlinemall.service.LoginService;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/login")
public class LoginController {

    @Resource
    LoginService loginService;

    @PostMapping(value = "/do-login")
    public Result<Map<String,String>> doLogin(HttpServletResponse response, @RequestBody @Valid LoginForm loginForm){
        Map<String,String> map = loginService.login(response,loginForm);
        return Result.success(map);
    }
}
