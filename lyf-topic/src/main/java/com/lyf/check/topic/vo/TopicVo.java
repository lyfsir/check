package com.lyf.check.topic.vo;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author lyf
 * @date 2020/8/19-2:06
 */
@Data
public class TopicVo {
    private Integer id;
    /**
     * 话题内容
     */
    @NotNull
    private String content;
    /**
     * 话题状态(0显示，1不显示)
     */
    private Integer status;
    /**
     * 发表时间
     */
    private String createTime;
    /**
     * 用户id
     */
    private Integer uid;

    //用户名称
    @NotNull
    private String userName;
    @NotNull
    private List<ImagesVo> images;
}
