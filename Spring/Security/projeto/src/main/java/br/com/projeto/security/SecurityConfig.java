package br.com.projeto.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

    //método para validar requisições/rotas
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        //configurar http
        http
            .httpBasic()
            .and()
            .authorizeHttpRequests()
            .anyRequest().authenticated();

        return http.build();
    }

    //método para permitir acesso sem precisar de autenticação
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().antMatchers("/");
    }

    //criação de credenciais em memória
    // @Bean
    // public UserDetailsService users() {

    //     //criar usuário do tipo administrador
    //     UserDetails admin = User.builder()
    //     .username("admin")
    //     .password(passwordEncoder().encode("123"))
    //     .roles("ADMIN") //toda role precisa ter as letras em maiusculo
    //     .build();

    //     //criar usuário simples
    //     UserDetails user = User.builder()
    //     .username("user")
    //     .password(passwordEncoder().encode("abc"))
    //     .roles("USER") //toda role precisa ter as letras em maiusculo
    //     .build();

    //     //retorno
    //     return new InMemoryUserDetailsManager(admin, user);
    // }

    //criptografar senha
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
