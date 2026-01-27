package com.kyn.KnowYourNeighborhood.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.kyn.KnowYourNeighborhood.entities.Users;
import com.kyn.KnowYourNeighborhood.repository.UserRepository;

@Configuration
@EnableWebSecurity
@EnableOAuth2Sso
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserRepository userRepository;

    @Autowired
    public SecurityConfig(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .antMatcher("/**")
            .authorizeRequests()
            .antMatchers("/login").permitAll()
            .antMatchers("/register").permitAll()
            .antMatchers("/sign").permitAll()
            .antMatchers("/save").permitAll()
            .antMatchers("/list").permitAll()
            .antMatchers("/", "/login**", "/webjars/**", "/error**").permitAll()
            .antMatchers("/public/**").permitAll()
            .antMatchers("/private/**").authenticated() 
            .anyRequest().authenticated()
         //     .httpBasic()
            .and()
    		.logout()
    		.logoutUrl("/logout")
    		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
    		.clearAuthentication(true)
    		.invalidateHttpSession(true);
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	auth.userDetailsService(username -> {
            Users user = userRepository.findByUsername(username);
            if (user == null) {
                throw new RuntimeException("User not found: " + username);
            }
            return org.springframework.security.core.userdetails.User.builder()
                    .username(user.getUserName())
                    .password(user.getPassword())
                    .roles(user.getRole())
                    .build();
        }).passwordEncoder(new BCryptPasswordEncoder());
    }
    
    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
}