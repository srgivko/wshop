package by.lodochkina.wshop.site.security;

import by.lodochkina.wshop.site.dto.CaptchaResponseDto;

public interface CaptchaService {
    CaptchaResponseDto checkCaptcha(String captchaResponse);
}
