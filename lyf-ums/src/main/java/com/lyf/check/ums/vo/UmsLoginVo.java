package com.lyf.check.ums.vo;

import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * @author lyf
 * @date 2020/6/24-1:51
 */
@Data
public class UmsLoginVo {
    @NotNull
    private String user;
    @NotNull
    private String password;
}
