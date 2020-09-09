package com.ram.goreureuk.member;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;

public class CustomAuthenticationProvider implements AuthenticationProvider{

	@Autowired
	private CustomUserDetailsService userDeSer;
	
	@SuppressWarnings("unchecked")
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();
        
        CustomUserDetails user = (CustomUserDetails) userDeSer.loadUserByUsername(username);
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
        
        if(!matchPassword(password, user.getPassword())) {
            throw new BadCredentialsException(username);
        }
 
        if(!user.isEnabled()|| !user.isCredentialsNonExpired()) {
            throw new AuthenticationCredentialsNotFoundException(username);
        }
        
        return new UsernamePasswordAuthenticationToken(username, password, authorities);
	}

	private boolean matchPassword(String loginPwd, String password) {
		return loginPwd.equals(password);
	}

	@Override
	public boolean supports(Class<?> authentication) {

		return true;
	}

}
