package com.imooc.dao;

import com.imooc.vo.User;

import java.util.List;

public interface UserDao {
    User getUserByUsername(String username);

    List<String> getPermissionsByUsername(String username);

    List<String> getRolesByUsername(String username);
}
