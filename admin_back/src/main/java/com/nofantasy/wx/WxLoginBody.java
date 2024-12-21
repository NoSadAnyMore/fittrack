package com.nofantasy.wx;

/**
 * @Author jeremy 17344995941@163.com
 * @Description :com.nofantasy.project.wx
 * @Date:Created in   2024/12/5
 */
public class WxLoginBody
{
    /**
     * 临时登陆凭证 code 只能使用一次
     */
    private String code;

    /**
     * 偏移量
     */
    private String encryptedIv;

    /**
     * 加密数据
     */
    private String encryptedData;

    /**
     * 微信头像
     * */

    private String avatarUrl;

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getEncryptedIv() {
        return encryptedIv;
    }

    public void setEncryptedIv(String encryptedIv) {
        this.encryptedIv = encryptedIv;
    }

    public String getEncryptedData() {
        return encryptedData;
    }

    public void setEncryptedData(String encryptedData) {
        this.encryptedData = encryptedData;
    }
}