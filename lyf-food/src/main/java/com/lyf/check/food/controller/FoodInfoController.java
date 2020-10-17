package com.lyf.check.food.controller;

import java.util.Arrays;
import java.util.Map;


import com.lyf.check.food.annotation.Login;
import com.lyf.check.food.fegin.SearchFeignService;
import com.lyf.check.food.vo.FoodInfomationVo;
import com.lyf.check.food.vo.GetFoodInfomationVo;
import com.lyf.check.food.vo.UpdatefoodVo;
import com.lyf.common.codeMesg.MyCodemsg;
import com.lyf.common.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.lyf.check.food.entity.FoodInfoEntity;
import com.lyf.check.food.service.FoodInfoService;
import com.lyf.common.utils.R;

/**
 * @author lyf
 * @email 2653155409@qq.com
 * @date 2020-08-03 23:50:50
 */
@RestController
@RequestMapping("food/foodinfo")
public class FoodInfoController {
    @Autowired
    private FoodInfoService foodInfoService;

    @Autowired
    SearchFeignService searchFeignService;

    //查询食物的详情信息
    @RequestMapping("/select/infomation")
    public R selects(@RequestParam Integer foodId) {
        GetFoodInfomationVo infomationVo = foodInfoService.selectInfomation(foodId);
        if (infomationVo != null) {
            return R.ok().put("data", infomationVo);
        } else {
            return R.error(MyCodemsg.FOODNULL_EXCEPTION.getCode(), MyCodemsg.FOODNULL_EXCEPTION.getMsg());
        }
    }

    /**
     * 保存审核通过的信息
     */
    @RequestMapping("/save")
    public R save(@Validated @RequestBody UpdatefoodVo updatefoodVo) {
        foodInfoService.saveall(updatefoodVo);
        return R.ok();
    }

    /**
     * 保存待审核通过的信息
     */
    @Login
    @PostMapping("/save/toaud")
    public R savetoaut(@RequestAttribute("userId") Integer userId,
                       @Validated @RequestBody FoodInfomationVo infomationVo) throws Exception {
        infomationVo.setUserId(Integer.valueOf(userId));
        foodInfoService.savealltoaut(infomationVo);
        return R.ok();
    }

    /**
     * 获取auditing为1的分页列表(待审核)
     */
    @RequestMapping("/list/{num}")
    public R list(@RequestParam Map<String, Object> params,
                  @PathVariable Integer num) {

        PageUtils page = foodInfoService.queryPage(params, num);

        return R.ok().put("page", page);
    }

    /**
     * 获取审核通过的列表
     */
    @GetMapping("/list/to")
    public R listto(@RequestParam Map<String, Object> params) {
        PageUtils page = foodInfoService.queryPageTo(params);
        return R.ok().put("page", page);
    }


    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = foodInfoService.queryPage(params);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id) {
        FoodInfoEntity foodInfo = foodInfoService.getById(id);

        return R.ok().put("foodInfo", foodInfo);
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody FoodInfoEntity foodInfo) {
        foodInfoService.updateById(foodInfo);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R deletes(@RequestBody Integer[] ids) {
        R r = searchFeignService.delfoods(ids);
        if ((int) r.get("code") == 0) {
            foodInfoService.removeByIds(Arrays.asList(ids));
            return R.ok();
        } else {
            return R.error((Integer) r.get("code"), (String) r.get("msg"));
        }
    }

    /**
     * 审核不通过
     */
    @RequestMapping("/del")
    public R delete(@RequestBody Integer[] ids) {

        foodInfoService.removeByIds(Arrays.asList(ids));
        return R.ok();

    }

}
