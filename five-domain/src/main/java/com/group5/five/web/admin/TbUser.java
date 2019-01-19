package com.group5.five.web.admin;

import com.group5.five.commons.validator.utils.RegexpUtils;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Pattern;
import java.util.Date;

@Data
public class TbUser {

    private Long id;
    @Length(min = 1,max = 16,message = "用户名必须在1-16之间!")
    private String username;
    @Length(min = 1,max = 16,message = "密码必须在1-16之间!")
    private String password;
    @Pattern(regexp = RegexpUtils.EMAIL,message = "请输入正确的邮箱!")
    private String email;
    @Pattern(regexp = RegexpUtils.PHONE,message = "请输入正确的手机号码!")
    private String phone;
    private Date created;
    private Date updated;
}
