package com.udeve.request;
/**
 * +----------------------------------------------------------------------
 * | 友得云客  - 开启房产营销新纪元
 * +----------------------------------------------------------------------
 * | Copyright (c) 2019~2023 优得（西安）信息科技有限公司版权所有
 * +----------------------------------------------------------------------
 * | Licensed 友得云客不是自有软件 未经允许不可移除相关版权
 * +----------------------------------------------------------------------
 * | Author: www.youdeyunke.com
 * +----------------------------------------------------------------------
 */

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
public class AdminAnswerCreateRequest implements Serializable {
    @NotNull(message = "userId不能为空")
    @Schema(description = "用户id", example = "1")
    public Integer userId;
    @NotBlank(message = "content不能为空")
    @Schema(description = "回答内容", example = "回答内容")
    public String content;
    @NotNull(message = "questionId不能为空")
    @Schema(description = "问题id", example = "1")
    public Integer questionId;

}
