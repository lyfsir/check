/**
 * Copyright (c) 2016-2019 人人开源 All rights reserved.
 *
 * https://www.renren.io
 *
 * 版权所有，侵权必究！
 */

package com.lyf.check.topic.config;

import com.lyf.common.codeMesg.MyCodemsg;
import com.lyf.common.exception.RRException;
import com.lyf.common.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindingResult;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

/**
 * 异常处理器
 *
 * @author Mark sunlightcs@gmail.com
 */
@Slf4j
@RestControllerAdvice
public class RRExceptionHandler {
	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 处理自定义异常
	 */
	@ExceptionHandler(RRException.class)
	public R handleRRException(RRException e){
		R r = new R();
		r.put("code", e.getCode());
		r.put("msg", e.getMessage());

		return r;
	}

	@ExceptionHandler(value = MethodArgumentNotValidException.class)
	public R getExc(MethodArgumentNotValidException e) {
		log.error("实体校验异常" + e.getClass());
		BindingResult result = e.getBindingResult();
		Map<String, String> map = new HashMap<>();
		result.getFieldErrors().forEach((item) -> {
			String message = item.getDefaultMessage();
			String field = item.getField();
			map.put(field, message);
		});
		return R.error(MyCodemsg.VOLATILE_EXCEPTION.getCode(), MyCodemsg.VOLATILE_EXCEPTION.getMsg()).put("data", map);
	}

}
