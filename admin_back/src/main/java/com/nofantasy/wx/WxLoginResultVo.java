package com.nofantasy.wx;

/**
 * @Author jeremy 17344995941@163.com
 * @Description :com.nofantasy.wx
 * @Date:Created in   2024/12/5
 */
 public class WxLoginResultVo {

    /**
     * 会话密钥
     **/
    private String session_key;

    /**
     * 用户在开放平台的唯一标识符，若当前小程序已绑定到微信开放平台帐号下会返回
     **/
    private String unionid;

    /**
     * 错误信息
     **/
    private String errmsg;

    /**
     * 用户唯一标识 目前只用到这个返回数据
     **/
    private String openid;

    /**
     * 错误码
     **/
    private int errcode;

    public String getSession_key() {
        return session_key;
    }

    public void setSession_key(String session_key) {
        this.session_key = session_key;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public int getErrcode() {
        return errcode;
    }

    public void setErrcode(int errcode) {
        this.errcode = errcode;
    }
}
