package com.ballet.allonge.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing // entity의 생성일시와 수정일시를 자동화하는 용도
@Configuration
public class JpaConfig {
}
