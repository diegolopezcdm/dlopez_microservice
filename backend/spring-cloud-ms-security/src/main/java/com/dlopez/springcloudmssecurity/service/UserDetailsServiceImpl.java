package com.dlopez.springcloudmssecurity.service;

import java.util.List;

import com.dlopez.springcloudmssecurity.bean.Usuario;
import com.dlopez.springcloudmssecurity.repository.UserDetailDaoInterface;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    
    @Autowired
    private UserDetailDaoInterface userdao;
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = userdao.getUsuario(username);
        if(usuario!=null) {
        List<GrantedAuthority> grantedAuthorities = AuthorityUtils.commaSeparatedStringToAuthorityList("ROLE_ADMIN");
        return new User(usuario.getUsername(), encoder.encode(usuario.getPassword()), grantedAuthorities);
        }
        // TODO Auto-generated method stub
        throw new UsernameNotFoundException("username not found");
    }
}