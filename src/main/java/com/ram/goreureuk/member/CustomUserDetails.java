package com.ram.goreureuk.member;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails implements UserDetails{

	private static final long serialVersionUID = 1L;
		private String MM_ID;
	    private String MM_PASSWORD;
	    private String MM_AUTH;
	    private boolean MM_ENABLED;
	    private String MM_NAME;
	    
		@Override
		public Collection<? extends GrantedAuthority> getAuthorities() {
			ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
	        auth.add(new SimpleGrantedAuthority(MM_AUTH));
	        return auth;
		}
		@Override
		public String getPassword() {
			// TODO Auto-generated method stub
			return MM_PASSWORD;
		}
		@Override
		public String getUsername() {
			// TODO Auto-generated method stub
			return MM_ID;
		}
		@Override
		public boolean isAccountNonExpired() {
			// TODO Auto-generated method stub
			return true;
		}
		@Override
		public boolean isAccountNonLocked() {
			// TODO Auto-generated method stub
			return true;
		}
		@Override
		public boolean isCredentialsNonExpired() {
			// TODO Auto-generated method stub
			return true;
		}
		@Override
		public boolean isEnabled() {
			// TODO Auto-generated method stub
			return MM_ENABLED;
		}
		public String getMM_NAME() {
			return MM_NAME;
		}
		public void setMM_NAME(String mM_NAME) {
			MM_NAME = mM_NAME;
		}
	    
}
