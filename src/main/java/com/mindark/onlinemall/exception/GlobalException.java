package com.mindark.onlinemall.exception;


import com.mindark.onlinemall.result.CodeMsg;

public class GlobalException extends RuntimeException{
    private CodeMsg cms;

    public GlobalException(CodeMsg cms) {
        super(cms.toString());
        this.cms = cms;

    }
    public CodeMsg  getCms(){
        return cms;
    }
}
