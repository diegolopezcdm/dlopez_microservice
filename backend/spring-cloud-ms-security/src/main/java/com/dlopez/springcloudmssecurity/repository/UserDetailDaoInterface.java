package com.dlopez.springcloudmssecurity.repository;

import com.dlopez.springcloudmssecurity.bean.Usuario;

import org.springframework.stereotype.Repository;

//@Repository
public interface UserDetailDaoInterface {

    public Usuario getUsuario(String username);

}