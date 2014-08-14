

CREATE TABLE IF NOT EXISTS `employe` (
  id integer AUTO_INCREMENT,
  jp_name varchar(100) comment "日本語名",
  en_name varchar(100) comment "英語名",
  face_img varchar(100) comment "顔写真",
  department_id integer comment "部門",
  address varchar(200) comment "住所",
  enter_date varchar(20) comment "入社日",
  leave_date varchar(20) comment "退社日",
  position_id integer comment "職位",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


CREATE TABLE IF NOT EXISTS `department` (
  id integer AUTO_INCREMENT,
  name varchar(100) comment "",
  description text comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `position` (
  id integer AUTO_INCREMENT,
  name varchar(100) comment "",
  description text comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS `admin` (
  id integer AUTO_INCREMENT,
  name varchar(100) comment "",
  password varchar(100) comment "",
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;