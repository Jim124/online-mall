package com.mindark.onlinemall.result;

public class CodeMsg {
    private int code;
    private String msg;

    //common error
    public static CodeMsg SUCCESS = new CodeMsg(0,"success");
    public static CodeMsg SERVER_ERROR = new CodeMsg(500100,"server error");

    public static CodeMsg BIND_ERROR = new CodeMsg(500101,"para is not correct: %s");

    //login module 5002XX
    public static CodeMsg SIGN_IN = new CodeMsg(500210,"please sign in");
    public static CodeMsg PASSWORD_EMPTY = new CodeMsg(500211,"password can not be empty");
    public static CodeMsg MOBILE_EMPTY = new CodeMsg(500212,"mobile can not be empty");

    public static CodeMsg PASSWORD_ERROR = new CodeMsg(500213,"password is not correct, please try again!");
    public static CodeMsg MOBILE_NOT_EXIST = new CodeMsg(500214,"mobile is not exist");
    public static CodeMsg MOBILE_EXIST = new CodeMsg(500215,"mobile has already existed, please try another mobile");

    //sms
    public static CodeMsg SMS_CODE_NOT_EXIST = new CodeMsg(500310,"verify code is not exist, please try again");
    public static CodeMsg SMS_CODE_ERROR = new CodeMsg(500311,"verify code is incorrect, please try again");
    public static CodeMsg SMS_CODE_SEND_ERROR = new CodeMsg(500312,"message sends error, please try again");
    public static CodeMsg SMS_CODE_LIMIT = new CodeMsg(500313,"you cannot send message again, please try tomorrow");

    //img
    public static CodeMsg IMG_UPLOAD_ERROR = new CodeMsg(500410,"image uploads error, please try again");


    private CodeMsg(int code,String msg){
        this.code = code;
        this.msg = msg;
    }
    public int getCode() {
        return code;
    }


    public String getMsg() {
        return msg;
    }

    public CodeMsg fillArgs(Object...args){
        int code = this.code;
        String message = String.format(this.msg,args);
        return new CodeMsg(code,message);
    }


}
