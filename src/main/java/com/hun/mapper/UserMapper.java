package com.hun.mapper;

import com.hun.model.User;

public interface UserMapper {
	User findByUsername(String username);
}
