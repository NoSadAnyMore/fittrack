package com.nofantasy.common.exception;

/**
 * @Author jeremy 17344995941@163.com
 * @Description :com.nofantasy.common.exception
 * @Date:Created in   2024/12/5
 */
public class MpsException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    /**
     * 错误码
     */
    private Integer code;

    /**
     * 错误提示
     */
    private String message;

    /**
     * 错误明细，内部调试错误
     * <p>
     * 和 {@link CommonResult#getDetailMessage()} 一致的设计
     */
    private String detailMessage;

    /**
     * 空构造方法，避免反序列化问题
     */
    public MpsException() {
    }

    public MpsException(String message) {
        this.message = message;
    }

    public MpsException(String message, Integer code) {
        this.message = message;
        this.code = code;
    }

    public String getDetailMessage() {
        return detailMessage;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public Integer getCode() {
        return code;
    }

    public MpsException setMessage(String message) {
        this.message = message;
        return this;
    }

    public MpsException setDetailMessage(String detailMessage) {
        this.detailMessage = detailMessage;
        return this;
    }
}
