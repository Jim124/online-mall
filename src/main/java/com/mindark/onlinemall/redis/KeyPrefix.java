package com.mindark.onlinemall.redis;

public interface KeyPrefix {
    public int expireSeconds();
    public String getPreFix();

}
