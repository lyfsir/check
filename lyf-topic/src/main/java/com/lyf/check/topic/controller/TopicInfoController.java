package com.lyf.check.topic.controller;

import java.util.Arrays;
import java.util.Map;

import com.lyf.check.topic.annotation.Login;
import com.lyf.check.topic.fegin.SearchFeginService;
import com.lyf.check.topic.vo.TopicVo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.lyf.check.topic.entity.TopicInfoEntity;
import com.lyf.check.topic.service.TopicInfoService;
import com.lyf.common.utils.PageUtils;
import com.lyf.common.utils.R;


/**
 * @author lyf
 * @email 2653155409@qq.com
 * @date 2020-08-08 08:55:30
 */
@RestController
@RequestMapping("topic/topicinfo")
public class TopicInfoController {
    @Autowired
    private TopicInfoService topicInfoService;
    @Autowired
    SearchFeginService searchFeginService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = topicInfoService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id) {
        TopicInfoEntity topicInfo = topicInfoService.getById(id);

        return R.ok().put("topicInfo", topicInfo);
    }

    @Login
    @PostMapping("/save/topic")
    public R save(@RequestAttribute("userId") Integer userId,@RequestBody TopicVo topicVo) throws Exception {
        System.out.println(userId);
        topicVo.setUid(Integer.valueOf(userId));
        topicInfoService.savetopic(topicVo);
        // TODO 为空则报401
        return R.ok();
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody TopicInfoEntity topicInfo) {
        topicInfoService.save(topicInfo);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody TopicInfoEntity topicInfo) {
        topicInfoService.updateById(topicInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids) {
        R r = searchFeginService.deltopic(ids);
        if ((int) r.get("code") == 0) {
            topicInfoService.removeByIds(Arrays.asList(ids));
            return R.ok();
        } else {
            return R.error((Integer) r.get("code"), (String) r.get("msg"));
        }

    }

}
