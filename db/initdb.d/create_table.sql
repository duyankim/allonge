/*
 id varchar(20)
 status, event varchar(10) - enum
 그 외 varchar(50)
 */

CREATE TABLE `membership`
(
    `membership_seq`   int          NOT NULL AUTO_INCREMENT             COMMENT '수강권 순번',
    `membership_name`  varchar(50)  NOT NULL                            COMMENT '수강권 이름',
    `count`            int          DEFAULT NULL                        COMMENT '수강권 수, NULL인 경우 무제한',
    `period`           int          DEFAULT NULL                        COMMENT '기간(일), NULL인 경우 무제한',
    `created_at`       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '생성 일시',
    `modified_at`      timestamp    DEFAULT NULL                        COMMENT '수정 일시',
    PRIMARY KEY (`membership_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='수강권';

CREATE TABLE `ticket`
(
    `ticket_seq`        int         NOT NULL AUTO_INCREMENT             COMMENT '1회 이용권 순번',
    `membership_seq`    int         NOT NULL                            COMMENT '수강권 순번',
    `user_id`           varchar(20) NOT NULL                            COMMENT '사용자 ID',
    `status`            varchar(10) NOT NULL                            COMMENT '상태',
    `remaining_count`   int         DEFAULT NULL                        COMMENT '잔여 티켓 수, NULL인 경우 무제한',
    `started_at`        timestamp   NOT NULL                            COMMENT '시작 일시',
    `ended_at`          timestamp   DEFAULT NULL                        COMMENT '종료 일시, NULL인 경우 무제한',
    `expired_at`        timestamp   DEFAULT NULL                        COMMENT '만료 일시',
    `created_at`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '생성 일시',
    `modified_at`       timestamp   DEFAULT NULL                        COMMENT '수정 일시',
    PRIMARY KEY (`ticket_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='1회 이용권';

CREATE TABLE `booking`
(
    `booking_seq`       int         NOT NULL AUTO_INCREMENT             COMMENT '예약 순번',
    `ticket_seq`        int         NOT NULL                            COMMENT '수업쿠폰 순번',
    `user_id`           varchar(20) NOT NULL                            COMMENT '사용자 ID',
    `status`            varchar(10) NOT NULL                            COMMENT '상태',
    `used_ticket`       tinyint(1)  NOT NULL DEFAULT '0'                COMMENT '티켓 사용 여부',
    `attended`          tinyint(1)  NOT NULL DEFAULT '0'                COMMENT '출석 여부',
    `started_at`        timestamp   NOT NULL                            COMMENT '시작 일시',
    `ended_at`          timestamp   NOT NULL                            COMMENT '종료 일시',
    `cancelled_at`      timestamp   DEFAULT NULL                        COMMENT '취소 일시',
    `created_at`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '생성 일시',
    `modified_at`       timestamp   DEFAULT NULL                        COMMENT '수정 일시',
    PRIMARY KEY (`booking_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='예약';

CREATE TABLE `user`
(
    `user_id`           varchar(20) NOT NULL                            COMMENT '사용자 ID',
    `user_name`         varchar(50) NOT NULL                            COMMENT '사용자 이름',
    `status`            varchar(10) NOT NULL                            COMMENT '상태',
    `phone`             varchar(50) DEFAULT NULL                        COMMENT '연락처',
    `meta`              TEXT        DEFAULT NULL                        COMMENT '메타 정보, JSON',
    `created_at`        timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '생성 일시',
    `modified_at`       timestamp   DEFAULT NULL                        COMMENT '수정 일시',
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='사용자';
