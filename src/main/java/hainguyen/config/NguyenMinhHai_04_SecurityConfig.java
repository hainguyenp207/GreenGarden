package hainguyen.config;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Created by Hải on 21/11/16.
 * Cấu hình Spring Security
 * Sử dụng cho chức năng đăng nhập, đăng ký của hệ thống
 * Tất cả các hàm được viết trong cùng một ngày, người viết cùng với lớp đó
 */


@Configuration
@EnableWebSecurity
public class NguyenMinhHai_04_SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable();
        http.headers().frameOptions().disable();

        // Các trang không yêu cầu login
        http.authorizeRequests()
                .antMatchers("/post/**", "/" , "/welcome", "/login", "/logout","/test","/assets/**","/images")
                .permitAll();


        // Trang chỉ dành cho ADMIN
        http.authorizeRequests().
                antMatchers("/admin/**","/category/**").access("hasRole('ROLE_ADMIN')");


        // Khi người dùng đã login, với vai trò XX.
        // Nhưng truy cập vào trang yêu cầu vai trò YY,
        // Ngoại lệ AccessDeniedException sẽ ném ra.
        http.authorizeRequests().and().
                exceptionHandling().accessDeniedPage("/403");

        http.authorizeRequests()
                .and()
                // Cấu hình cho Login Form.
                .formLogin()
                .loginProcessingUrl("/login") // Submit URL
                .loginPage("/login")//
                .defaultSuccessUrl("/admin/edit")//
                .failureUrl("/login?error=true")//
                .usernameParameter("username")//
                .passwordParameter("password")
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/");
    }

    /**
     * Cấu hình cấp phép (quyền) người dùng (authorization).
     *
     * @param auth
     * @throws Exception
     */


    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        // Tạo người dùng mặc định lưu trong bộ nhớ
        auth.inMemoryAuthentication()
                .withUser("spring").password("123").roles("ADMIN");
    }
    // Mã hóa mật khẩu
    @Bean
    public PasswordEncoder passwordEncoder(){
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }
}
