/*
MySQL Data Transfer
Source Host: localhost
Source Database: jeesite
Target Host: localhost
Target Database: jeesite
Date: 2015-06-18 16:26:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) collate utf8_bin NOT NULL default '',
  `VALUE_` varchar(300) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  PRIMARY KEY  (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) collate utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `CALL_PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_NAME_` varchar(255) collate utf8_bin default NULL,
  `ACT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `URL_` varchar(4000) collate utf8_bin default NULL,
  `CONTENT_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTION_` varchar(255) collate utf8_bin default NULL,
  `MESSAGE_` varchar(4000) collate utf8_bin default NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `START_USER_ID_` varchar(255) collate utf8_bin default NULL,
  `START_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `END_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime default NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `DUE_DATE_` datetime default NULL,
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  `CREATE_TIME_` datetime default NULL,
  `LAST_UPDATED_TIME_` datetime default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(64) collate utf8_bin default NULL,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `VALUE_` varchar(255) collate utf8_bin default NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `FIRST_` varchar(255) collate utf8_bin default NULL,
  `LAST_` varchar(255) collate utf8_bin default NULL,
  `EMAIL_` varchar(255) collate utf8_bin default NULL,
  `PWD_` varchar(255) collate utf8_bin default NULL,
  `PICTURE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  `DEPLOY_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `CREATE_TIME_` timestamp NULL default NULL,
  `LAST_UPDATE_TIME_` timestamp NULL default NULL,
  `VERSION_` int(11) default NULL,
  `META_INFO_` varchar(4000) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `HAS_START_FORM_KEY_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `EVENT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTIVITY_ID_` varchar(64) collate utf8_bin default NULL,
  `CONFIGURATION_` varchar(255) collate utf8_bin default NULL,
  `CREATED_` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PARENT_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `SUPER_EXEC_` varchar(64) collate utf8_bin default NULL,
  `ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `IS_ACTIVE_` tinyint(4) default NULL,
  `IS_CONCURRENT_` tinyint(4) default NULL,
  `IS_SCOPE_` tinyint(4) default NULL,
  `IS_EVENT_SCOPE_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `CACHED_ENT_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL default NULL,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `EXCLUSIVE_` tinyint(1) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `RETRIES_` int(11) default NULL,
  `EXCEPTION_STACK_ID_` varchar(64) collate utf8_bin default NULL,
  `EXCEPTION_MSG_` varchar(4000) collate utf8_bin default NULL,
  `DUEDATE_` timestamp NULL default NULL,
  `REPEAT_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_TYPE_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_CFG_` varchar(4000) collate utf8_bin default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `DELEGATION_` varchar(64) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `CREATE_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `TENANT_ID_` varchar(255) collate utf8_bin default '',
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
CREATE TABLE `cms_article` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `category_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '栏目编号',
  `title` varchar(255) collate utf8_unicode_ci NOT NULL COMMENT '标题',
  `link` varchar(255) collate utf8_unicode_ci default NULL COMMENT '文章链接',
  `color` varchar(50) collate utf8_unicode_ci default NULL COMMENT '标题颜色',
  `image` varchar(255) collate utf8_unicode_ci default NULL COMMENT '文章图片',
  `keywords` varchar(255) collate utf8_unicode_ci default NULL COMMENT '关键字',
  `description` varchar(255) collate utf8_unicode_ci default NULL COMMENT '描述、摘要',
  `weight` int(11) default '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime default NULL COMMENT '权重期限',
  `hits` int(11) default '0' COMMENT '点击数',
  `posid` varchar(10) collate utf8_unicode_ci default NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) collate utf8_unicode_ci default NULL COMMENT '自定义内容视图',
  `view_config` text collate utf8_unicode_ci COMMENT '视图配置',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章表';

-- ----------------------------
-- Table structure for cms_article_data
-- ----------------------------
CREATE TABLE `cms_article_data` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `content` text collate utf8_unicode_ci COMMENT '文章内容',
  `copyfrom` varchar(255) collate utf8_unicode_ci default NULL COMMENT '文章来源',
  `relation` varchar(255) collate utf8_unicode_ci default NULL COMMENT '相关文章',
  `allow_comment` char(1) collate utf8_unicode_ci default NULL COMMENT '是否允许评论',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='文章详表';

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
CREATE TABLE `cms_category` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) collate utf8_unicode_ci default '1' COMMENT '站点编号',
  `office_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属机构',
  `module` varchar(20) collate utf8_unicode_ci default NULL COMMENT '栏目模块',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '栏目名称',
  `image` varchar(255) collate utf8_unicode_ci default NULL COMMENT '栏目图片',
  `href` varchar(255) collate utf8_unicode_ci default NULL COMMENT '链接',
  `target` varchar(20) collate utf8_unicode_ci default NULL COMMENT '目标',
  `description` varchar(255) collate utf8_unicode_ci default NULL COMMENT '描述',
  `keywords` varchar(255) collate utf8_unicode_ci default NULL COMMENT '关键字',
  `sort` int(11) default '30' COMMENT '排序（升序）',
  `in_menu` char(1) collate utf8_unicode_ci default '1' COMMENT '是否在导航中显示',
  `in_list` char(1) collate utf8_unicode_ci default '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) collate utf8_unicode_ci default '0' COMMENT '展现方式',
  `allow_comment` char(1) collate utf8_unicode_ci default NULL COMMENT '是否允许评论',
  `is_audit` char(1) collate utf8_unicode_ci default NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) collate utf8_unicode_ci default NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) collate utf8_unicode_ci default NULL COMMENT '自定义内容视图',
  `view_config` text collate utf8_unicode_ci COMMENT '视图配置',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='栏目表';

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
CREATE TABLE `cms_comment` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `category_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) collate utf8_unicode_ci default NULL COMMENT '栏目内容的标题',
  `content` varchar(255) collate utf8_unicode_ci default NULL COMMENT '评论内容',
  `name` varchar(100) collate utf8_unicode_ci default NULL COMMENT '评论姓名',
  `ip` varchar(100) collate utf8_unicode_ci default NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '审核人',
  `audit_date` datetime default NULL COMMENT '审核时间',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='评论表';

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
CREATE TABLE `cms_guestbook` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `type` char(1) collate utf8_unicode_ci NOT NULL COMMENT '留言分类',
  `content` varchar(255) collate utf8_unicode_ci NOT NULL COMMENT '留言内容',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '姓名',
  `email` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '电话',
  `workunit` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '单位',
  `ip` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '回复人',
  `re_date` datetime default NULL COMMENT '回复时间',
  `re_content` varchar(100) collate utf8_unicode_ci default NULL COMMENT '回复内容',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='留言板';

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
CREATE TABLE `cms_link` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `category_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '栏目编号',
  `title` varchar(255) collate utf8_unicode_ci NOT NULL COMMENT '链接名称',
  `color` varchar(50) collate utf8_unicode_ci default NULL COMMENT '标题颜色',
  `image` varchar(255) collate utf8_unicode_ci default NULL COMMENT '链接图片',
  `href` varchar(255) collate utf8_unicode_ci default NULL COMMENT '链接地址',
  `weight` int(11) default '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime default NULL COMMENT '权重期限',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='友情链接';

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
CREATE TABLE `cms_site` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '站点名称',
  `title` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '站点标题',
  `logo` varchar(255) collate utf8_unicode_ci default NULL COMMENT '站点Logo',
  `domain` varchar(255) collate utf8_unicode_ci default NULL COMMENT '站点域名',
  `description` varchar(255) collate utf8_unicode_ci default NULL COMMENT '描述',
  `keywords` varchar(255) collate utf8_unicode_ci default NULL COMMENT '关键字',
  `theme` varchar(255) collate utf8_unicode_ci default 'default' COMMENT '主题',
  `copyright` text collate utf8_unicode_ci COMMENT '版权信息',
  `custom_index_view` varchar(255) collate utf8_unicode_ci default NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='站点表';

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
CREATE TABLE `gen_scheme` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `name` varchar(200) collate utf8_unicode_ci default NULL COMMENT '名称',
  `category` varchar(2000) collate utf8_unicode_ci default NULL COMMENT '分类',
  `package_name` varchar(500) collate utf8_unicode_ci default NULL COMMENT '生成包路径',
  `module_name` varchar(30) collate utf8_unicode_ci default NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) collate utf8_unicode_ci default NULL COMMENT '生成子模块名',
  `function_name` varchar(500) collate utf8_unicode_ci default NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) collate utf8_unicode_ci default NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) collate utf8_unicode_ci default NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) collate utf8_unicode_ci default NULL COMMENT '生成表编号',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='生成方案';

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
CREATE TABLE `gen_table` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `name` varchar(200) collate utf8_unicode_ci default NULL COMMENT '名称',
  `comments` varchar(500) collate utf8_unicode_ci default NULL COMMENT '描述',
  `class_name` varchar(100) collate utf8_unicode_ci default NULL COMMENT '实体类名称',
  `parent_table` varchar(200) collate utf8_unicode_ci default NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) collate utf8_unicode_ci default NULL COMMENT '关联父表外键',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务表';

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
CREATE TABLE `gen_table_column` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属表编号',
  `name` varchar(200) collate utf8_unicode_ci default NULL COMMENT '名称',
  `comments` varchar(500) collate utf8_unicode_ci default NULL COMMENT '描述',
  `jdbc_type` varchar(100) collate utf8_unicode_ci default NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) collate utf8_unicode_ci default NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) collate utf8_unicode_ci default NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) collate utf8_unicode_ci default NULL COMMENT '是否主键',
  `is_null` char(1) collate utf8_unicode_ci default NULL COMMENT '是否可为空',
  `is_insert` char(1) collate utf8_unicode_ci default NULL COMMENT '是否为插入字段',
  `is_edit` char(1) collate utf8_unicode_ci default NULL COMMENT '是否编辑字段',
  `is_list` char(1) collate utf8_unicode_ci default NULL COMMENT '是否列表字段',
  `is_query` char(1) collate utf8_unicode_ci default NULL COMMENT '是否查询字段',
  `query_type` varchar(200) collate utf8_unicode_ci default NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) collate utf8_unicode_ci default NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) collate utf8_unicode_ci default NULL COMMENT '字典类型',
  `settings` varchar(2000) collate utf8_unicode_ci default NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) default NULL COMMENT '排序（升序）',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务表字段';

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
CREATE TABLE `gen_template` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `name` varchar(200) collate utf8_unicode_ci default NULL COMMENT '名称',
  `category` varchar(2000) collate utf8_unicode_ci default NULL COMMENT '分类',
  `file_path` varchar(500) collate utf8_unicode_ci default NULL COMMENT '生成文件路径',
  `file_name` varchar(200) collate utf8_unicode_ci default NULL COMMENT '生成文件名',
  `content` text collate utf8_unicode_ci COMMENT '内容',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='代码模板表';

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
CREATE TABLE `oa_leave` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '流程实例编号',
  `start_time` datetime default NULL COMMENT '开始时间',
  `end_time` datetime default NULL COMMENT '结束时间',
  `leave_type` varchar(20) collate utf8_unicode_ci default NULL COMMENT '请假类型',
  `reason` varchar(255) collate utf8_unicode_ci default NULL COMMENT '请假理由',
  `apply_time` datetime default NULL COMMENT '申请时间',
  `reality_start_time` datetime default NULL COMMENT '实际开始时间',
  `reality_end_time` datetime default NULL COMMENT '实际结束时间',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='请假流程表';

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
CREATE TABLE `oa_notify` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `type` char(1) collate utf8_unicode_ci default NULL COMMENT '类型',
  `title` varchar(200) collate utf8_unicode_ci default NULL COMMENT '标题',
  `content` varchar(2000) collate utf8_unicode_ci default NULL COMMENT '内容',
  `files` varchar(2000) collate utf8_unicode_ci default NULL COMMENT '附件',
  `status` char(1) collate utf8_unicode_ci default NULL COMMENT '状态',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='通知通告';

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
CREATE TABLE `oa_notify_record` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '通知通告ID',
  `user_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '接受人',
  `read_flag` char(1) collate utf8_unicode_ci default '0' COMMENT '阅读标记',
  `read_date` date default NULL COMMENT '阅读时间',
  PRIMARY KEY  (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='通知通告发送记录';

-- ----------------------------
-- Table structure for oa_test_audit
-- ----------------------------
CREATE TABLE `oa_test_audit` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) collate utf8_unicode_ci default NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) collate utf8_unicode_ci default NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属部门',
  `POST` varchar(255) collate utf8_unicode_ci default NULL COMMENT '岗位',
  `AGE` char(1) collate utf8_unicode_ci default NULL COMMENT '性别',
  `EDU` varchar(255) collate utf8_unicode_ci default NULL COMMENT '学历',
  `CONTENT` varchar(255) collate utf8_unicode_ci default NULL COMMENT '调整原因',
  `OLDA` varchar(255) collate utf8_unicode_ci default NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) collate utf8_unicode_ci default NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) collate utf8_unicode_ci default NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) collate utf8_unicode_ci default NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) collate utf8_unicode_ci default NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) collate utf8_unicode_ci default NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) collate utf8_unicode_ci default NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) collate utf8_unicode_ci default NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) collate utf8_unicode_ci default NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) collate utf8_unicode_ci default NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) collate utf8_unicode_ci default NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='审批流程测试表';

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
CREATE TABLE `sys_area` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) collate utf8_unicode_ci default NULL COMMENT '区域编码',
  `type` char(1) collate utf8_unicode_ci default NULL COMMENT '区域类型',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='区域表';

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
CREATE TABLE `sys_dict` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `value` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '类型',
  `description` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) collate utf8_unicode_ci default '0' COMMENT '父级编号',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典表';

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
CREATE TABLE `sys_log` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `type` char(1) collate utf8_unicode_ci default '1' COMMENT '日志类型',
  `title` varchar(255) collate utf8_unicode_ci default '' COMMENT '日志标题',
  `create_by` varchar(64) collate utf8_unicode_ci default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `remote_addr` varchar(255) collate utf8_unicode_ci default NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) collate utf8_unicode_ci default NULL COMMENT '用户代理',
  `request_uri` varchar(255) collate utf8_unicode_ci default NULL COMMENT '请求URI',
  `method` varchar(5) collate utf8_unicode_ci default NULL COMMENT '操作方式',
  `params` text collate utf8_unicode_ci COMMENT '操作提交的数据',
  `exception` text collate utf8_unicode_ci COMMENT '异常信息',
  PRIMARY KEY  (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='日志表';

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
CREATE TABLE `sys_mdict` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) collate utf8_unicode_ci default NULL COMMENT '描述',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='多级字典表';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
CREATE TABLE `sys_menu` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) collate utf8_unicode_ci default NULL COMMENT '链接',
  `target` varchar(20) collate utf8_unicode_ci default NULL COMMENT '目标',
  `icon` varchar(100) collate utf8_unicode_ci default NULL COMMENT '图标',
  `is_show` char(1) collate utf8_unicode_ci NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) collate utf8_unicode_ci default NULL COMMENT '权限标识',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单表';

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
CREATE TABLE `sys_office` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '归属区域',
  `code` varchar(100) collate utf8_unicode_ci default NULL COMMENT '区域编码',
  `type` char(1) collate utf8_unicode_ci NOT NULL COMMENT '机构类型',
  `grade` char(1) collate utf8_unicode_ci NOT NULL COMMENT '机构等级',
  `address` varchar(255) collate utf8_unicode_ci default NULL COMMENT '联系地址',
  `zip_code` varchar(100) collate utf8_unicode_ci default NULL COMMENT '邮政编码',
  `master` varchar(100) collate utf8_unicode_ci default NULL COMMENT '负责人',
  `phone` varchar(200) collate utf8_unicode_ci default NULL COMMENT '电话',
  `fax` varchar(200) collate utf8_unicode_ci default NULL COMMENT '传真',
  `email` varchar(200) collate utf8_unicode_ci default NULL COMMENT '邮箱',
  `USEABLE` varchar(64) collate utf8_unicode_ci default NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) collate utf8_unicode_ci default NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) collate utf8_unicode_ci default NULL COMMENT '副负责人',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='机构表';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
CREATE TABLE `sys_role` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `office_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属机构',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `enname` varchar(255) collate utf8_unicode_ci default NULL COMMENT '英文名称',
  `role_type` varchar(255) collate utf8_unicode_ci default NULL COMMENT '角色类型',
  `data_scope` char(1) collate utf8_unicode_ci default NULL COMMENT '数据范围',
  `is_sys` varchar(64) collate utf8_unicode_ci default NULL COMMENT '是否系统数据',
  `useable` varchar(64) collate utf8_unicode_ci default NULL COMMENT '是否可用',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色表';

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '菜单编号',
  PRIMARY KEY  (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色-菜单';

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '机构编号',
  PRIMARY KEY  (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色-机构';

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
CREATE TABLE `sys_user` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `company_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '登录名',
  `password` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '密码',
  `no` varchar(100) collate utf8_unicode_ci default NULL COMMENT '工号',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '姓名',
  `email` varchar(200) collate utf8_unicode_ci default NULL COMMENT '邮箱',
  `phone` varchar(200) collate utf8_unicode_ci default NULL COMMENT '电话',
  `mobile` varchar(200) collate utf8_unicode_ci default NULL COMMENT '手机',
  `user_type` char(1) collate utf8_unicode_ci default NULL COMMENT '用户类型',
  `photo` varchar(1000) collate utf8_unicode_ci default NULL COMMENT '用户头像',
  `login_ip` varchar(100) collate utf8_unicode_ci default NULL COMMENT '最后登陆IP',
  `login_date` datetime default NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) collate utf8_unicode_ci default NULL COMMENT '是否可登录',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '角色编号',
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户-角色';

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
CREATE TABLE `test_data` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `user_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属用户',
  `office_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属部门',
  `area_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属区域',
  `name` varchar(100) collate utf8_unicode_ci default NULL COMMENT '名称',
  `sex` char(1) collate utf8_unicode_ci default NULL COMMENT '性别',
  `in_date` date default NULL COMMENT '加入日期',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务数据表';

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
CREATE TABLE `test_data_child` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '业务主表ID',
  `name` varchar(100) collate utf8_unicode_ci default NULL COMMENT '名称',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务数据子表';

-- ----------------------------
-- Table structure for test_data_main
-- ----------------------------
CREATE TABLE `test_data_main` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `user_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属用户',
  `office_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属部门',
  `area_id` varchar(64) collate utf8_unicode_ci default NULL COMMENT '归属区域',
  `name` varchar(100) collate utf8_unicode_ci default NULL COMMENT '名称',
  `sex` char(1) collate utf8_unicode_ci default NULL COMMENT '性别',
  `in_date` date default NULL COMMENT '加入日期',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='业务数据表';

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
CREATE TABLE `test_tree` (
  `id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '编号',
  `parent_id` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) collate utf8_unicode_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) collate utf8_unicode_ci NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_unicode_ci NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) collate utf8_unicode_ci default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_unicode_ci NOT NULL default '0' COMMENT '删除标记',
  PRIMARY KEY  (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='树结构表';

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `act_ge_bytearray` VALUES ('7c9e714e6fc54daf9085515375610331', '1', 'test_audit.png', '566004a976614fad8136b9394bcd1615', 0x89504E470D0A1A0A0000000D49484452000003DC0000017C08060000003DD3B3DA000053E24944415478DAEDDD0B7C54F59DFFFF53A08AB7BF68A9CBB2FC6CEA6581D5AE5A31868B17349658A0E2AD4B5D8AAC525656A922D40B5A2FC0221A318518110C1711630AC4809186909A442E4908E112638C3166A5980245C4D218631CE3F77F3EDF39E730339949324998CC4C5ECFC7E3F3C85CCE5C32E7FB3E733E73CE9C310C000000000000000000000000000000000000000000000080EEA70F2F0100000000009D2BC12C65FD0500000000009D20DEAC2FCC4AB2FE8EE1250100000000A0739A6DBBC9962DDC9FD1740300000000D079CD766B970300000000805624B4D254DBD7F39D6E0000000000826CB65B6BA6D9D20D00000000401BC51BC16DB90E767A0000000000BA6DB33DA61DB7ABA3E90600000000A0F39AEDCEBA3D000000000051A7B503A485FA7E0000000000889A66BBB37607674B3700000000A0DBF33DE0D9F7CCBAD3FA1B0CDFDB7120350000000040B76FB6C77834CDCBCC52D6DFB636DD816E47D30D00000000E8F6CDB6B8D36A9A55104DB767B36DD7448FEBF94E3700000000A0DB08D404FB6B9E5B6ABAFD4D9FEA677ABED30D00000000E836CD7642104DB4BFA6BBADCDB66FD3CDEEE50000000080A8D3D6A6B7B5A63BD866DBF3F13F33D8D20D0000000088C266BBADCD6EA0A6BB473B9B6D1BDFE9060000000074DB66BBA5A6BBAA03CD76479F0F000000000061A3A35B94FD35DD1D69B67D9B6EBED30D000000005D2CCEACC7CDCA366BA7D5AC29AA4D95D4C1D75E7623F7DDB25D655DDE1149CC1B8AA2288AA2282ACAAACEAC6AB372CD7AC6706F68EA453B8770D4D71AA49F9A5564D61CB3C69975B1597D7879DAA4B5A392B7A6A52DDC6DF99DEE40D8C20D00008068247DCA20C3BD87A9F4325BCD3A68B83736F5E3E541B8986C35DA8BCDBA8097A343A4B9AD334ECC77B8DBD374F31D6E000000742703CC4AB6D68167F272A02BC9EE166F98956FB8B764A3F39AEE60B62807FAE92F7F47290FA6E9E628E5000000E8AE64CB77B9E1FE9AECE9BC1CE80AD26C67197CCFE14436DDAD35BBADFDCE766BBFD31DC81083DFE106000040F7D6C7EA77B2E979106AB21B793E03EF846A6D0B736BCDB6D1CEA6DBDEAD7D1CB30000000034DD7A4BF723BC14081539409A7C679BDDC84FBC405BBADBDA6C07DB74DB8F47B30D000000B8C9EEE5B2F72707524348C811FC9279194226C168BE7BF79D46F0BFB3EDAFE99EE8F3387C671B000000684EFA9F245E0684826CDDE668E4A16FBA3D0FA4E6D93CB7A5D9365AB91D3FFD050000000426472F979F0CE32BB538A1E20CF7EF6C23F47C772F976679A211FC4F7DF9DEAEA3BFFF0D00000074075B5967C689F69459737819C2A6E9EE287FBBAB03000000684EFAA06778197022C921F139A0567434DD9DDDBC03000000D14CD69B7379197022ED34383A7938E8E86EE0EC460E00000004478E565ECDCB8013499AB43EBC0C61D57407BB859A03A401000000C1933EA88E97012792E225082BC1EE16CE6EE400000000FD101860E8E4267A88E1FE448EEFE003000000F4436080A18D12AC663AA185EB3FA3D906000000E887C00043F0026DE9663772000000807E080C307472D34DB30D000000D00F8101864E6EBA9368B601000000FA2130C0D0B9A659F38A9FFE02000000E887C0004327CAB2E6552F5E0A000000807E080C30748E38B35C065BB801000000FA2130C0D0A932ADF924B5939703000000A01F02030C1D37C438BE75DB2E0E9A06000000D00F8101860ECAF269B6EDADDC7C971B000000A01F02030CEDE46FEBB65DE3787900000000FA2130C0D03ED9019A6DA9225E1E000000807E080C3004AFA5ADDB7C971B000000A01F02030CED94D54AB3CD11CB01000000FA2130C0C0BC0200000058C706030CCC2B00000080756C8001C6BC02000000C03A361860605E01000000AC63830106E615000000C03A36C000635E01000000601D1B0C3030AF00000000D6B1C10003F30A000000601D1B608031AF00000000B08E0D0618985700000000EBD86080817905000000B08E0D30C098570000000058C706030CCC2B00000080756C30C0C0BC0200000058C7061860CC2B00000000AC63830106E615000000C03A361860605E01000000AC63030C30E61500000000D6B1C10003F30A000000601D1B0C3030AF00000000D6B1010618F30A00000000EBD86080817905000000B08E0D0618985700000000EBD800038C7905000000B08E0D30C09857BC0400000000EBD86080817905000000B08E0D0618985700000000EBD800038C790500000080756C30C0C0BC0200000058C706030CCC2B00000080756C8001C6BC02000000C03A361860605E01000000AC63830106E615000000C03A36C000635E01000000601D1B0C3030AF00000000D6B1C10003F30A000000601D1B608031AF00000000B08E0D0618985700000000EBD86080817905000000B08E0D30C098570000000058C706032CA4FFB052BD535252664E9C38716F6C6C6C43EFDEBD95F53A509D503D7BF6FCEEFCF3CFFF6CF8F0E11BCDBF238918000000E887C000EB06962D5B76CFC89123EB636262D49C39B3557E7E9E6A68F8CAECC1BFA33AA9E4F52C2A2A548989CFA981030736F6EFDF7FAFF9D25F4CD4000000403F040658944A4D7D657DBF7EFD5452D20BCAE56A349BC3262A04959CBC48F5E9D3E7AB534F3DF526E206000000FA2130C0A2B0D9BEE0820B5451D176B309FC960A71959797A9BE7DFBFEC39C1563881C000000E887C0008B12CB962DBD47B66C17156D339B3F97572D5DFA921A3326418D1A75BDBAFEFA6BD40DF12355F2A2A466D3511DAFF2F2BDEA94534EF9C260F772000000D00F81011605FF9C52BD478EBCA63E29E979F3E4375EB562F95235FAE7A3D4ADB78CD53576CC8D2A3EFE5A3574E8156A916EBABFA13AB91213E77FDEAB57AF3C6207000000FA2130C0225C4ACAC29931313F522E57BDD9F0357A55C2A878DD68DF70C348A77EF6B3EBD4F061579A4D776CB3E9A9CEA9B3CF3EFB5373D6C4113D000000D00F810116C1264E9CB077CE9C27CD46EFEB663562789C7A61C17C95F556864A7931496FD9BE6AC4507DB99C76B9BEF47B3BAA63356DDABD3BCD599348F4000000403F040658048B8D1DD2909F9F63367A0DCDEAEEBB27AA837FFD546DDDF28ECAFED306B5EAD554B53E738DFAB8FA43F53F5327AB6FBFFDD2EFEDA88ED5BBEFE61E3067CD4EA207000000FA2130C02258EFDEBD5543C3E766A357DFAC1E9BF5902A2EDAA276146F55BB7795E892D33B766C578F3DF690DFDB501D2F991FE6AC71113D000000D00F810116E1FF9F525F362B97EBEF6AD6AC996ACA6F26A992924255FEDE1E5DBB76ED50D3EEFB6F35E3C1FBD4D75F7FEEF7B654C78B051B000000E887C0008B8A86BBCEAB1A1B3F57EBD6BDA662637FAAAA3FAA540F4EBFCFAB4A4B8BD590CB2F55AFAF4E550D0D9F35BB3DD5F162C106000000FA2130C0A2A2E1FE8753DF7D774CBDB5215D0D1B1AAB6AAAABD47B65BB55EEE68D2AF3CD3FAAB4D757AAD4575E329BF134BD7BF995575EAED2D357A86FBFFDC2EB3EA88E170B36000000D00F810116150DF731A7B66ED9A47F6B5B9AECBCBCCDEACD8C74DD68AF58BE44BDBC78914A7AE159F5CCBCA7F501D416BFB4505D7BCD08B5F1ED355EF74175BC58B0010000807E080CB0A868B8FFEED463B37EA78F442E8DF5B2D4C5BA96BC9CAC92172D50CF27CE53FF3BF749F5C4EF1F513367FC563DF9C4A366B39DA97E37F37EAFFBA03A5E2CD8000000403F0406585434DC5F38250DB7FC04D8EDB7DDACDE487B5537DAD27C3F3B7F8E9A3BE709F5DCB37375D32D4DF898D1096A73CEDB56C3FD05D589C5820D000000F44360804545C37DD4A9BD7BB7A9471F99A17E79FB38DD50CBAEE4FE2A2E6E88FAF584F17A6B7769E9BB5EF74175BC58B0010000807E080CB0A868B83FF72AD7377F535F7EF9A94A7CEE699530EA3A3562F8956AE8D02B54DC9543D450B3D1BEE6EAE1EA81FBEF51C78EFD454FEB7B7BAAE3C5820D000000F44360804545C37D840AB362C106000000FA2130C0A2A2E1FE8C0AB362C106000000FA2130C0A2A2E13E4C8559B16003000000FD10186051D170FF8D0AB362C106000000FA2130C0A2A2E13E448559B16003000000FD10186051D1701FA4C2AC58B0010000807E080CB0A868B80F5061566D18774F98D5403C010000403F0406585837DC7FA5C2AC5A1877D2687F6D5DCFC20F000000F44360808577C35DEBB7E4BA850B67ABC4C4C775EDDB57AC2F2B29D918F036C196DC5F6666AA733A27E7757DBABA7A5BC0DB9497BFA3F6ECC9F17A1EBECF4BCECF9A35ADD963CD9F3F4B9F3E74688FD77555555BF4F5478E94377BBCDADAD26697555616E8E96B6A0AF5F90D1B96AB33CE38BDDDFFBBBFEB5A69B469B8010000403F040658F837DC9FFAADE30DA1F76559592BBC2EBBF9E6043579F2AFCC86BC48979CBEF7DE3B9DF3729BB9731F72A6EFD9B3A74A4E9EE35CE76EE6DDA7CBCBFF6C36CE6FAB33CF3C434F5B5DBD553F9EDD606EDCF8AA1A3FFE176AC2845BF469B9ACB676A7FE2BD37A3ECF952B5F704EEFDFBF43FFADACCC5705056BF569794CCFE967CF9EA98E1E7D5FFFCF727ECA94FF741EC3BE2FCFE91F7FFCB75EE72FBFFC277AFAD1A3AFD7CFCFBEEEC61B47AAE9D37FA31FEFDC73FF45CD9831C56CF0DFD5B7A9A8C80BF8DA5BF3679EE1DE755C0528000000807E080CB0F06DB8F7FB2DBBA94C4C7C4C97DD146FD9B22EE06DA42EBCF0C72A36F6D216A7B1EF5F9ACFC387F7E8F3070E94EABF7979E9FABAFAFA2A7D5E1E5BCE9F724A6FDD7C8F1D1B6F36C37798CDED4A7DF9B1631F585BB8B3D4A143BB9DCB972C99AF9F4B46C612B560C1EFF565757595FA6F41C11AE77948132E973535EDD37FABAADC5BAFE5F9AC59B3586DD8B0CCEB79DBD36567AF52A5A51B556E6E9A7ECE725EFE17FBB1FDFDCFF23FC8EB77CE393F50C3865DAE9FABFD7CF7EF2FF67A6D0CFF5BB469B8010000403F040658E434DC7F695665659BD49E3DD9AAB1F163AFAAADDDA11B447FB7B1EB78C3EDFFFA82823FAA6BAF8D533939AFA9949439EAB4D34E359BE60A75F2C927A93BEEB8C96C62DF369BDA4F9CE9EDE652A6ADABFB40A5A7BFA8060E3C4F2D5CF894BE5CA67737D31F78DD46A697D32E578D2A2FDFAC2F4B4D7D4E3F5645C59FF575870EEDD297A7A52D5283075FA09B79FBF6F6FDCAEB20A7EDFB5EB52AC9DAFABF54DD7CF328E771ECE7939BFB7AC0FF5DB6DCCBF5329DBCC6F663C97D794ED786469BA2288AA22877D599B5C7AC6CB39E312BDEAC5EACC202F44360808549C3BDAF592D59324F5D74D1BFAA2D5BD6A8D5ABFFA0AEBB6E989A3DFB417D5E6E5358F8A6DFDB49B91BEE4B025E2F65E82DC9EE2DCBF3E63DA48E1CD963ED1E5EACAF97F39ED326253DA1060CF867B3A9AE50C9C94FEBCBA64E9D607D57FB5EBD9BBA3D7D6363B5F3265C5D5DA0B2B296A98D1B5778955CB76DDB3A3D7D76F6ABAAA6668BD7E31B7A2BF81FF56DFBF63D5B6F8D96CB8F1E2D536BD6A4E8867FFAF4BB557CFC087DD94F7E32488D1E7D9DBE6F792EF2E1815C6EDF974C27D7C5C40C50975C32D86CBA577B3D965CE7FBFA58F3E715B3BE35C2730B771FB3069935C6ACC7CDCA35EBA0594966F563D101049D236914B6922380F723807E080CB0A86AB83F695672F95D77FD529F4E4B5BA8B7427B5E9799B9C4EFEDA42EBC30C66AB89B5F575FFF81F55DE7E5FA7E648BB69C2E2BCB76EEF7ACB3CED4BB5CEFDF5FE83C9E34A90505E9BAD996A6559ADB55AB5EB0BE8BBDCDF92BD3A7A6CEB7B64C6FB41AEBB57EFF3FFB7F387A74AFF57DEACDFA7C6D6D91F3DCEC6957AF4ED2A70F1FDEE55C26CDF88D375EAB1F4F2E5BB8F049DD6837347CA8FF4FCFC7CAC858EC9C970F0D9A9A6A9C0F040CFDDDF59C66CFCF673EBD1AA0F10E3703ACA6415674EE61F101B43B47C9667D61D64C5E0E80F723807E080CB0886EB8FFAF59B91BEEDB9DD3D3A7DFE5755D66E6CB7E6F2775BCE1F67F7D71F19BFAF676232BBB725757BBB776BB5CD5CDEE5FCE2F5E2CBB93BFAF0E1C2856E9E98BCCA6FD625553E36E560F1D2AB1BEC3BDDE6C643F562929B3AD03A4E5EADB6FD8B05437F59326DDA6CB6EF6E5FA86864AA77995E90A0BD7A98B2EBA5037E9EE263CC76AE6B7367B7DC68EBD5EDD7A6B82D92C6FD2FFF39123BB5476F60AEB68EBAF7A4DEB6EB8BD5F87C4C447F5070B5959A97E5FFF00F3CB778B77B8922D0DB28561AD59A7B31801DA9DA372C3BD9B2C3902783F02E887C0008BCC86BBA65919FA27C19E50F5F5EF5B074A4B379BD03566435B6D36ACCBFCDEC6AEE30DB7FFEB6B6B0BD5F2E5CF5A3FD3F590D96CE7A9F3CEFB7F6AEEDC079DC77637DCC79F4B72F293BAA1DDB76F8B6EB8E5B2C6C60FADADC479D62EE0696613BDD96CDA3FB29AF917023E07CFC73876ACCC795E72FF863E605A91D948675BDF057FDAEFEDA5E1B6FF4F795CF97EF61D77FC42DF56AE5FB0609633AD5C7FF4E86E75D965FFA666CF9EAE2F97D7D4D0DFF95EE5F7FE5B996FF616EF7026DF9FCBB2567200B44F1F2B47D906DF4905783F02E887C0008BC486FB63BF75E448A9F5B35D8FE8F315159B9CADC10D0D15FAB2C3874BD44D37C5EB9A3265BCD93CBEAAB7DA9E7B6E7F7D5A2A2D2DC93A08D97A7D1B437F577ABBD52CBFA31B5A431F25FC23E7FACCCCC5CEF390F3C386FDD46CF4535546468A4A4D7D463F867D9DDC87A177F15EEA759BF2F23FA9C2C2B5BA09969A34E9565D723FEE2638C76C82DD074DEBD7EF87AAACCC7D90B4BCBCD5CEF35BBC78B6B5F57B89D76B63E803B03D6336FD95FAB9DD7BEF0475E850B19A376FA6FAFEF77BE9FBF29C566AD5AAE79DFF511E431E535E1FFB317DEF3F8A567264CB02BBF3011D6BBA654BF723BC1400EF4700FD10186011D770577B554ECE0ADDBCF6EF7F8ED974EF6C76BDDC66DAB489CEF98686F79B4D13A81A1B3FD0D3CBFDCBFD1C3EBCC36A385FF3BA7F77F37CFC7C4949863EED727D681DE13B4B9F6F6AAA72A6292878DDEB360B163CAAA7F7F73CE4FAE2E275FAF4BE7D05FAAF7C77BCA6264FDFCFE0C1E73BD3CA63B93F30C8F4BAFD810385FABA6DDBD2D5E8D1D7AA5B6F1DE5F7F1E4B9DB97575464ABABAFBE4237F2BEF7BF7AF502AFFB8FA23126BBF37D6A70E01AA0A339FA8C1C01BC1F01F4436080455CC3FD51445553D3879D324DA89E4B7BA68FC2712707AE496271027448323902783F02E887C0008BB886BB8A0AB38AC27127478B9523C5F21D54801C01E408A01F02BA53C3FD21156615A5E34EBE3B97C02205E890ADE408E0FD08A01F02032CA21AEE4A2ACC2A4AC7DDE3867B573E00ED37871C01BC1F01F44360804554C3FD01156615A5E36E8CE1FE6923001DCB512E2F03C0FB11403F040658C434DC15549855948E3B393AEC1E162940877354CDCB00F07E04D00F810116310DF7FB549855948E3BF92DE13A1629003902C811403F0474A386BB9C0AB38AE271C7021B2047003902C80BD09D1AEEF7A8302B1A6E00E4082047007901032C2A1AEE322ACC8A861B003902C811405EC0008B8A867B2F156645C30D801C01E408202F60804545C3BD870AB3A2E106408E007204901730C0A2A2E1DE4D8559D170032047003902C80B186011EEE4934FFAAEA1A1C86CF2765161525F7D55B8CF9C352EF204801C01E408202F608045B0C1837F7C283F7F89D9E895526152EBD73FFFB6396B76922700E4082047007901032C825D75D565EBE6CC994AA31B463576EC5569E6AC49244F00C811408E00F2020658041B30E007B103069CF38DCBB58366373CEA931E3D7A5498B3268E3C012047003902C80B186011AE7FFF1F9626253D48B31B063566CC554BCD59924B9E009023801C01E4050CB0E830E8CC334FAB2F2A5A41D3DB85959FBF74BD392F0E9A75317902408E007204901730C0A247FC39E79CFD779AEEAE6BB67BF4E85163CE8731E409003902C811405EC0008BC2A6FBA493BE7F6CDEBCFB3EE73BDDA1FBCEB6B51BF9C16ED06CB3C006C811408E00F20274EB0136A867CFEFE59C7EFAA987A74CB965F7A64D2F1E6C6828A431EEC4FAEAABEDFBE4A7BFE468E4D601D2E43BDB17932700E408204700790103AC7BB8D4AC39666D35ABC17A1DA8CE2997E1FE9D6DF9E9AF38F204801C01E408202F6080219C6559F3AA172F057902C811007204901730C0D039642BB1CB9A5709BC1CE409204700C811405EC00043E7C8348EEFAEBD9397833C01E408003902C80B1860E8B821C6F1ADDB768DE165214F003902408E00F20206183A26CB687E5032D9CACD77B9C913408E00902380BC80018676F2B775DBAE71BC3CE409204700C811405EC00043FB641B817F7AAB8897873C01E408003902C80B1860085E4B5BB7F92E377902C811007204901730C0D04E59AD34DB1CB19C3C01E408003902C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408003902C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408003902C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408204700C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408204700C80B1860605E318F009023801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408204700C80B1860605E318F007204801C01E4050C3030AFC03C02C811408E00F20230C09857601E01E408204700C80B4E882C6B40B5543B799958188079049023801C01E40508CE10B35CAD34DC63789958188079049023801C01E405085E760BCD769159BD788958188079049023801C01E40508DE90161AEE71BC3C2C0CC03C02C811408E00F202B49FBFEF72CB77B7D9BACDC200CC23801C01E408202F4007F8FB2E37DFDD666100E611408E0072049017A013641A6CDD666100E611408E0072049017A0D3C57934DC09BC1C2C0CC03C02C811408E00F202741EFBBBDC6CDD666100E611408E0072049017A0130D6180B13000F3082047003902C80B22678E29D53B252565E6C48913F7C6C6C636F4EEDD3BD0CF70512D54CF9E3DBF3BFFFCF33F1B3E7CF846F3EF4846160B03E611408E00902380BC7463CB962DBB67E4C891F53131316ACE9CD92A3F3F4F35347C65F6E0DF514196BC6E4545852A31F1393570E0C0C6FEFDFBEF355FE28B5918807904902300E408202FDD4C6AEA2BEBFBF5EBA792925E502E57A3D93436519D58C9C98B549F3E7DBE3AF5D4536F626100E611408E00902380BC74A366FB820B2E504545DBCDE6F05BEA0455797999EADBB7EF3F8CEEF9BBE12C0C9847003902408E00F2D2BD2C5BB6F41ED9B25D54B4CD6C0A5D5EB574E94B6ACC9804356AD4F5EAFAEBAF5137C48F54C98B929A4D47B5BDCACBF7AA534E39E50BA3FBED5ECEC2807904902300E408202FDD68EE28D57BE4C86BEA93929E374F7EE3552B962F55A37F3E4ADD7ACB585D63C7DCA8E2E3AF5543875EA116E9A6FB1BAA9D959838FFF35EBD7AE5B13000F308204700C811405EA2544ACAC29931313F522E57BDD908367A55C2A878DD68DF70C348A77EF6B3EBD4F061579A4D776CB3E9A9E0EAECB3CFFED49C05712C0CC03C02C8110072049097283471E284BD73E63C6936805F37AB11C3E3D40B0BE6ABACB73254CA8B497ACBF6552386EACBE5B4CBF5A5DFDB516DAB69D3EEDD69CE82441606601E01E408003902C84B148A8D1DD2909F9F6336800DCDEAEEBB27AA837FFD546DDDF28ECAFED306B5EAD554B53E738DFAB8FA43F53F5327AB6FBFFDD2EFEDA8B6D5BBEFE61E3067C14E1606601E01E408003902C84B14EADDBBB76A68F8DC6C00EB9BD563B31E52C5455BD48EE2AD6AF7AE125D727AC78EEDEAB1C71EF27B1BAAED25AFBB390B5CDD64A825580B830452C7021B204700C811405EBACD0C52EACB66E572FD5DCD9A35534DF9CD24555252A8CADFDBA36BD7AE1D6ADA7DFFAD663C789FFAFAEBCFFDDE966A7B759380C49B2547654FB2FE8E21762CB0017204801C01E4A59B34DC755ED5D8F8B95AB7EE35151BFB5355FD51A57A70FA7D5E555A5AAC865C7EA97A7D75AA6A68F8ACD9EDA9B657370848BC4F932D5BB83FA3E966810D902300E408202FDDA4E1FE8753DF7D774CBDB5215D0D1B1AAB6AAAABD47B65BB55EEE68D2AF3CD3FAAB4D757AAD4575E329BF134BD7BF995575EAED2D357A86FBFFDC2EB3EA8B6579407C4B7D96EED72B0C006C8110072049097686BB88F39B575CB26FD5BDBD264E7E56D566F66A4EB467BC5F225EAE5C58B54D20BCFAA67E63DAD0FA0B6F8A585EADA6B46A88D6FAFF1BA0FAAED15C5014968A5A9B6AFE73BDD2CB0017204801C01519A970166DD67D65AB3AACDAAB39E7083599F989569D64C6BBA286EB8FFEED463B37EA78F442E8DF5B2D4C5BA96BC9CAC92172D50CF27CE53FF3BF749F5C4EF1F513367FC563DF9C4A366B39DA97E37F37EAFFBA0DA5E51FA86D2D6669A2DDD2CB0017204801C015198977166E55A4DF62B66DD66D620B34EB7AE97BF31562390644D976FD684E86CB8BF704A1A6EF909B0DB6FBB59BD91F6AA6EB4A5F97E76FE1C3577CE13EAB967E7EAA65B9AF031A313D4E69CB7AD86FB0BAA1D15856F28F146705BAE839D1EACE000E408204700C2342FD244679B556E35D3BD82B8AD3404F29BC95BCDBA20BA1AEEA34EEDDDBB4D3DFAC80CF5CBDBC7E9865A7625F757717143D4AF278CD75BBB4B4BDFF5BA0FAAED15656F28EDDD622DB7ABA3E966810D902300E40888DCBC8C37EBA0E1DE45BC5707EEE73EEB7EA2656BB7D9F87DEE55AE6FFEA6BEFCF25395F8DCD32A61D4756AC4F02BD5D0A157A8B82B87A8A166A37DCDD5C3D503F7DFA38E1DFB8B9ED6F7F654DB2B8ADE503ABA7B38BB97B3C006C81100720444685E64255EBE931DD749F777A9757F93A3A3E13E42755145C91B4A6B07480BF5FD80151C801C01E408202F2132DE6A8E633AF97E63ACFB8DF42DDD66E3F719D54515056F289D7DB471B674B38203902300E4088890BC48532CBB7FC79DA0FBBFD4BAFF4191DD701FA6BAA822FC0DC5F78067DF33EB4EEB6F307C6FC781D458C101C811408E0044405EE448E4334FF063C877BAB74676C3FD37AA8B2A82DF507CB7444BB3BCCCFA7F9605D17407BA1D4D372B38003902C8118030CE8BFCF4971C8DBC77081E6B8F11B9BB969B8DDF21AA8B2A42DF50FCEDF67DA7F5BFA8209A6ECF66DBAE891ED7F39D6E5670007204902300619A97DC10AEA84B0312A95BB9CDC6EF20D54515816F28819A607FCD734B4DB7BFE953FD4CCF77BA59C101C811408E0084595E0618EE039AF50AE163561B9D7F60B68E7EE030A26D0DF701AA8BAA8B02D2D6B111A8D94E08A289F6D774B7B5D9F66DBAD9BD9C151C801C01E4084018E445BE57BD38C48F99689CF8EF8B07FBC22BABB98A6BB9E1FE6B874AEE23337399733A27274D9FAEAEDE1EF036E5E5EFA83D7B36AB92928D5EF7E379DEAE7DFB76A8934F3EA94DCF63FCF89B9A5DB666CD12BFD36767AF56679E7946BBFFE79494799DF2DA85F1D8684FD3DB5AD31D6CB3EDF9F89F196CE96605072047003902D0E579596BD66D217E4C6904B2C2B0E1B62BDBF0BF55D36CFC6A83AE9E3D7BAAE4E43966335CACEF3F31F171E7B434D3D238BB9BD95AB3F1DEA6B2B2563ACF65E3C655BA319E30E1167D5A2EABAD2DD57F655A7F8F27D79D724AEF80CFE7D0A13D7A9A0103FE59DF67FFFEFFA4D2D25E349BE2FF55175DF4AFCEE31C3B56D9EC7E2B2AF2544D4DA19EE6D65B7FAE264FFE95337D7171969EAEB07083BE6CD2A45FEABFF23871713FD5A7A5366C58AECE3BEFDCA05FC72E6EB85B1B1BBECD765B9BDD404D778F7636DB36BED3CD0A0E408E007204200CF222BB775F10E2C78C31EBD3306EB83DB76A8EF06EB83F6D77C9ED67CC98A20E1FDEABCF1F38B04BFFCDCBFBA3BEAEBEFE237D5E1A72BB69CECA5AA1C68EBD414D99F29F66B3FAAAD3081B7A0BF7DB7AFAF2F23FEBE6574AA691E6B95FBF1FEAC7B26F3371E26D7A5A97EB13DDF0CA6969B40B0BD7AB6BAF1DAAE6CD7BD8798ED278DBCFF9C891F7D4B06143F4FDD8CFCB7EDE86DE5A9FEA9CCEC858EA9C5EB366B1731FB2C55D6E6B9FFFFEF77BA9C71FFF6DBB5EBF301E1BED69B65B6ABAAB3AD06C77F4F980151C801C01E408202F9DA4CEACD343FC98F2780D11D0707B6ED58C7337DCFB83AE828235BAA9CDC9596D36B373D569A79D6A36CD1FE846F48E3BC6A9D2D28DAAA9699F33BDFDB8326D5D5DA54A4F4F5103079EAF162E7C5A5F2ED3CB5FB9CEDFE35D78E18F556CECA5019F8F3CEEE8D1D7A949936E371BE9956AF1E2797A0BB434E8F66572FF6969C9CE6DE4F9C9659595F9AAAC2CC76CDCFF4F9FCFCE5EE53C67799E72BAA1A15A9597E79ACD7A992EB96EE5CA17F4E99A9A6DBAD16FCFEB18660DB7EFD8E8E816657F4D77479A6DDFA69BEF74B382039023801C01E4A51B8554456229F5977695DCB6AA2A5FFF9D37EF21B3F9DC6BED1EBE435F2FE73DA74D4A7A42EF8A5D57F7814A4E9EAD2F9B3AF5D7FAEFAC59F7E9DDD4033DD6F186BBF975F6E3EEDF5FA4FF8E1D1BEF34D95959CBF58701FBF615AA8A8A3F7BDDEE8927EED75BDC6FBF7DB4DAB265ADAAAE7E57DFFED0A15DCE73CEC858E2F53FA4A52D528D8D1F5B5BC297EAD3D9D9AFEAC768EF6B18E695D4C14CC86EE4BE5BB6ABACCB3B22C9BAAF3E2C6359C101C811408E00F2125A6CE10EDC40ED34DC5B2CED23B89B8DDFBEA0AABEBE525D7EF94FCC867685BECF3BEEB8499F2E2BDBE434A2679D75A63AE79C1FE826586E23975F72C9605550F047B3D97E5AC5C40CD05BA457AD7A415FB76FDF76E7AFFD38DBB6AD5393278F57B9B9ABF5EEE452F238CB9727EA695DAE8F9B3D37FBF1EDF38D8DD5FA32B90FDFE92A2A729DD7E5E8D132B3A1BF44C5C78FF09A2623E365AFF323465CE1FCDFF2DCE4B46CDDBEF9E65141BF8EF67D86F1D868EDA8E4AD69690B775B7EA73B10B670B382039023801C01E8C2BCF01DEED69B29E378C3FD49D0555C9C6936B64BF47DAF5E9DA4060FBE40555717388DB0BBF15DE24C2FE7172F96DDC92BD481033B547A7AB26EDA6B6AECADCA3BADEF706F706ED3D8F89173FAC20B637443DCDAF392FB90E9264DBACD6C8697ABACAC65EA8C334EF39A66DFBE6DFABEA50C7D54F5552A2F2FCD6AF8B7398F6DE8DDCB577ADDB7FD3F19FAE06FCBF56969E6DD07880BFE750C93863BD0D8B09BDB3AE3C47C87BB3D4D37DFE16605072047003902D0C579E128E5C79B9A22B3C619817F93DC6CFCFE2FE8AAAD2D54CB973FA71F63FEFC87CC663B5F1FA57BEEDC19FA7A7773FAB233BD9C4F4E7E4A1D39B2CB6C6AB79A0DF7227D59636395757472F7AEE905056FF87DBCE30D77CBCF4BEEE3E187EFD18F6197BB715ED16C5AFBB16B6A0AD4E1C3A5CEF390EBAAAADE71AEF3BCEFF8F8E1BAD136F416EEFFD0A7FBF63D4BCD9831B95DAF631737DCAD8D0DDF26B7AD5B9403FDF497BFA39407D37473947256700072049023006190177E87BBE5AD963E0D774DD065E8EF6A175A4D6A9E4A49711FFCACA9A9DAB9DEDD701F9F7ED830F919AD652A23E325959AFA8CDEE5DCBE4EEE43FE6665BDE2F7F18E37DCEEF32ED747D6AEE0BB9B3D2FCFC7B52FF377BFF5F5EF5B5BB5B758DF01DFA69F875C2EBBBCCBF36DE9FF97FFA53DAF9DEFFD84F1D8F0D774B7D6ECB6F63BDBADFD4E7720430C7E879B151C801C01E4084058E46580599F04D9507494ECC61E13893348A98F83AAC6C64AD5D0506136B14B75C374F87089FE9B97B7DA99C6DDE42EF53A5F52F2A63EED72B9B72C9795BDADCF37357DE44C5350906636BCE5EAE69B7FA6E6CE7D5025263E6236C4EFAAA953FF534D9B36519F962A2C5CAB4E3BED1475ECD85EAFE76638BB94DFAA6BE3C654ABA17FA7D9FF5157F79E75E0B6FFD4CFC97E2EF26180EFFFE35B86DE6ABE3CE8D7CEDFFD44D058696D0B736BCDB6D1CEA6DBDEAD7D1CCB535670007204902300E191975C23745BC3A421D81AA93348A9EA905753535544DDEF897A9C087C4309B4A5BBADCD76B04DB7FD7834DBACE000E408204700C2282FB2825E6E84662BB7ECA23B21721BEE8FA82EAA087D43912DDDBEBB77DF6904FF3BDBFE9AEE893E8FC377B659C101C811408E0084695EF28D13FFBD6AF9BEF85623B4BBAF7772C35D45755145F01B8AEF4F867936CF6D69B68D566EC74F7FB182039023801C0108F3BCC49875D0ACB81374FF975AF73F28926790521F525D5411FE86E2BB7BB934CB138DE07FEACBF7761DFDFD6FB082039023801C01E42544C61BEE03A8C59C80665EEE7742A4CF20A52AA92EAA287843E9ECDFC5F6B7BB3A58C101C811408E0084715E2659CD71676DE9BED4BABF47A2610629F501D54515256F289DD5747776F30E5670007204902380BC84886CE9962D67F29DEE8E7CDF5ABEB37DD06AE2A36206295541755145D11B4A47770367377216D8003902408E8008CF4B8CE1FEB9B0F276ACD8CBD6B722C37D80B441D13483947A9FEAA28AB23794F61E559C03A4B1C006C81100720444515E6EB31A6FD92D7CB1E1FE09B10BCC3ADDBAFE74AB39970620D1AC6AABD19E6444EED1C85B68B8CBA92EAA287C430976B770762367810D902300E40888D2BC0C30EB01B3D65ACD7783F584E5EFA7666519EE5DD063A2790629F51ED54515A56F286D6DA2879855677DE00516D8003902408E00F2128D0D7719D54515C50149B09AE98416AEFF8C669B0536408E00902380BC4479C3BD97EAA28AF28004DAD2CD6EE42CB0017204801C01E4A5BB34DC7BA82EAA6E1010DFE69A669B0536408E00902380BC740F279F7CD2770D0DC566F3B79B0A717DF555E13E7316B8BAC130B39BEC249A6D16D8003902408E00F2D26D0C1EFCE343F9F94BCD06701715E25ABFFE85B7CD59B0B39B0CB5046B61C04F7FB1C006C8110072049097EEE1AAAB2E5B3767CE54B3012CA5425C63C75E9566B87F768E85019847003902408E00F2126D060CF841EC8001E77CE372EDA0090E6D7DD2A3478F0A7316C4B13000F308204700C811405EA254FFFE3F2C4D4A7A902638843566CC554BCD973E9785019847003902408E00F212DD069D79E669F545452B68864350F9F94BD79BAFF941B32E666100E611408E00902380BC44BFF873CE39FBEF34DD27BED9EED1A3478DD13D8FD4CDC2807904902300E408202FDDB7E93EE9A4EF1F9B37EFBECFF94E77E77F67DBDA8DFCA0D17D7F168B8501F308204700C811405EBAB5413D7B7E2FE7F4D34F3D3C65CA2DBB376D7AF1604343210D733BEAABAFB6EF5BBFFEF9B7E568E4D601D2E43BDB17B33000F308204700C811405EBAB74BCD9A63D656B31AAC194905572EC3FD3BDBF2D35F710C291606CC23801C012047007901C0C2807904801C01E408202F0058188079049023801C01E405000B03308F007204801C01E405000B03E611007204902380BC00606100E611408E0072049017002C0CC03C02C8110072049017002C0C984700C811408E00F2028085019847003902C811405E00B03000F308204700C811405E00B030601E012047003902C80B001606601E01E4082047007901C0C200CC23801C012047007901C0C2807904801C01E408202F0058188079049023801C01E405000B03308F007204902300E405000B03E611007204902380BC00606100E611408E0072049017002C0CC03C02C811408E009017002C0C984700C811408E00F2028085019847003902C811405E00B03000F3082047003902405E00B030601E01E408003902C80B001606601E01E4082047007901C0C200CC23801C01E408007901C0C2807904902300E408202F005818308F7809007204902380BC00606100E611408E0072049017006061C03C02C8110072049017002C0C984700C811408E00F2028085019847003902C811405E00B03000F308204700C811405E00B45B9615FE966A272F130B6C801C012047007901109C2166B95A69B8C7F032B1C006C811007204901700C1CB6EA1D92E32AB172F110B6C801C01204700790110BC212D34DCE37879586003E408003902C80B80F6F3F75D6EF9EE365BB7596003E408003902C80B800EF0F75D6EBEBBCD021B204700C811405E0074824C83ADDB2CB0017204801C01E40540A78BF368B8137839586003E408003902C80B80CE637F979BADDB2CB0017204801C01E40540271AC2C2800536408E00902380BC00E19F2AA57AA7A4A4CC9C3871E2DED8D8D886DEBD7B07FAF92D2A88EAD9B3E777E79F7FFE67C3870FDF68FE1DC9029B1C51E4881C912372448EC81139222F4037B26CD9B27B468E1C591F1313A3E6CC99ADF2F3F35443C357E6B2FA3BAA8325AF635151A14A4C7C4E0D1C38B0B17FFFFE7BCD97FC625670C811458EC811392247E4881C9123F20244B9D4D457D6F7EBD74F2525BDA05CAE467361D2449DC04A4E5EA4FAF4E9F3D5A9A79E7A132B38E4882247E4881C912372448EC8117901A278A17CC10517A8A2A2EDE642E35B2A44555E5EA6FAF6EDFB0FA37BFC7EB8224714392247E4881C912372448EC80BD0AD2C5BB6F41EF904B4A8689BB9B07079D5D2A52FA9316312D4A851D7ABEBAFBF46DD103F52252F4A6A361DD5FE2A2FDFAB4E39E5942F8CE8DF9D4F912372448EC811392247E4881C9123F202741B72208D9123AFA94F4A7ADE3CF98D57AD58BE548DFEF92875EB2D63758D1D73A38A8FBF560D1D7A855AA417CEDF509D548989F33FEFD5AB571E2B38E4882247E4881C912372448EC8117901A2444ACAC29931313F522E57BDB98068F4AA8451F17A817CC30D239DFAD9CFAE53C3875D692E9C639B4D4F75ACCE3EFBEC4FCD5912C70A0E39A2C811392247E4881C912372445E80283071E284BD73E63C692E18BE6E562386C7A91716CC57596F65A8941793F427A0578D18AA2F97D32ED7977E6F47B5AFA64DBB77A7394B1259C1214714392247E4881C912372448EC80B100562638734E4E7E7980B86866675F7DD13D5C1BF7EAAB66E794765FF69835AF56AAA5A9FB9467D5CFDA1FA9FA993D5B7DF7EE9F77654FBEADD77730F98B364272B38E4882247E4881C912372448EC8117901A240EFDEBD5543C3E7E682A1BE593D36EB21555CB445ED28DEAA76EF2AD125A777ECD8AE1E7BEC21BFB7A1DA5F321FCC59E26205871C51E4881C912372448EC81139222F4094BCE928F565B372B9FEAE66CD9AA9A6FC66922A292954E5EFEDD1B56BD70E35EDBEFF56331EBC4F7DFDF5E77E6F4BB5BFA27CA1A6C811392247E4881C912372448EC8117901BA59C35DE7558D8D9FAB75EB5E53B1B13F55D51F55AA07A7DFE755A5A5C56AC8E597AAD757A7AA8686CF9ADD9E6A7FB182438E2872448EC811392247E4881C911720AA16CCFF70EABBEF8EA9B736A4AB614363554D75957AAF6CB7CADDBC5165BEF94795F6FA4A95FACA4BE6423B4DEF8674E59597ABF4F415EADB6FBFF0BA0FAAFDC50A0E39A2C811392247E4881C912372445E80A85A301F736AEB964DFA371965619C97B759BD9991AE17C82B962F512F2F5EA4925E78563D33EF697DA08DC52F2D54D75E33426D7C7B8DD77D50ED2F5670C811458EC811392247E4881C9123F20244D582F9EF4E3D36EB77FA8895B2005E96BA58D792979355F2A205EAF9C479EA7FE73EA99EF8FD236AE68CDFAA279F78D45C2867AADFCDBCDFEB3EA8F6172B38E4882247E4881C912372448EC8117901A26AC1FC8553B260969F8AB8FDB69BD51B69AFEA05B22CA49F9D3F47CD9DF3847AEED9B97AE12C0BEB31A313D4E69CB7AD05F3175427142B38E4882247E4881C912372448EC8117901A26AC17CD4A9BD7BB7A9471F99A17E79FB38BDE0955D8EFC555CDC10F5EB09E3F5A7A2A5A5EF7ADD07D5FE6205871C51E4881C912372448EC81139EA2259D6736EA9761A00825D307FEE55AE6FFEA6BEFCF25395F8DCD32A61D4756AC4F02BD5D0A157A8B82B87A8A1E602F99AAB87AB07EEBF471D3BF6173DADEFEDA9F6172B38E4882247E4881C912372448EC851171962B87F3BBCA5867B0CED1310F482F9081526C50A0E39A2C81139A2C811392247E4A80B65B7D06C1799D58BF609087AC1FC191526C50A0E39A2C81139A2C811392247E4A80B0D69A1E11E47EB04B46BC17C980A938AE2958004EB7F4B204714392247E4881C912372448EC29ABFEF72CB77B7D9BA0DB46FC1FC372A4C2A4A5770E2CDFAC2AC24EBEF187244912372448EC811392247E4286CF9FB2E37DFDD06DABF603E44854945E10A4EBCCF4A8D6C51F82C0A17DA8C5F72448EC811392247E4888AA61C651A6CDD063A6BC17C900A938AB2159CF8005B10E2A370CB02E3971C912372448EC81139A2A22947711E0D77B47E050308D582F900152615452B3809ADACC4D8D72790238A1C912372448EC81139224761C9FE2E375BB7818E2D98FF4A854945C90A4E5B575EA269CB02E3971C912372448EC81139A2223D4703CCBACFACB566559B556FFD0F0D667D62B877339F694D07A0ED0BE65A2A4C2A0A5670E283DC5210ECF4E4882247E4882247E4881C91A3CE253FF7956B35D6AA8D956FD6045A29A04D0BE64FA930A9085FC169EF1602B95D5D84AFE4307EC911392247E4881C91232AD27214635676104DB6BFDA6AD605B454408B0BE6FD54985404AFE0747477BC48DF9D8FF14B8EC811392247E4881C519194A3F186FB48FD9ECDB3CB6AC0279B75B1597DAD69FB9835C8BA8DEC6EEEBB255C3EA8626B371078C1FC172A4C2A4257705A3B204DA8EF871C912372448E2872448E287214D818C3FB77B6E574A2E1DEE2DD16FDACE97D7FAB7B32AD15E077C1BC8F0A938AC0159CCE3EBA6BA46E5960FC922372448EC8113922475424E468BC4FA35C69B8B766B787DCAEDCA7E9664B37D07CC1FC499B4BA6DFB66DADAAACFCB33E7DE0C00EBFD3E5E5A5A9112386A8C993FF434D9A749B576DDCB85C65652D532D3DB65C376DDA9D6D7E5EAB5727A9F3CE3B37E0F53535EFEAFBACAFFF40D7860DAFA88103CF73AEDFB76F9BD7F425251B545959B63E2D7F1B1B3F6A56727F0505E9CD9EF7F2E5CF39E7EBEA2A827E7D2368ECF81E60E67B66DD69FD0D86EFED22F1C035E4881C91A310E7883AB1458EC8111595398A31BC772397EF5FF7EDE07DCAEEE6B986F7EEE58368B100AF05F3FFB5A94A4BDFD241BAF9E6517A655F4EDF7BEFAFF5E933CF3C432D5CF88433AD9C97E93C6FDFBFFF3FA96BAF8DD3A71B1BAB544B8F2DD7DD74D30D6D7E6EFDFAFD505D7D756C8BD3486320D35457E7EBFB8F8F1F6E362CA9CEFFE25EC1F77E0E05056FE8BF1327DEA2B66CF9A39E46CE3FF5D4FDEA8E3B7EA172735FD3D39694ACD7D72F58F098BE5E2ECFC858AC2EBAE8427D9B7DFBB6EACB172F9ED3E2738CA0151CDF4FFE65E56499F5FC9705B19213E87691B692438EC811390A618EA8135FE4881C51519923CFC6B8B2139A6DCFA6BBDCA79107707CC15CD36A1D3B56A60374F9E5173B97C9F9CCCC97F5E93D7BB2BCA677370A3FF3BA2C3D7D91B952BECC5C69DE62360A1FAA961E5BAE93C622D0F54D4DD5FA3EEC3AE38CD3D4E8D1239DF3478FEE568585EB9CE94B4A327533515C9CA12EBBECDFF4ED7BF6ECA957E4E5F9D4D7BFEF4CEB727DA4FFCA6532BD3C97C38777AAD4D467D469A79DAAFF87356B92554CCC00E73672BDBC06F6E3CB6DF6EFDFA6FFCAF4F6EBE7FB3AF9FBBF2370E5C6B0B60878EE4ED496951CCF951BBB267A5C1F49DFA12347E4881C85284754688A1C91232AEA7234CEF0FECEF6C59D7CFF171BDEBBAAB36B39707CC1FC718B5557F79E1A30A09FCACA5AAA4E39A5B77AFCF17B556EEEAB3A4C9326DDAA4F9F7B6E7FAFDBF4ED7B96CACE5EAE468DBA4A4D9932DE5C594ED5D39F76DA2966C3B0505557BFA3023D7653937B375369365A7A4EB2ABEDD8B1D739CF65C2849BF469A979F3667ADD7F69E97A6BE57DAB3E9F93B3529FB71B8123474A9D692B2A36E9CB6A6BB7ABBCBCD5CEF5EEC668B19E461EC3F7F9C9F577DD75BBAAACCCD1A71B1B2BF5DF7DFBDCBBE1CA7368EDB58E80159C402B1DFE56565A5AC9F1377DAA9FE923E53B74E4881C91A310E4880A5D91237244455D8E3CB76E279EA0C778C6602B37E06FC15CDD62D5D595E9BF1B37BEA21B829C9C15E6CA6F810E5361E11A555EBE519D77DEFFF3BACDF12D73EEF37979AF59BBB7C6EBF38D8D1FA8408FBD67CF5BD696B973CCA6A1AAD5E72725D3A7A7FFC139BF61C3CB2A26E65F9CF31919296AE0C01FABAAAACDEA924B06A9D9B31F70AE2B2E5EA76F2F5BEC3CEFEF77BF9B6C36347FB69A06F756B659B3A6EAFF3D2D2DC9B97F797D6263FF5D4D9B36D16C0632F5E3C834A9A9F3D459679D6936193BF56DEDD7B1B5FF23440BDC111D58B9490862A5C5DF4A4E5B576E7C5772BA6277BEB6BE56E4881C91A310E4880A5D9123724445558E0618C7B73EBBACF327821CBDDCF327C36268B500BD60FEA84D9599F9923AF9E49374C3B06AD5737A57D2871F9EA2CF7FFFFBBDF45F7B5A77A370833EBD6F5FBED324D8D3343656A8408F2D978F1E7DADB902BF569F6E6AFAB0C5E765DF7F65E526E732D9923862C4E55ED365652DD1BBCC4E9FFE5F6AD2A45B74C9F391DB6664BCE8F7791C3A54E8DCB7FC9586406E234D8CFDFF49B95C95EAC081EDCEF9D2D237F5F3B6EFFBC89112EBE058DB5BFC5F42B460B61F4716D0716DBC4D5B57325A5BC90976E5C6F3F13FEB822D0B6D7DADC81139224721CC1175E28B1C91232AAA72749FC7745927F8F9ACF578AC99B45A805E3057B558070E6C53B9B92BD4B5D7C6AA1B6FBC5A9F9E3BF7011DA479F31E5453A6FC87BE4CCE9794ACD3B7B11B85CACA6C6B65BF526FC992FB90EB1B1BDF57FE1E5BA693CBD3D216E8F3727AC182475A7C7E32CDFCF9339B5D76FBED095E976DDCB8547FD7D4BEFEEAABAF704E6FD8B0D8996EFFFE023DAD5CDED0F09EFE5B5595A3F2F25639CF3B31F121B389D8EEDCA6BE7EAFBEDC7E7DECDBC8DFECEC54E7713233535AFD5F42B860B62BBB954F4683DD8D2ED04A4E8F76AEDCF86ED108E54A4E5B5F2B72448EC8510872E4398FB76D7BC3C986E4CBDF7432DEE443A3C9936F773E203AFE41D1529595F5B2DF0CD5D66ED1B7F57C3CC9A9BFC7282F7F5B5FEF727DA0EAEAF638555DBD597F68D4D2FF218FE3795E325053F3E716FFEF9494275B7D6D1E7EF837CE69CFECECD9B33EA8D7981C45778EDA3206ECE5AD9CCEC959A64FCBD80E741BC9838C33FB7DCCBEADEFF959B3EE09F81EE4F9BE2065BF0F1C39B2A3D50CD925CFD5F379CAEDE5EB53819EB7BC4F1D3DBA531516A6AB2D5B5E57D3A6FD5AFF953DCF5ACB7184E4C8B3099E74829FCFF81036F740A434DC1FB6584D4D1F982B1215CE7959E9902D7437DD74BDB5F06D7E1B690A2EBAE802BDB03B7AB4C45C60BF68ED5E7AB7BEBEB1B15CF97B6CB96CEAD45F39E7ABAA3679340ECD1F47763B95C7F1773FAB563DEB7599AC58FDE427FFDAEC7AF70AC92BCD6E3F6CD865E64236435FB77F7FBEB5F2EF7E3EFDFAF5D5D7D9D3DBFF4F6EEE72E7F695957FD27FB76C59AD2F97D37979AFB6F85A77D182D9F393D1111D5CB9696925A7AA032B371D7D3E27FAB52247E4881C8520475232660C7DA4FF1BCCA6798975A4FFFFD4A7DD47FA7FCC99F6F85E22C76F2F7B56B83FB40A9C217B1CC963D5D5EDB69AD5CC80D33DFEF8547DBAA464AD3A76ACD4B9CDF8F1A39DE98E1C2956E9E92FE84C4816972F9FA7A7B19BFE29537EE964DC5E56C8CABFFC5F9326DDACFFCA5E27717197E8D3521B36BC647D15C5FBF9AC5C39DF39BD66CD1F9A9D6E4B91A3E8CE51A092BDAE92937FAFF6EDCB733E18B54F979767E931EE3EF6C687FABDC91EBF863EB8E5123DE6274CF88593CDDA5AF7F137DCCDAFFF316ABF37C8F2BEA0E035EBB81D795ED3CF9EFD5BAFF741C98BFD18F67D05CAB0DCCEFD215D9AD7F592D3B2B20DFABA279EB857FF6F86FE9A57BA5E36D8CB07C96D7B5FCF30CA51B5C7E5179FE0E733C8E3B13EA5D502F482B9B24D555DEDFE84B1A2E26DBD9093DD42ED85A4AC0C34355538D3BA5772E29DF3870E6DB316D66FE9F38D8DEF29DFC736F4019B7ED1EC71376C48B18EEC7C91AAAFDFE35C2ECFE1ACB3FE3FE7FC912345E6827FB1B9B05E65AD94AFF4BA1F790E2ED7FBE60A47926E74CACAD6EBEFA18E1E7D8DAAA9D9DCECB9A4A53DAF0F5A75ECD84EEB08CBDBF5E3CB69995EFE26253DAAA76F68D86B6DED1BE2F1265360BD69BC63BE193C633655A9ADBEC65DBC60F6FC6434AE133EC1F7B792D391951BDF959C84307AADC81139224721C8913D8E641C7BCE6F590997D3EEA6B8326086A464E559C6978C297F199231BD7AF5737A5CCB74729042F97BEEB9FFACE6CD9BEE35AD64D1BEBDA1B73E3FA14F9F73CE0FACAF63F81F9F727FF6695916C85F79CC0307B6585BF28A9CEB256BF66D25738989BF73CECBD750DCCD7EA55E8ED8B9B9EEBA389591B1C86A74729CFBAAACDCA8FFBFB62CABC851F4BF1FB536FF67CCF82FBDCC96F33236E5AFBC27C875F6FB888C47392F070395F78EB163477A35C376664B4AD6E8F70FFBF2254B9E56175EF8233D4E172C78D83A46C72EEBA7245739CF43C6ACA1F7F0AAB03EB0B5F76AD9A2B321EF6DBECF5DDE5BE472B97FFB83DAECECA53ACB727B7FFFABBD0CB17362BFEFD8B7EDC8EB182663E32B8FF37D4FF0F3E9E3F1580DB45A805E307FD062D5D6E6EB1596A953C73B976DDCF8B2B93232D0392F2B0AF60A837D5E5688A64FBF5337119E25B7B557FE65DAC387B7E99586C2C2B480CF41AE73AF7CE79B0BF9DD7ACBDF534FDDDB6CBAD2D2B5CE279F9E9797976F50DBB6ADD65BE6162C78C8EBBA3D7BDE74DE583CA79715B5BABA5273656593BEECC08177ADEFD05EA7CFDB974B3534D80D448E3E9F9BBB4CFF35F4774F17B6FA1ADBD5868566A82BA983E3AB879F2D0955D6E51D91146EAF15392247E4E8C4E648C6D18001FF64AED4BF641DE9FF1E3D46EC0FABE4B434C59EB7711FE97FA91A356A84D504BCEC71A4FF057AFCF93EAEDC8F64C9F7F18F37EFEEF3FBF7E7390DB1EC21121F3F545F9E9696A84FCB5F799C4387B6361B9FF23C1A1BCBACAD670B3CB67027EB2DF09E99901C1D3952A8CBBD356F9E3E2D39F19CD6F3FE651AFBB47CA0662F2BECD7CBDDA490A3EEFA7ED4521514BCAAF700C9C97945A5A4FC5E8FE163C74AF4873D77DC3146BF3F3435BDDF6C9CC8B4925119CFB2D7D4C285B3AC2DCC6BAD66BAD4EB3632BD9C76B9CAF51897CB5253E7E8C7AAA8C8D2D74976DC1FDC26AAC183CFD3CDBC7D7BFB7EE5BD474E7BFE0FF27EE8DE529DD66C4CCBF3F337D6172F7ED2790FB2970BF23C827DFF89801C85EAA8E9A17E3C20DC1BEE8AA0ABA9A9BC5DB7A35AAE2EFE2474A7B5F5A097355D6B4781EDC81685B6FC2E6A386F51F07DADC81139224727384775753BF5DF8D1B17EBC65A1A827DFB72AD15EBD7CD95F6F5EABCF30678DDE67893EC3E9F97B7C2E3039F0AB3E9DDAB7C1F373737D56AB82B5ABCAF03070AF474F673D8BFFF1D6B97F6479D69CACA32AD2D762BF5636566BAB73A2F5F3ED76C381EB71A919D56E3FE82D9486FB70E34B8C56B3C4BC3613F57B90F399D9DEDDEFAEE6FFC4BC3633F7669E91AE7F2CB2E1B4C8E783F6AD3BCAFAADA681DBBE001675CD6D6E6E9EBE5BCE7B449490FEB0FC3642C27273F667DAD69BCF55DED297A37757B7A7B1CBB1BDB6CFD019A64DAB30CBDFBF76A3DBD8C73F970C9F3F1ED4CC96DE543B561C32EF57AFEF6F3B5EFC3F3B9BA9BE7E3CB94F4F4E7F5E5B7DE7A835E86B8B79EBBF7ACB233E4799B087E3FAA630B37D0A50DF7FB549854172D987DDFAC7D5726EA8C13F39DB9F6ACE474F577E602BD568C5F72448E4294A3CCCC85D691FE5F52AB563D63AECCF7500F3F7CB73EEF3ED2FF4BCEB4679E79BAD9245FAF4FEFDBB7D969B6ED691A1BF728DFC7CDCD7DC5DA0A9CACEEB863B4BAEBAE9BF5F4863E18D9DD5ED31E3D5A68ED365B6CAEE4CBD72DCAF47DDA9593B3D45C79CF6F363EEDC77737D00BADADF4E3F4E96DDB5E6B36FD88113F759EC3E4C9B7EAD3EEA3FC5FEF4C575C9CA6264C18E334239EF76F9FCEC8F80339224701ABBEBE545D7EF9BF39634DC6BF9C2E2B7BD3194BB2C7C439E79CADF6EFFFB3334E644F2D1973C9C9B3F49E53A3475FADB369E8DDB2373B7F65FAD4D4D9D696E9755653FC9ADFB1678F5B3B6315151BF47969BAEDE7664FBB7AF57CAFDBD7D4B8B750CB8700CB97CFD15F535AB2E449E7715B7A3C43EF529EE5DCAFA1BFC695190DEF477C871BE8DA86BB3CE4E5FE847F8E73BEAE6E47ABD3AF59B3C039DFD8B8DB3A90D2ABADDE2E25E5B156A791152ADFFBCEC959D225AF4B0817CC45668D0BB062D3914FF003FDD48ABFA3C206B392D39547856DEDB5EAD431909DBD5867424E1F3DBA3DE074E3C7DFD8624E3CEBC0813CE7FECACA32F44AD4860D8BF4A7FAF6CA5546469233FDB5D75EA16EBC7184B99294A3121367E892D3BED90DC7DC91A3E8CC918C616986EDB129A7E7CE9D666D85BB5F4D99729BD32C9794BCA16F6337DC95956F59DF032D331B82FEFA3E3CC79DE7E3D4D6BEA357B0F7EFCFD5CDBC9D33C9CEE1C35B9CE9E4BEE4B6D2FCA7A7279A2BF9D96AD6ACDF388F252BEB478E6C359B989DCDC6A7DCB7FC3F721F9ED93D76AC485FEE3BBDBB1928F768D6CBF5FF2AFF9F3D9DCBB5D7596ED8CB01DFDBCA73B31F931CF17EE4AF8A8B5F773E0492312CBB7257576FB40EE6B7D76B4CD9E364F1E2DFEBB1276357B2204DBBE4C1D07B6B14389994B127EF0DF65894DBCBFB908CE949936ED265BF1FC9F50D0DA5CEFC91E90A0B57EBAF6F6CDBB6CA6AC2D75BCD7C8ED7FF60E7CED05BD137EAEF72C7C7C739635FEED777ACCBE3C97396BD46E4B9CE9F3FDDDACDFDE968793FE228E540D736DCEF85AC4A4AD2CC2679A55AB060A6F57DB2A5E64AFE0BE602F47C73257EB6B9D0DC642DBC1FF7BA9D5C969CFCA83EED72B9B748C89B80EFFD1716BE662EAC53AC85768AFE74332EEEDFF569295960BB7739F4BE6F59F1AFAB2BD6CF4DCAD0BB43FDD2392DD785E2F509D182B9A52D081DFD24BFB5DF356DED775103196274CDEF9EB6F5B5EA94F95F559565359D2F3BE3A1B434BDD974870EE53B9FDECBB8EEDFFF872A2DED59BD22235992CBDC5BDD0A9DDB24263EA87F3FBBA6E64FCE65329D1C29DCDF73912D18B282E26F8CA6A73F17D6B92347D199A3A6A6BD7AF96F9F9F37EFB7D691FE473A99F12D69AE2513D5D56F9B0DF336B351F88375A4FF49FAFAC6C65DCAF371F7EC59A33FF0928641A691C774370DF96613FEA6B912FE807E4C7B7ACF8C555464EAE9ED3128EF6DBECF47F26CE8ADEC23F57392C7B2F32AF991AC48C3E33B9E258BF6749327DFA24FF7EDDB47CD9871A7DFF1BF72E55CE7B4FC4FF2DE6BE85D65DFB17617CE2247BC1FF9ADDADA3FEBF53143FF4CD7037A9CCAF25B3EDCB2C785E4C877FDECC8912D7A1D4EDE1FE4323B5B727B43EF75B1DC6C6A3738EB70AB573FD3E2D8B31FC3CE983C2F7B1D51C6B1E4F1F887BB81EF471EF3F8876CC7DFB3ECF549C9A0FB03EC04AFFCDA99B11F53FE46F8FB11BFC30D746DC35D16B23A7CB840BFF9373696EA727FD29F637D6AFFA25EB0DA2B089EB7B3177E478EBC6BFD4CC5837EEFDFFDC97EA273DE7D44D7E3D3BA8FE83A459F6E6828515959C9FA3673E7DE67ADE017990BF10CE7F1ECE7D9D4B42724AF8F11DE079768ED13FDD6566E8C76AEE4D8BB118E8BF61CB9B7D4FDD6392F5BAFA401F59CC6E5DA6DAE942FD4A7A5D12E2C5C65AE480C716EE75E0199E5759BFAFA1D5E2B0E999949FA3BB013278ED597D9974BC360DF46569A64D741693A8E6F7978D15A81CAB28E6C1E9EB92347D19D23197FF6789531191B7BB1F33E22E3D473DCB8B7705FE79C3F74C8FE79A30C7DDE7E1F92D3478F6E75DE7FE4C3A9DB6FFF59B371653FB69CAFAD757F775BB22479713706C7A77537DC65D6D1F90B9CC7DEB265458BEF5DF6F481C6B6FCCFFEAE93C7B71B6AC9B8BC0E867310AD32E7FF36F4AEF1779123DE8F02CE777B6CCB7897F71343EF1DB2C7B95EC697E7F4F21D6A199732E653539FD21FD8FA664696FB9EB791B128EF5F77DCF1735DBEEF339595EB9D4CCA07C365656BAD5FCE48759E9F6C9C31F4D6EF857EFF0F3BC30307C6A8CB2E1BE475DDFCF9F77BFD9F72B99D99BBEE1AE74C27CFC3D0BBBEBF1AE9EF4703CC7259CFC7659D3F11FA19EEEF6DDBFF7B0CAD16A017CC7B435AF6C2ACB232D3FA1474A7D50C645B5BF4D2FCDE66F5EA79D6016202DF7743C30E7321BE4E37E67673BE72E51C7DBAA6E66DDDA0F8BBEFB163AFF13A2FF7216F04EE159FFC90BE36613E5E026D5968EBCA4DB02B39F6E38D8BF61C19FA3B6937FABD7CC488CBBC2E938676F4E8ABCC95935FE89593C58B1FD35B9467CC98E85C66E8032D3DE3DC4759D91A7345E5157305668BD9FCFEC6FA5997623DCEED69B2B216398F215B347C1F57AAA969B7932DB9AF70CC1D398ACE1CD5D66ED6CDB3FB4328F76532D62FB9E45F9DF3F23E61BF5FD8E7656BF5F4E91374363C4B6EBB61C31F94BFC795F7A369D37EA51B072977037E83DFE7649F96C771EFD9E1BE5FF92B75F5D597377B5F93EC48032039966924FBF2BE28A7870DBB44E5E62E0938B6B3B35302BE46729DE7FBA8BB393F7EDDA851C3F463B6255FE4A8FBBD1FC9FA982CCFE5BDC05E0EBB9BDC57BCC685E77B85FB83D2D7F569976B97F37E63BF5FD8D314142CF3BACD820533F4F481C65E71F16B4E16E5AF7CC82BEF27723F8307FFD899561ECB1EF3727F921D69B03D7322FFC7C30FFF97DE2B44EAA9A7EE71DEBFECAAA878D3790CCFE7B170E143CEDF28783FCAF518E38927E8319EF1788CADB45980B360DE1392AAABDBAEB7444C9B365E2F186581B86FDF9F546AEA937A2177E44881B5B56BBB9E5ECEDF7AEBF57A1A43EF66FB925E495AB2E4719598385D5F9E97B7D45AF17FD7791CBBD1686C2CB13E897D419F9685AFBB613FFE9C5CAEE3DF0F92DBC88A956C2D2C2E5E65BDA92C0CD9EB633FF7081833B265C17777BA3B8DE07FD7D4DF4ACEC420B660444D8E72735F3657CA7FAAC7DBAA557375B33B63C6AFCD9565F796606916ECB16CE764FFFE6CA76975370FC9FAF632C6251B151519FABE65BA030772BDB2619FB63FF42A2F5FDB6CBC5755AD779A7D5949979CC6C5FD44FF9506DABD05604F58E68E1C759F1C3535ED0AE932BAAB2B94FF2F39EA9EEF47A118A3E198DB13F59CC22C47E33CC6B76CE5EEEC83A75D6C1CDF8A2E3581360B7016CCBB43562ED74E73E57FB373BEB4F4757321576AED7EF7BCD94CE45BDFCFD9EC753BF727A8AF998DC4466B57A5C08FE16E1264F7A645D6F7DD6ED6A7A549B8F9E6915ED3AE5E3DD7FAE4F515B3317851DFBF7D1F7BF6BCE1B1D53134AF8F1139BF57E8FB132D9E2B2B6D59B9315AB95D287F6AA54B735457B74D8F7BFBFC860D49CE18B7B35155956936AF3BFC8E97CCCC05CE7999C6D0C74658EC355D6DED26B3015FA7AAAB37E8FB96F1EEDE7AF18ED578BFE9D1E8B63C3EA74CB945DF6ECB9665619B3B72D4FD7244F17E448EC811396A937C8F86B8D2E8BC9F08939F022B37BCB76EF73200D80BE65D21ABFA7AF76F23DE78E370B32978C96A26DEB476934BD6D31C6F228EDFCED007E578C8393D75EA6D011FC3F3F686FEBEDB227D5A1ECF7D44D7E3D32E5FFEA4DE7D6FDEBCFBF4F9868622EBFB3CEBCDE6E30FD6C1727243F6FA44D00A8EE74AC8188F95958946F03FADE27BBB8EFEDE6A44E7C8D0DF6DFE1F7DBAAE6EABD540BF1470DAD8D88BD4A44963F53897317BC619A706BCEFA626FBEB1B6F5BDF815DEB8C77437F0F4EB64A17ABCB2F1FACEFAF5FBF1FA8FBEFFF9573FF32CDE8D12374BE7EF2930BC23677E4881C51BC1F91238A1CF91563B8F70AF16C8C3BDA744BB3EDB9BBBA1CE760102D16E0B5602E0D59353616793410A5D6D6B575D681645E719AF0BCBC97BD6E77BCE12E55478FBA0F3C73CA29279B0DC996668F61E823BAC69A2BFC0BAD2D6DE3F469F7115D2738D3D5D6FE49B95C3BF4CFBEC83435351BACA3CF96EAC6C3D0DF215A19D2D727C25670FCADE474C6968AAE38FA6B58E4E8C891779C2CC8F96DDB9659CDE7E680E3E5E187EF341BE82CA7DC1F5E2D6A76BFAB56CD562B573EA5EAEBB7E9CB0A0A969A0DF2F3BA41974C55576736BB7F791E9E8F6FE803B23D1CF0B9844BEEC851F7CE11C5FB113962FC92A316C9CF7679EEFA2D5BBADBBB7BB9DCCE73CB36BB92035DBD606E68701F855CBEAF6AAF98CB0AB87BAB5B966E0872725EF4BBC092EF81CAC171EC662423E33927DC070E6C0AB8A093C7696D613861C2CF9DE7274754BEFDF678E73AF7EEB0ACE0846025A7B35796222A477636D2D3E7A9A6A6127D991CDB60D8B07F6F71BC48D3EC7B59565652B3690F1FCEF5D87A5EAA9B683B3B923B43EFCE9DE6F731162C98AE1B7543FF26E9EFDB348EBB3277E4A8FBE688E2FD881C912372D426937C9A6E392D0752EBD7C6DBCB74CFF8DC87D423B456409834DCB2554BCE7B6EE99606DADF6DA4F990EBA74DFB0FBFD7FBDBCAEDB9A0F3DDDAE76F1A791EB2C5EFBCF3FE456F7DF3DD221FAA2DDD11BA82636F09E8C86E7791B8DB5EA7E5A8B4F435FDDD6A7BECC9DF59B3EE723E886A69BCD8BB94BB77FB5E68ED9A9DE9777AF9B04A1E4BFE0E1CF823AFEB240332FE03E53629E941EB006B7F6CD338EECADC91A3EE99238AF72372448EC85150C65B635DF934DE5956432E5BAFEDDDCD65B7F141D66DDE30DCBB8D7BDEAECEBA0D80EEB660B6B71476741A16CC41ADA404BB4520D20E481336390AA7B11B4EB92347E4882247E48822476D1263787FFFBA3DB5D5E03BDB000B6616CC2113EC6E7891BCDB1E392247E4881C912372448EA868C8D16D56E3ED0AB2D19E647034728005330BE6B05DC91962B877411A478E2872448EC811392247E4881C75B901663D60D65AB33E31ABC1FA1FE4EFA7867B77F399867BCB380016CC2C98BB5082B5F292D0C2F59F45C9CA0D392247E4881C912372448EA868CE110016CC2C982368CB42B4ECB6478EC811392247E4881C91238A861B000B6616CC61B392138D2B37E4881C912372448EC81139A268B801B06066C1DCA52B394951BA72438EC811392247E4881C91238A861B000B6616CC5D26C1FADF12C811458EC811392247E4881C91230034DC140BE6CED5871C51E4881C912372448EC811390240C34DB160063922472047E408E4882247005830B3600639A2C81139A2C811C8113902C0829962C14C8E28720472448E408EC8110016CC140B669023720472448E408E2872048005330B66902372448EC811458EC811458E00B060A6583093238A1C811C912390237204800533C58219E4881C811C912390238A1C0160C1CC8219E4881C811C51E4881C51E408000B668A053339A2C81118BFE408E4881C01882E279F7CD2770D0D852C14C3A0BEFA6AFB3E7396B81895E4882247E48822472047E4084014183CF8C787F2F397B0600C835ABFFEF9B7CD59B29351498E2872448E28720472448E004481ABAEBA6CDD9C3953593086418D1D7B559A394B121995E4882247E48822472047E40840141830E007B103069CF38DCBB5838563D7D6273D7AF4A83067491CA3921C51E4881C319EC911C81139021025FAF7FF616952D2832C1CBBB0C68CB96AA9392B72198DE4882247E4881C91239023720420BA0C3AF3CCD3EA8B8A56B090EC82CACF5FBADE9C0707CDBA98A1488E2872448EC811390239224700A24FFC39E79CFD7716CEA15F28F7E8D1A3C67CFDC73004C911458E408EC811C811390210C50BE7934EFAFEB179F3EEFB9CEFFE9CF8EFF658BB1B1D64A14C8E28720472448E408EC81180EE6150CF9EDFCB39FDF4530F4F9972CBEE4D9B5E3CC8EF3976DEEF31CA4F44C8512BAD0369C8777BD8DD881C51E408E4881C811C912300DDCCA566CD316BAB590D6629AAC3E532DCBFC7283F11C1512BC911458E408EC811C8113902000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A2DFFF0FF0398BADE63642580000000049454E44AE426082, '0');
INSERT INTO `act_ge_bytearray` VALUES ('928b709f808c4ef8ba4ed22c10629840', '1', 'test_audit.bpmn20.xml', '566004a976614fad8136b9394bcd1615', 0x3C3F786D6C2076657273696F6E3D27312E302720656E636F64696E673D275554462D38273F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A61637469766974693D22687474703A2F2F61637469766974692E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E61637469766974692E6F72672F74657374223E0A20203C70726F636573732069643D22746573745F617564697422206E616D653D22E6B581E7A88BE5AEA1E689B9E6B58BE8AF95E6B581E7A88B2220697345786563757461626C653D2274727565223E0A202020203C73746172744576656E742069643D22737461727422206E616D653D22E590AFE58AA8E5AEA1E689B9222061637469766974693A696E69746961746F723D226170706C79222061637469766974693A666F726D4B65793D222F6F612F7465737441756469742F666F726D222F3E0A202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9FE5AEA1E689B9222F3E0A202020203C757365725461736B2069643D226D6F6469667922206E616D653D22E59198E5B7A5E896AAE985ACE6A1A3E7BAA7E4BFAEE694B9222061637469766974693A61737369676E65653D22247B6170706C797D222F3E0A202020203C757365725461736B2069643D22617564697422206E616D653D22E896AAE985ACE4B8BBE7AEA1E5889DE5AEA1222061637469766974693A61737369676E65653D2273797374656D222F3E0A202020203C6578636C7573697665476174657761792069643D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222F3E0A202020203C757365725461736B2069643D2261756469743222206E616D653D22E99B86E59BA2E4BABAE58A9BE8B584E6BA90E983A8E983A8E995BFE5AEA1E6A0B8222061637469766974693A61737369676E65653D2273797374656D222F3E0A202020203C6578636C7573697665476174657761792069643D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222F3E0A202020203C73657175656E6365466C6F772069643D227369642D45463246353142422D314439392D344630422D414346322D4236433133303041374432422220736F757263655265663D2261756469743222207461726765745265663D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222F3E0A202020203C757365725461736B2069643D2261756469743322206E616D653D22E99B86E59BA2E4BABAE58A9BE8B584E6BA90E983A8E58886E7AEA1E9A286E5AFBCE5AEA1E6A0B8222061637469766974693A61737369676E65653D2273797374656D222F3E0A202020203C6578636C7573697665476174657761792069643D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222F3E0A202020203C73657175656E6365466C6F772069643D227369642D33444243443636312D353732302D343438302D383135362D3734384245303237354645462220736F757263655265663D2261756469743322207461726765745265663D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222F3E0A202020203C757365725461736B2069643D2261756469743422206E616D653D22E99B86E59BA2E680BBE7BB8FE79086E5AEA1E689B9222061637469766974693A61737369676E65653D2273797374656D222F3E0A202020203C6578636C7573697665476174657761792069643D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222F3E0A202020203C757365725461736B2069643D226170706C795F656E6422206E616D653D22E896AAE985ACE6A1A3E7BAA7E58591E78EB0222061637469766974693A61737369676E65653D2273797374656D222F3E0A202020203C73657175656E6365466C6F772069643D227369642D30324442324144392D313333322D343139382D414338442D3232413335313639443135432220736F757263655265663D2261756469743422207461726765745265663D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222F3E0A202020203C73657175656E6365466C6F772069643D227369642D32414237433031412D353045452D344141432D384338462D4636453139333542334441372220736F757263655265663D22617564697422207461726765745265663D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222F3E0A202020203C73657175656E6365466C6F772069643D227369642D33364535304338422D364337432D343936382D423032442D4542414134323542463442452220736F757263655265663D22737461727422207461726765745265663D226175646974222F3E0A202020203C73657175656E6365466C6F772069643D227369642D37443732333139302D313433322D343131442D413441342D37373432323545353443443922206E616D653D22E698AF2220736F757263655265663D227369642D33463533423642442D463846332D343936422D414330382D35303633304244313134373722207461726765745265663D226170706C795F656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D44343443414434332D303237312D343932302D413532342D39423835333345353235353022206E616D653D22E698AF2220736F757263655265663D227369642D46453438354232442D394132332D343233362D424430442D44373838434136453330453422207461726765745265663D22617564697434223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D35333235383530322D343345452D344445382D423141342D44424431313932324238414622206E616D653D22E590A62220736F757263655265663D227369642D43323842423546362D303133442D343537302D423433322D36314233383043314634364622207461726765745265663D226D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C6578636C7573697665476174657761792069643D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222F3E0A202020203C73657175656E6365466C6F772069643D227369642D31363344424336302D444243392D343338422D393731412D3637373338464237373135412220736F757263655265663D226D6F6469667922207461726765745265663D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222F3E0A202020203C73657175656E6365466C6F772069643D227369642D37323235384134312D323033452D343238432D423731442D43413335303632353244373322206E616D653D22E698AF2220736F757263655265663D227369642D43323842423546362D303133442D343537302D423433322D36314233383043314634364622207461726765745265663D22617564697432223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D38343438454634412D423632452D343839392D414243322D30453244423241453638333822206E616D653D22E9878DE696B0E794B3E8AFB72220736F757263655265663D227369642D35464544303244362D433338382D343843362D383730452D30393744423231333145413022207461726765745265663D226175646974223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D41373538393038342D343632332D344645412D413737342D30304137304444433144323022206E616D653D22E698AF2220736F757263655265663D227369642D45443436464534312D413046442D343936442D383644432D32433937414635373335463022207461726765745265663D22617564697433223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D317D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D46413631383633362D333730382D344430432D383531342D32394134424238424339323622206E616D653D22E590A62220736F757263655265663D227369642D45443436464534312D413046442D343936442D383644432D32433937414635373335463022207461726765745265663D226D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D31353235424646342D334539442D344438412D424638302D31463633414645313632383922206E616D653D22E590A62220736F757263655265663D227369642D46453438354232442D394132332D343233362D424430442D44373838434136453330453422207461726765745265663D226D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D33354343384336432D313036372D343339382D393931432D43434639353531313539363522206E616D653D22E590A62220736F757263655265663D227369642D33463533423642442D463846332D343936422D414330382D35303633304244313134373722207461726765745265663D226D6F64696679223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A202020203C73657175656E6365466C6F772069643D227369642D42444230414142322D374535302D344433352D383045452D4345304245434444394635372220736F757263655265663D226170706C795F656E6422207461726765745265663D22656E64222F3E0A202020203C73657175656E6365466C6F772069643D227369642D34344146423943312D343035372D344334382D423146322D31454338393741353243423722206E616D653D22E99480E6AF812220736F757263655265663D227369642D35464544303244362D433338382D343843362D383730452D30393744423231333145413022207461726765745265663D22656E64223E0A2020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173733D3D307D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A202020203C2F73657175656E6365466C6F773E0A20203C2F70726F636573733E0A20203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F746573745F6175646974223E0A202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D22746573745F6175646974222069643D2242504D4E506C616E655F746573745F6175646974223E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D2233302E302220793D223234352E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223937352E302220793D223335362E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D6F64696679222069643D2242504D4E53686170655F6D6F64696679223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235382E30222077696474683D223130322E302220783D223230392E302220793D223133352E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226175646974222069643D2242504D4E53686170655F6175646974223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2235372E30222077696474683D2239362E302220783D223130352E302220793D223233312E35222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646222069643D2242504D4E53686170655F7369642D43323842423546362D303133442D343537302D423433322D363142333830433146343646223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223234302E302220793D223234302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697432222069643D2242504D4E53686170655F617564697432223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223231302E302220793D223333302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630222069643D2242504D4E53686170655F7369642D45443436464534312D413046442D343936442D383644432D324339374146353733354630223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223334352E302220793D223335302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697433222069643D2242504D4E53686170655F617564697433223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223432302E302220793D223333302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534222069643D2242504D4E53686170655F7369642D46453438354232442D394132332D343233362D424430442D443738384341364533304534223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223535352E302220793D223335302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22617564697434222069643D2242504D4E53686170655F617564697434223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223633302E302220793D223333302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737222069643D2242504D4E53686170655F7369642D33463533423642442D463846332D343936422D414330382D353036333042443131343737223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223736352E302220793D223335302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226170706C795F656E64222069643D2242504D4E53686170655F6170706C795F656E64223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223834302E302220793D223333302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130222069643D2242504D4E53686170655F7369642D35464544303244362D433338382D343843362D383730452D303937444232313331454130223E0A20202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223234302E302220793D2234352E30222F3E0A2020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546222069643D2242504D4E456467655F7369642D33444243443636312D353732302D343438302D383135362D373438424530323735464546223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223532302E302220793D223337302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223535352E302220793D223337302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237222069643D2242504D4E456467655F7369642D34344146423943312D343035372D344334382D423146322D314543383937413532434237223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223238302E302220793D2236352E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223938392E302220793D2236352E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223938392E302220793D223335362E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338222069643D2242504D4E456467655F7369642D38343438454634412D423632452D343839392D414243322D304532444232414536383338223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223234302E302220793D2236352E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223135332E302220793D2236352E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223135332E302220793D223233312E35222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230222069643D2242504D4E456467655F7369642D41373538393038342D343632332D344645412D413737342D303041373044444331443230223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223338352E302220793D223337302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223432302E302220793D223337302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635222069643D2242504D4E456467655F7369642D33354343384336432D313036372D343339382D393931432D434346393535313135393635223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223335302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223738352E302220793D223136342E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242222069643D2242504D4E456467655F7369642D45463246353142422D314439392D344630422D414346322D423643313330304137443242223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331302E302220793D223337302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223334352E302220793D223337302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439222069643D2242504D4E456467655F7369642D37443732333139302D313433322D343131442D413441342D373734323235453534434439223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223830352E302220793D223337302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223834302E302220793D223337302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137222069643D2242504D4E456467655F7369642D32414237433031412D353045452D344141432D384338462D463645313933354233444137223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223230312E302220793D223236302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223234302E302220793D223236302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530222069643D2242504D4E456467655F7369642D44343443414434332D303237312D343932302D413532342D394238353333453532353530223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223539352E302220793D223337302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223633302E302220793D223337302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236222069643D2242504D4E456467655F7369642D46413631383633362D333730382D344430432D383531342D323941344242384243393236223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223336352E302220793D223335302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223336352E302220793D223136342E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543222069643D2242504D4E456467655F7369642D30324442324144392D313333322D343139382D414338442D323241333531363944313543223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223733302E302220793D223337302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223736352E302220793D223337302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245222069643D2242504D4E456467655F7369642D33364535304338422D364337432D343936382D423032442D454241413432354246344245223E0A20202020202020203C6F6D6764693A776179706F696E7420783D2236302E302220793D223236302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223130352E302220793D223236302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146222069643D2242504D4E456467655F7369642D35333235383530322D343345452D344445382D423141342D444244313139323242384146223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223234302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223139332E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541222069643D2242504D4E456467655F7369642D31363344424336302D444243392D343338422D393731412D363737333846423737313541223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223133352E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D2238352E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537222069643D2242504D4E456467655F7369642D42444230414142322D374535302D344433352D383045452D434530424543444439463537223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223934302E302220793D223337302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223937352E302220793D223337302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839222069643D2242504D4E456467655F7369642D31353235424646342D334539442D344438412D424638302D314636334146453136323839223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223537352E302220793D223335302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223537352E302220793D223136342E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223331312E302220793D223136342E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733222069643D2242504D4E456467655F7369642D37323235384134312D323033452D343238432D423731442D434133353036323532443733223E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223238302E30222F3E0A20202020202020203C6F6D6764693A776179706F696E7420783D223236302E302220793D223333302E30222F3E0A2020202020203C2F62706D6E64693A42504D4E456467653E0A202020203C2F62706D6E64693A42504D4E506C616E653E0A20203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E, '0');
INSERT INTO `act_ge_bytearray` VALUES ('d64a72fb53fc4fbca92cb325819e6261', '3', 'source', null, 0x7B227265736F757263654964223A2263616E766173222C2270726F70657274696573223A7B226E616D65223A22222C22646F63756D656E746174696F6E223A22222C2270726F636573735F6964223A2270726F63657373222C2270726F636573735F617574686F72223A22222C2270726F636573735F65786563757461626C65223A22596573222C2270726F636573735F76657273696F6E223A22222C2270726F636573735F6E616D657370616365223A22636F6D2E7468696E6B67656D2E6A6565736974652E616374222C22657865637574696F6E6C697374656E657273223A22222C226576656E746C697374656E657273223A22227D2C227374656E63696C223A7B226964223A2242504D4E4469616772616D227D2C226368696C64536861706573223A5B7B227265736F757263654964223A227369642D44463046463331422D453239332D344137312D383838342D424531323634363131464246222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22666F726D70726F70657274696573223A22222C22696E69746961746F72223A22222C22666F726D6B6579646566696E6974696F6E223A22222C22657865637574696F6E6C697374656E657273223A22227D2C227374656E63696C223A7B226964223A2253746172744E6F6E654576656E74227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D41343741353037462D453033332D343633332D424645432D414535433336304541333442227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3131362E30313031303030333730363332352C2279223A3131382E30333033303230333738303435327D2C2275707065724C656674223A7B2278223A38362E30313031303030333730363332352C2279223A38382E30333033303230333738303435327D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D45434637453931332D333334302D344137352D393642382D314646333736304546393746222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22757365727461736B61737369676E6D656E74223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A224E6F222C226578636C7573697665646566696E6974696F6E223A22596573222C226C6F6F7074797065223A224E6F6E65222C226D756C7469696E7374616E63655F73657175656E7469616C223A22596573222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365227D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D35344433334434322D373338392D343142352D413242412D443446433938303134353641227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3331382E36383638363630393835383832372C2279223A3134332E30333033303230333738303435327D2C2275707065724C656674223A7B2278223A3231382E36383638363630393835383832372C2279223A36332E30333033303230333738303435327D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D41343741353037462D453033332D343633332D424645432D414535433336304541333442222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C2264656661756C74666C6F77223A224E6F6E65222C22636F6E646974696F6E616C666C6F77223A224E6F6E65227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D45434637453931332D333334302D344137352D393642382D314646333736304546393746227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3231372E39303738323631373430373330352C2279223A3130332E30333033303230333738303435327D2C2275707065724C656674223A7B2278223A3131362E34313938323231323034373535342C2279223A3130332E30333033303230333738303435327D7D2C22646F636B657273223A5B7B2278223A31352C2279223A31357D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D45434637453931332D333334302D344137352D393642382D314646333736304546393746227D7D2C7B227265736F757263654964223A227369642D43364330333031362D453138382D344645422D423237332D443543313134464637373436222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22736572766963657461736B636C617373223A22222C22736572766963657461736B65787072657373696F6E223A22222C22736572766963657461736B64656C656761746565787072657373696F6E223A22222C22736572766963657461736B726573756C747661726961626C65223A22222C22736572766963657461736B6669656C6473223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A224E6F222C226578636C7573697665646566696E6974696F6E223A22596573222C22657865637574696F6E6C697374656E657273223A22222C226C6F6F7074797065223A224E6F6E65222C226D756C7469696E7374616E63655F73657175656E7469616C223A22596573222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365227D2C227374656E63696C223A7B226964223A22536572766963655461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D39463939414345392D334446342D344437462D414638312D453243383435444638324539227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3439332E393339333930313434353436372C2279223A3134332E30333033303230333738303435327D2C2275707065724C656674223A7B2278223A3339332E393339333930313434353436372C2279223A36332E30333033303230333738303435327D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D35344433334434322D373338392D343142352D413242412D443446433938303134353641222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C2264656661756C74666C6F77223A224E6F6E65222C22636F6E646974696F6E616C666C6F77223A224E6F6E65227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D43364330333031362D453138382D344645422D423237332D443543313134464637373436227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3339332E36343936313737353636323038342C2279223A3130332E30333033303230333738303435327D2C2275707065724C656674223A7B2278223A3331382E39373636333834383635313430352C2279223A3130332E30333033303230333738303435327D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D43364330333031362D453138382D344645422D423237332D443543313134464637373436227D7D2C7B227265736F757263654964223A227369642D36393245454646342D364438362D343539392D393233382D434545384441434234463141222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22666F726D6B6579646566696E6974696F6E223A22222C2264756564617465646566696E6974696F6E223A22222C227072696F72697479646566696E6974696F6E223A22222C22757365727461736B61737369676E6D656E74223A22222C22666F726D70726F70657274696573223A22222C227461736B6C697374656E657273223A22222C226173796E6368726F6E6F7573646566696E6974696F6E223A224E6F222C226578636C7573697665646566696E6974696F6E223A22596573222C226C6F6F7074797065223A224E6F6E65222C226D756C7469696E7374616E63655F73657175656E7469616C223A22596573222C226D756C7469696E7374616E63655F63617264696E616C697479223A22222C226D756C7469696E7374616E63655F636F6C6C656374696F6E223A22222C226D756C7469696E7374616E63655F7661726961626C65223A22222C226D756C7469696E7374616E63655F636F6E646974696F6E223A22222C226973666F72636F6D70656E736174696F6E223A2266616C7365227D2C227374656E63696C223A7B226964223A22557365725461736B227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D38393346414244422D453033392D343033452D423332332D453843313746383336353533227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3335322E30323031393931313038313931342C2279223A3330322E36323632363030393633363434337D2C2275707065724C656674223A7B2278223A3235322E30323031393931313038313931342C2279223A3232322E36323632363030393633363434337D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D39463939414345392D334446342D344437462D414638312D453243383435444638324539222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C2264656661756C74666C6F77223A224E6F6E65222C22636F6E646974696F6E616C666C6F77223A224E6F6E65227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D36393245454646342D364438362D343539392D393233382D434545384441434234463141227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3434332E393339333930313434353436372C2279223A3236322E36323632363030393633363434337D2C2275707065724C656674223A7B2278223A3335322E39313336363437303836313339362C2279223A3134332E393239323931353532343434357D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A3434332E393339333930313434353436372C2279223A3236322E36323632363030393633363434337D2C7B2278223A35302C2279223A34307D5D2C22746172676574223A7B227265736F757263654964223A227369642D36393245454646342D364438362D343539392D393233382D434545384441434234463141227D7D2C7B227265736F757263654964223A227369642D31364534383641312D374542352D343432332D423343432D414134303443314532434534222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22657865637574696F6E6C697374656E657273223A22227D2C227374656E63696C223A7B226964223A22456E644E6F6E654576656E74227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3131372E30333033303230333738303435322C2279223A3237362E363236323630303936333634347D2C2275707065724C656674223A7B2278223A38392E30333033303230333738303435322C2279223A3234382E36323632363030393633363434337D7D2C22646F636B657273223A5B5D7D2C7B227265736F757263654964223A227369642D38393346414244422D453033392D343033452D423332332D453843313746383336353533222C2270726F70657274696573223A7B226F766572726964656964223A22222C226E616D65223A22222C22646F63756D656E746174696F6E223A22222C22636F6E646974696F6E73657175656E6365666C6F77223A22222C2264656661756C74666C6F77223A224E6F6E65222C22636F6E646974696F6E616C666C6F77223A224E6F6E65227D2C227374656E63696C223A7B226964223A2253657175656E6365466C6F77227D2C226368696C64536861706573223A5B5D2C226F7574676F696E67223A5B7B227265736F757263654964223A227369642D31364534383641312D374542352D343432332D423343432D414134303443314532434534227D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A3235312E32373237323438343235363534382C2279223A3236322E363236323630303936333634347D2C2275707065724C656674223A7B2278223A3131382E30323137373931373537353038352C2279223A3236322E363236323630303936333634347D7D2C22646F636B657273223A5B7B2278223A35302C2279223A34307D2C7B2278223A31342C2279223A31332E3939393939393939393939393937327D5D2C22746172676574223A7B227265736F757263654964223A227369642D31364534383641312D374542352D343432332D423343432D414134303443314532434534227D7D5D2C22626F756E6473223A7B226C6F7765725269676874223A7B2278223A313438352C2279223A313035307D2C2275707065724C656674223A7B2278223A302C2279223A307D7D2C227374656E63696C736574223A7B2275726C223A222E2E2F7374656E63696C736574732F62706D6E322E302F62706D6E322E302E6A736F6E222C226E616D657370616365223A22687474703A2F2F62336D6E2E6F72672F7374656E63696C7365742F62706D6E322E3023227D2C227373657874656E73696F6E73223A5B5D7D, null);
INSERT INTO `act_ge_bytearray` VALUES ('e102464714de41648b2408f7d5d1f8bb', '2', 'source-extra', null, 0x89504E470D0A1A0A0000000D49484452000001CA000001220806000000798B9233000000206348524D00007A26000080840000FA00000080E8000075300000EA6000003A98000017709CBA513C0000000467414D410000B18E7CFB5193000000017352474200AECE1CE900000006624B474400FF00FF00FFA0BDA793000000097048597300000EC400000EC401952B0E1B000020004944415478DAED9D0B9C4DE5FAC7DF3D2633E372D0959029944A27F754723939278A944B2E5DD0E5B887533A22274EF7D43F85E844F1774B08B91C91E244A9A809452E991A0EA2F037B12733D67FBD7BEF19636E7B5DDEB5F6DA7B7FBF9FCFFB99B5D775CFDACF7A7ECFF3AEF7220400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000781A1FB700BC428F1E77DD7AF4E8F1C11919198D76ECD859292B2B0BFBB44962622971C51597FE56BB768DEFEAD4499DF6FCF3535FE7AEA8A749932637952F5F6ED8FEFDFFBD6EF7EE3D1760BB6A6CF7AAAB6A65D5A973E98EEBAEFBE3BCBFFDADED733E5FAB6C8412E292860D1B36F0FB4FBE9B99F9DB650F3E78BFAF59B31B45D3A6D789E4E4E4628ED0C22C97B4AEB87D341BE750F1D79973FBFD7E9196B65DAC5BB7494C9FBE58BFA7A50F5F7D75EDBBA74F5FB412CB53429DD4D41A73B3B373AEEAD3E7A1C4F0B6ABD26663FBAFDF9FA5DBEEB63CDBAD50A16C66E7CE6D860E1DFAFC148412E28AC68D1BDF959E9E3E7BC488E1A5060EECAF4791892598A556CC67230E24DA9C4571425E9CB01A13DC09136689A79F7E43EBD8B1F5539326CD7D120BB445EB4A952A2DF9C73F9E48B66EBB08A2D1BF1326CC16CF3CF386F8DBDFEE9BF3D863FFD3C3CD1FBA14B60E9114C943870ECD5CB0E0DDC4CE9D3B898484526162375F81EDBE22E23D5F09DBA2099FC1CFE1D69FBDBD49936B449B36CD7C63C64C6ADEB56B5BB169D3B76BB1446B2279F1C5172F7AFFFD8565CCD9AE6A9B8D9F5C2768BB37EA4239F69A279EF8EB952B577E361FA18458A7CEC99327572C5C383F49565515761CC515518CC3B1E230A25D4CAD09EF85179E275AB76EEA1B31625CF3F6ED5BACDFBA75D71ECCD19CED962D5B76D5B265EF97376FBBE1ECCE67D0567D168F337B3E6F3D23175E78AEB45DD1AFDF53755F7CF16F87972DFBCF970825C42C952B575E3E62C4F0EA5DBA74F21516C0C265E9D26562E4C827C4A44993C58205EF893265CA883A75AE30F990FB0C3A95D8174C2996292949BE0F3E587FF3C183BFFC0F16699CE4E4E4B963C63C59BD6BD72EA58D8864F5EA35C492254BC5A851FFD0B3A12116854A55F0E73378BC77335869BBC9C9A5C53BEF2C6FF1E38F735E1C3366FA69A7AF9980D94304A8A769DAD583060D4828D94104CBE8D163C433CF3C2BBEFDF63BB171E326F1D34F1962EAD4B7F4F54F39F4109BADE6341AD57B8B8103BB8BECEC9C2A55AA5CD01C93346EBBBA50D61F3A7470D9C2BF71F077D6EFE959F65BAB562DF1F1C71F07FEE6B785ECECEC18B81DBE88D9EED1A3C7CB0E1BF6F6036E5C0FA1844844E45DFBF7EF5B3AD8F8A1B0A3C9FFF02D5DBA542C5AB4486CD8B0416CDBB64D6466668ACD9B370732CC4F3FFD54CC9FBF20024EC0A778BFC8D1BB778784AA552F1A8A551AA653EFDEF71D3DBBE1CE99DF55B6D42C5FBEBC484F4F2FF124727BA54A1704EC19ACD1B36707B17BF77F1F422821262953A6CC6DCD9BDF946864DF891327EA99E4B7456EFBE8A38FC5AC5973B8A13668D6AC813878F05013EE84314A952AF5A776EDDA552D2E289A32658A78F0C107F500A4B7D8BE7DBB983061429E68CABF2FBDF4B2D8BAF55B7DFB83A26FDFBE62F2E47F093A1F58B7DDEDDB7FB81CA18498E4D8B16375828D20C2939191A1BB119FA856B59AB8FAEAAB459D2BEA88060D1A88EBAEBB4E76F216870E1DE286DAA05EBD2BC4BE7D872A73278C71FAF4E98637DC707DE9C25B82DD18C68C1923CE3BEF3C317EFC7871E79D7706FAB16ED9B225B04DD6882427A7E8EB3B89499326898B2EBA48DFFF2951B8EB0818B5DD1D3BD2CBB971AD446E37B84D4E4ECE39853B646BF922732D2FCA3E7CF8B0183972A4E8DBAFAF484E3AFB98BBBADE2592924A3BF84D3583EBEDEE1739929393A4F32760366A119A9624EFD999DFF36C7BCDC8F849CF22278AEBAFBF5E1C3F7E5CECDDBB57F4EBD72FB09C9292229E7BEE39F1C20B2F88FBEFBF3F9061EEDF9F91776EF9CEF2ECD71110CE7673724EBB928EF38040A45C4E183109769EEFD4A993F86EDB77858EFE72E397A262850AE2BEFBEE7140883493DFD5AC60426CDAB3161891473AF0279F7C322092F7DE7BAFE8DAB5AB58BD7AB518366C58A04A36353535F07EBD66CD9AA25CB96042949EFEA3A854E9A2287C67191FB64DF8021E79D87C453E7413278E1777DED151B46CD152AC59BB262FABECD3A78F68D2B891909DBDC30B9B1646F0E2E9A147B4D5DBACEC02921A6AD52A0202F9F5D75F0732C9471E7944BCFCF2CB81F791CB972F1737DC7083983A756A60BF9F7EFA49D4AFDF489C73CE39E2B7DF4E84DE594E118F3E3AD880AD9A0D408DFEFE1AF6434609DE75DA8587623B7AF48878F6D9E7C4899327C59B6FBE7956D5AB8CC8BFFA3A4DFC7DF808DD31EDB3F8006B71F4F07BBF1A389AEF6DAD5A35035D4064D9B97367205394D9E1A0418302D9E5534F3D15A872AD54A992D8B56B57E0A8EFBFFF5E3CF0C083E2C891A362D9B26581570C13274E3268AB666B33348BE7F3F233E2DE7722A3044F44E4671BBE4FBCFDF6743173E62CD16FC000B172E5AA400389FCFC7CF06771C925978856AD5A8BAE5DEF160F3CD85BDCDFFBBE2879C055085B343BB858AB01F1E9E2B75BB7C556676594152B56146FBCF146A081CFDB6FBF1D784F991F594D3B70E0C040914C98305E0C18D0C7E46FC6EF8B5042DC391C1985F7ED3B405C56B3B6786FD1E240E3868B2FAE2AFA0FE82F6EBFFD767179EDCBC5BEFFEE133366CC10937527947AE96562F98A0FC4C8118F0BFFC93744FFFE7F2DC679783D82E63D6874DA6E703923E3CC28801326BC2E264F9E1CC822E53BCA6EDDBA054474CF9E3D81063CB24A56DAB96CBCD3B265CB40262933D059B3668955AB9611F4987E76114A889B87C0177022BD7A3D20863F3E52DCD4FCCC6031D75E7BAD98FBEE3CF1C1CA0F44DA3769E2E2AAD5C4FC050B44B9F27F081AB12EA62FBC38560CECDF5FCC9BF79EE8D2E54E130F9866F121B5FB1E948C2F9602BCFCBF63EBD6378BB66DDB89575F7D35D0704756B9CA2A59891449995D56AE1CEC912307D49062BA70E1C2C02B84F6ED3B05D6CBEAD98C8C9D2ED9A4D342A6D9DC8F8C1210C8BCCF9DBB7413FF3B6396A851A346A1BDCBEA1177C78E9D4A3CE3B8D75E13B7B7BF2D24949A02F17332538458CA2873494FCFD0C570604018650BD75C81CC456692B9222969D72E28A812D967389756AD5AB868934E05799AC9EFE35D104AF04C545EAE6CD92245D2B031E7F5410B3731AEAA4819B0DDFCC19E14B89B0303F7CB4C5136D69155AEB9EF2C73BB82E4EF2F2947EF91EF3225D5AB57CF6B392BDF79DA9B9F92204F25B47A050F6495453F8C3367CC307496A2F7D31C7434769D94D516887623715ABEAAB5DD82136D6B7A06B9520C1D3A44F8FD27C48E1D5BF5CF1F8873CF3D37F0CE5272F3CD3707C62ECE154959153B76ECD8C0E760CBD9E5819291B1C382ED46AAD604A104705824B5024EE70CB366CD3474A6C2FB696196ED381A3B99A859A1B2DBD2D5EA75C15C8077E6736A6A0DB16DDB3781BE90E5CA95CDDB2EC72C960C1F3E5C4C9F3E5DFCF9CF7F16A3468D0ABCAF94EF312572B8BBCCCCE361023CD519A0DDEA54B7823C11511BA6EA153CE0707C0E9FDFA823B0B20F113AB65BFCEF2F47DCC9CCFC2DEF5DA5EC12B264C99222F7BDFBEEBBF5CCF32D5D641F7638D8B3536B12A9202FB2CF194209117434673B99DDBB778B5BDBDE92B7C7CF070F9EF5B938F2EFF7C3EEDD069C8C5547A3229BA4DF632CDAEE19CE0EFA5AB5BA45CF1AA7051AF004DF41D60CBC7F940D77723F1F3D7A542C5CB848DC73CFBDA27EFDFABA500E0A63839AC56D02DB4328217AA3F2A08329BE39BCD9A8D58E483A15A187FBEEAA04D76E840F566CB7B8FBFCF1C72B44EFDE7D44A3468DC5E0C1FD75111CA28B67DBC0B6E084CECB025967EFDE3D03FB0C18F05793B66BD40654BE838FBF2A7EDE5142041D4D51EF7ACC9470E72AEAC1372B922A2374CDA1FB18E9EF80ED165752532FD133CAC962F2E43744DFBE0F14F97B04F7991468F053781FB3F669B5B6448B804D9AAD6D895C90E7998C52D3B4E455AB56F55CBE7C798F1D3B76D4DBB66D5B9943870E25CA7E47494949DAF9E79F7FAA6AD5AAFB2EB8E0824F7372729E5AB162C5F73CB0B11699178CCECD666356334AA3CEC46E842E2C3A0A8866DB950D7C8E1CD917EA12A205061368D5AA65DE98AFC17D2ED1F7D91BA68B9355E15421A091E896223CF33C445C28A540FEF39FFFFCD79FFEF4A7EE19191989724827D951B76EDDBAA25AB56AB9830BFB0E1F3E5C7AEBD6AD97AE5EBDFAD2254B96F4B8FCF2CB7FFAF5D75F9FD6D74FE1818D6627E3B3F93084AB82B2BA6CD6D1A87424AA664301AFD86E6262A9BCED1919DF179999E60A69F8804C95703A91A1C5A6AD465428E7CF9F7F7FEBD6AD5F3F78F060929CD0B44D9B36454E5C2AC55216D98C5A8E64F1CA2BAFF8F48CB2C6C8912327EBFB3F72E0C081F6FA6EBB788063212A2F293AD74C9CC76C76E996A371D28144470B426C57456D8855DB7522AB74C356239B55464428F52C32F1C5175F5C3970E0C05672BEB6214386989ED95B8AAA5E4A4D9830A1CEA851A336EBC73F4C7619CD4EC64A66A939E8709C703466041F71C3763593DB9CA8968D74F0272C3C433120945224A74D9BF6E9A449931ACB81809B366D6AEB7C728A9A66CD9AA5B46DDBF6B54A952A251D397264220F72B4381B9F22C3D76C7C8EC4FB9F70E773A265626423F2D8144A9F03B61BC9ECD229318CFEA0CFF556AF32931C33664C63D901D7AE48E652AF5E3DF1D9679FA5E859E5F3FAC77B7890A3C9E194D49AD5E83105B799F95CD4C3ACD2D158E9202E1C702C740F71C77EEDDAAE597B5529924ED48498B14DEFBE3A705528E53BC9575E79A5D59C3973F2866D52853CDFCA952BCBA5A4A48CD73FD6E1218E362763444035934EC7C8E770C2A8D2D1A8723054CB46B7ED0A1B826974D9889D1AB5433B41566CD8AA6B42295BB78E1F3F7E927C27A92A932C2AB37CF6D96793CE39E79CB77998A3C1D9187530769D4E3887E3B4485A71166E46E8E0AEED96747C71EB546797666B3922FD7E33B2B6EA9A503EFDF4D3537FF9E597D2F29DA2930C193224E5C20B2FBC5450051BA555579ACDFDAD5461A98AD0553B1AB2C9E8B35DCDC6FE4E047BAABB41A9B459AB4189FBF6EE8A50CA6CF2A38F3EBA4B76019183023BCD5B6FBD5549CF2A07F0303BC6137AB943D86A0C66C5A918D9D78E60BA915DDAD9876CD21BF66B25A033B2AF30289066823DE1A0CDDA15C5E8B14D575ABDCA1177F6ECD99328BB74B8C15FFEF297D2292929979E3A752A55FF988EAE29E7A9D0DF937A59A91739D9DE3ABD64DAAFC6B21BE59B5DE774076F4DA1A37142FCB478B6DF137A59AA97B7ADD96F2446A3D12C6C73AA46C4E9ACD23BC19E2B422987A52B6E3001A7B8E5965B0ECC9B37AFB3BEF812BAE618297AE9102ABFE9E5DF7A99AA97357AF19B730C3E458EC5A860BAD5045F38E468A2C3C1789C327AB92B543243A2393DBCFD1675FF7C8A6CD78AFD7AA1AFB06A5BF55620E78A72C9B15BE5B0746ED2A953A78ABA50B640285D43CE52DB39547ED7CBFB7A9915723ED9453F204EF5A35421902A4452D52C2556C4906CD224E5F4D22D54B2F4B2402FF38AB65F4DD81F7AD16E36E9444669278374AA319B5060E7512294728073D922D54D1A356A24A3C57A3CFF11A1743ED19499E65ABD8C2F1CA9BB319B861302A9DAE1D871424E0A69DC92A4971EA1725C2FABF5F246C87E1DBE8F2A6B439CB6592F057D3120947216103971A99B6465655D108A0447F3DC473CD3BC355424E9851F029F42A762C7E93895510A0BC75AD9665E48D3D3F7E5AEE039299AF222D8F0E78EDC151B367C299A366D64D376CD6654AA334A3B419C55BBB49B5DC6F83B4A3955961CD4DC4DDE7DF7DDDCFFEF499E754F916A5EF09CCC26ED3A192B91BA59E154DD80E2CC31D3A62DC95DE43931C8F0E14F89356B1647C876DDCC2855057B2AB2CB38C828CB962DABC9A9B2DC14CB8E1D3B1E1E33664C457DF1191E6DE51875AAA745E12E483FE8E5B2921F009FC50C526544EE54546E5438CD3A1A6B917AAF5EEDC59831B256518CC17E0BD9EEE9A27CE4D34F3F2ECCCD1C62D67E3505F6AC32C0331BBC19B5434DC1BE31249472D2E503070E94AE55AB966BFF587272F2AF22F83E6C34BAE6AAA3C9D14BA9D0B214C9A37AF950041BF6AC08FD265AD10D22AC66985EA9C2B21BB53BD1AFADE4F3A5A65E9CBBC368EC374076C82F261463BF279B356BA2400C556593566CD4493B552978DEC92E5D11CA2A55AAFC94969656CB4DA1FCF0C30F77879C36388F6CE55A3AB42C453233E454E6869CCC51754EC549A7E364A31E5522E974EBC2B843668DA744B0014FAE4F3460BF6EDAAED3B5216E0BA76A018D11A1BCF0C20BD7AE5EBDBA56E7CE9D5DFBC766CF9E2DEFE25A34CC154A879CCB7CBD2C13C126F57EF34EC1A7C0A15811CD48F45153118D9B7534B4802D828490489AB05F2BD5AE91B65DAB415DA4B34B6FD8AC2B42B96FDFBEE7F48CB277767676824B830EF83FFBEC33398308C3D8398B8CB4D788339DB48F3A1751DB3DD6E916B06E46E8761C0D449FFDC692EDAAAA728DC177949B366DDA7DF9E597EF59B16245CD76EDDA397EBDD75F7F7DC1E9D3A76B0886AF738A51A17B3B3F7CE6E88453712B227722BB54ED689C1C760CFB8D2FDBB52B9246C5DDEAEB8238988FF2E0C1838F3FF6D8637A5299ED78943878F0E0AB44B0833038C3D37A99695D24738D5C53E454CCCC5B59DCF5554EC9559233A01A2BFAEDD72DDB152EDBAE5D9174A2AB93376CD535A13C76ECD8BC5F7FFD75DBB871E31CBD4E870E1D16E8622C478379073D8B06349B25DCF94A5AAF597032E11C905B93424797A3C176ADD8AE91F92955DAAE9D00CFAD211C63789AAD7C59E5EDCF3CF3CCC90D1B363872FE55AB56BDAF739BBEF89028727C51880E2763C739198DC6CD4E926B749BD54C53A548229CB165BB5A986CD6A87D0AA1662E56ABD9A59399670C09A54EBADFEF7FE88E3BEE38919E9EAEF4C4DF7DF7DDFA366DDAC8B15D87E9653B0F7334381B558EC8CA84B866ABB08C3A19A351B75B55B0DE7034B129946EDBAED5E0CE4A16A95A2455057691B15DB78552E84239EBD75F7F1DD4A449934C5599A5CC24AFB9E69AEAA74F9F9E2482EF1E202EAAAE8C44E2E1B24C4DB193B11295BB995D2292DEB2DF48D8AEA668395C30685524E37450F4829C3A75EAAD43870E9D68D1A2C51BA3478F2E356CD8B0B216BB8D1CEDD4A9D3A2F7DE7B4FCE082DC7959AC6C31B0B19A5C467E118A3D7B132F88051C1531189ABCE2EEDDC3F883EDB3563934E66976E76298941A10CF1CEEFBFFFBE61D4A851535F7DF5D5ABA74E9DFA87DB6EBB2DC568623A79F2E4450F3FFC702D5D74E5703FAD04D5AD71E68CCCEEAFCAE9445BF71104D2FBB61BEE182706FBB712F83935F6B1F7B3CBC4085B547A4E4ECECD070F1EECDCA143877E292929D7346FDEFC508F1E3DCA356CD8B074B56AD52ACB81D48F1F3F7E70FFFEFDC7D6AC59B373E6CC99A53EFDF4D32BF4E3AAE9C74F14C1AA561AEEC4853371CAE9B83107A08A4C333AA3716CD76DC134639F910CF08CD68844DE76133D6279F375E19B9F9999596DF9F2E59DF572A3BE4E4EF826FB3925EBA582088EC728EF989C44B59F6030811876362A6660B0E25CCC3A15A7334A4412DB8D84EDBA11E019B5D9389A66CB047BF5322E540047A4F8185555584E65944E679710FBB61BA9DA1027B2CB386FCC0310B961C0EC3818154EC68CC350299C105FB6AB4A2023955D7ACB76114AF090B3F1D93C5E8573311B9147437609B167BB5605D36B631B7B5F24114A88C1485DB3B8DD6E1596958CD2E9A81CA22FCBD43C66BB04780825C48063512D9AD1F8CE0791C476DD0CF6E2CF76114A88B0B3F1293A8FEA485DA560466270027047C47C2ED8AEDD6CD20BC15E74DB2E420931189D7BA5FAD5E9081D918C3DFB5569BB4E09A4D5402E7A6D17A18418124855D9A49302A93A124724B15DB3B6AB4220E32BC0432821CE9C57B45761914562BBC2015B75C35EA337C043282146A372AB9DB8BDDC470D918C9F8CD28BADB7E337C04328C163CEC667E35895D1B8118762C6A9C467248EEDAA12594DC17A3733CAD80AF0104A88B1685DF57060761D8CCA081D818CFD4C53B3B15DC5685376853036033C8412A2D8A938E978BC5085854862BB6ED9AE6A7B8D2DDB4528C103CEC6A7E01C76F7776AC074D5113AC486EDBA61BF5E7B5F895002782842D76CEEE3F4189A6491D8AE53F61BC9D6DBB16BBB0825B84E4242C2EF7EBFBF74727292479C99170620888C93F1FB7F97BFC7691D0CD3E82DF36789E4E4D2C9DE10E34855BF463E8B94B65BAA54829693E3BCED2660F7E0363E9F6FE3A79FA6FDAEDE991457C2ED57DCB6A2D6175C67E77351DBDC8DC4D3D2BE17952A95FF01AB34CCC60F3EF864BB7BB61BCE7E55DAAE66C1964B3ACE79DBAD5EFDA29F5D09EEB17B709B9C9C9C8F162D5AB527BC8330538C3A20234E4708770433724E2697B56BBFCACACC3CB114AB34CC9A1933161F8C8CED6A1EB25D1171DB5DB72E4DA4A4A47C845042ACB260EAD4F72A66679FCA36EE3CEC3A2015917AB8085C33E894222F90B94C9C38EF4456D6A9B998A471DB5DB4E8A3AB74DB3DAC46F8226DBB2A82BDC8F0E69B8BB2F6EEDD3F11A1845825EDC489935F8F1CF9EAB7C6ABA3EC5661090BCE459583F19E404AC68D9B7DF2F0E1235BF5C50D98A471DBCDC9C9F9B667CF11FF3167875EB55DCDA27D47D67E274C78571C3FFEDBB6E3C74FAE4728219619FAD24BD3AAFCE73F1BF7C7571556E40552B275EB6EF1F8E313FC274F66F5C714CDDBEEECD9CB6EF8F7BFFFB33E766DD7BBF62B6D77E4C809BFEDDF7FF85EB7AE590A9B87087158D3B4B459B396DCDABC79C3CCD4D4AA7F307F0A4DF1FE4E36B9F74E73F9CD9B779DB8F1C6077E3971C27FBFFE711DA668DE76F5F2CDECD9CBBB356E7CF5D6DAB5536BC4B6ED7AC77EA548B66AD5E7485656D67DA74EE57C8250423CF0C3E9D3DAB7D3A7BFDF7DDFBE83EBDAB66D562341C7DE299D9A89C1AAD3F1567FB251A3266DBDF7DE51A5FDFEDF1FD43FD288C786EDEAE53B5D2CFB6DDDBA6371C78E3757D14DB78C3BB66BC57EA3DF769F7F7EFAFEEEDD479C3A7EFC444F5D2497B8796D1FF60E1EA08E5E5E494C2C55B77DFB965BEEB9E7B68AB7DE7AD355C9C94915D49CDEE9F133BD1B81FBFD59D9EBD77FB373EEDC553FBFF3CE0797E84E66B7BE7AA80CCE313B75B6AB8BE4557FF9CBF51B7BF6BCBD7C870EADAE4A4949AEEA4DDB15223D7D9F98366D89E8D5ABBD484DBDD8C3B6FBBBF8FCF3AD7BE7CD5BB56FF6EC0F2E3E7AF4F80E4DD38644C276114AF012F5F4D2492F2DF5D2482FC9DC12DB64EB254D2F6BF4B240D07007DBC576114A00002891D17A79522F6342CB10065ABD02000020940000000825000000420900008050020000209400000008250000004209000080500200002094000000805002000020940000000825000000420900008050020000209400000008250000004209000080500200002094000000805002000020940000000825000000420900008050020000209400000008250000004209000080500200000042090000805002000020940000000825000000420900008050020000209400000008250000004209000080500200000042090000805002000020940000000825000000420900008050020000209400000008250000004209000000082500000042090000805002000020940000000825000000420900008050020000209400000008250000004209000000082500000042090000805002000020940000000825000000420900008050020000209400000008250000002094000000082500000042090000805002000020940000000825000000420900008050020000209400000008250000001420915B0050887AC9C9C95DCB942973DBB163C7EAE4E4E49CC32DB187CFE7CBD1CB37A74F9FFE48FFB8402F1BB82B805002441F752A57AEFCBF9A76FAEAFEFDFB956EDEFCA6C4A64DAF13BA6816D84D2BE1B366605DB87DAC9CC3DB7FFD7E7FA9AFBFFEAEEEE2C51F959F3CF9DD2EC78E1DDFA9AF1EAA97AD981D783ED0E3160008D1B871E3BB76EDDA357DD4A891A5070D1A909098682486D40C8A65EC089EAABF23478E4B7BE185A95573724EDFAF7F5C8A05BACA68BD3CA99731A1650843296E0120928DEF3A74E8D0CC850BE72775E9D2C99790502A144396544411CB05E34F1FF16831DC7CF37595DBB76F79ECEDB717B6D3C57287BE6A0777C5355A86CA5ABDACE1768487C63C10D7346CD8B0417A7AFAEC3973669E23AB590B8B5A4171140684B1248A3B4FB873F8C21C6FF7FCEE53BFFE95177FF6D96CF9EE728AFEB12ED60808258007F1FB4FBE3B62C4F052678B64AE30261410CA040B59A45181332A8C6605D2A8604786060DAEBCA47FFF6E9BF5C557B046F02A34E681B8A5478FBB6E5DBFFEF3CB060EEC6F48E0962E5D22C68E1D2BF6EDFBAF2857AE9C18326490E8D5AB9728DCB8271AF145ECFF98306144AB295316FC9095F57B53416B58F020BCA384B8A57AF54B2674E8D0BE56CB962D44B8F78E23468C10CF3EFB9CD8B265AB3872E4883878F0A058B66CB9D8B16387E8D8F1CE2817C88893B073E74F1BBFF9E6FBF3F4E55558A6E3B414BCA33467A0DC0288573232321A356B76A328B92A5566924BC5E2C58BC5DEBD7BCF3A3E3B3B5BBCFBEE3C3165CA5BC5880E8D788C67F76DCF0D396F008412C02BECD8B1B352F0DD64C94C9F3E5DFCF8E38F81E5A4A4A44049484810B20BC9B9E79E2B1E7E780837D3262D5A34BE52FF538F3B015E84779410B7646565F982830968E2CC3BBAC259E081030702EF246BD4A821860D1B26DAB76B2FF2F7B3AC573FD7BF9734100194447272E972DC05402801A286FC02E713952B571699999962EEDCB9E2A20B2F2A4270FD31F2BF02405150F50A70966014FEDBB3E77DE2C4891322B154E1B872FEFC79A265CB96DC3E008412201EB2C782E3AD064BBB76B7899A356B8AEB6FB85EF80B648F635F7A49BCFEFA78617C0837ABC26D361334BB9DCC1200A104302596C1E523477E15CF3C13EC16F2C9279F88E4A4B30748AF52A58AE8D76F90D8F0F9467D6FCDC4B5CC0AAA1646E0AC6E078070F08E1210C9420D798262F2D65BD3C4CC597344FF010344EBD6AD45963FABD0D1575E79A5B8F6DA7AE21FA3468BAAD5AA8A175F785A5C70C1798893E5400500A104F0B8580A9199F99BE8D37780A859B3B658B86871A085EB1FFF78ADE875DFBDE2F6F6B78B6BAEB926B0DF0F7B7E10C6E5F4C500000C4E49444154DBB76F178F3EF67771CF7DF7892FBEF842DC714717316DDA9BA276EDCB4C648556F7431801DC80AA57803CE7AD89F4F41FC56DED3A887BEFED29FE3E7C785E3790AA55AB8AF9EF2D1455F4BF9BBEFE4A7CFEE59781E599B3E7888B2E0AB6846DD2A48998316BB6E8D6FD5E83A267B5DA5573F01E94741DCDA1FD00C82801A220BB0956BBB66DDB4E2C58B838D067B220152A54109DBB7429F16C5234CB962D578240D86DA463469054BDB7D44C7E1F00324A801814CA604659B7EED5C2D8A4CD6645CC6856695450ED7C27004028014C0B485044AEBDF61AF1E5175FE46D99396386A13314BD9F1666D94CCB57AA3301104A80886694C1E5468D1A882D5B36E7AD99356BA6A1B314DECFAC481ACD4A8D668BAAAB6355F70F753273064028011CCA28A55036145F6DFA2A6FCBDD77DF63E80C45EFA709E3EF27AD08A7A6E87FB7B3DDAE3003781F1AF30022996F20F4F3CF3F576CDBF6AD6877EB2D79EBDE9933D3D079DE9913AC7EDDF3C30F0632CA70626227F3448400104A00E56279868C8C9D3632B1923227CDC63AA3999B952CCF6AEB590084329254D3CB1D7A9153CFCB398C2AEB45B6B997036D1ED04B9A5ED6CB605F2F7BF919C1BE48FA0C88A019D1B492513A915D3A79CFEC0A2D020C08A515A4380ED04B33BD2417B15DAE4B0D15B9EF58BDACD1CB54BDCCE4E7045559A5BA73181541A359A159A1F162D6883002426905297C93F4D2C6C2B12D43A58F5E7AEB65173F2B5873DA3E07C4D16C7669561CAD669EAAB2460084D20DBAE945CE53747EDE974A4C0C0C42DDA95327D1B469D3C0C4B9E79F7FBE387AF46860B6F9B4B434B160C102B174E952E1F7E74D7B24B3D0AFF5D28FEC12CC09824F91F3B7229066324DCDC4B5ED64954E082AB39A00426995767A9991FB3DA4400E1932440C183040A4A6A616DAB962C58A8152A74E1DD1AD5BB78068BEFCF2CB62DCB871223B3B5BEE522E743E59453B859F17AC099CCFC23146C45255766925AB5439349ECA7B0D805086CB24F344528ADFBC79F344DDBA750D9F40669A63C78E153D7BF614DDBB77175BB76ECDDDF4A60836FC21B304838EDBC9C63C56045345B5AC532248752CC417911A7040A68BE37345B259B366814971CD88647EE471F278595D9B0FF9CEB30E3F311877FE564B51E728B8AEA8CF252D5BCD2EED0A9A1B428AC00242690499F19D9F9B492E5CB830F00ED20EB24AB640465A2E741D000B0269E718A3826965D9C9AE246E09290042190ED9AD2390FAC9779252DCEC8A647EB19C33674EFED91F64039F7BF89921BCE899C930C3ED6B54304B1AE2CE68A6E9E4BB4B2B6248160908A50A06E42EC8863B56AB5B8B439EEFD1471FCDBFAA8F8DD349417F023389E7CCD24CD56B38712C4920CDF4B15425925645D1C96E283CA7E03DDC6ECC2347DC69999B4D0E1E3CD8918BC8F3CA96B0A1AE2332AB4CD54BBAC1FB21BF5F07116C6C949BEA3E8DA9C4B240E6C767E3D870DB8D36E80927784684D3CA36AB0D84CC66934AFC16CF29C4AC50DE917BCD366DDA886AD5AA397211D91AB65DBB7662FEFCF9B9AB3AEBE5A512EE4153BD3C108A4CAB611608A7BA639D1C904045766936CB73B2B14F585FC5730A7121942D7217E460024E22CF9F4F285B1421947214203945442FBD54C4141046E7CFE9B53E9656B34A571BFB14F79C9E164C1308312A94F572171A356AE4EC85EAD52B78DDE45044DA9388148A161E5543D839915186133A15226934ABB493198615D2929ED3FCC328219210B34259396FA17265672F74F6F9ABEAE5A48DD38DC654C82ED566934645D16E46A92ABB7436ABFCF2CB6F73174F1671329FC14886E7D4184F720BBC2D94E57217547509290ED955C466AA8061C5B538FA1408AADD117BCC889B13C269659BB5ACF2F1C727080B3F04CF29C4A45066E68AE5E1C3871D154B39807A3151A915C6602AB11A5917671A2A86B15325984E6497C2C2B166C4D15C0BD8E79E1B289A34F9DCEEEFC9736A8E69DC026F0AA59C74B95660E1C0014785529E3F1FFBF4525B049B94DF2D828D032E3071BAD1984AAC0AA5155154954D9A11C89284C98A486A16BFA733D965E3C657E5AE48C9F79CCA779495794E21DE84322D5728376EDCA87CB081B32E949656F0BAB253E58A50490E3D84B21F560FBD94C114E2152F34E6519951AA144E55FD2C4D096871CFA9EC2F590E7B857810CAB522D8A731309F64AF5EBD1CBB903C7F81EB167C1897864ABFD0C3D8552F1DF5F207CC02D1547FBC15C174724002A71AF69869C81356388B7B4E657F6CBA7441CC0AE522BDBC22AFBB62C50AB177EF5E47061D90D5AE7252E77CCC2F61F7EC7C11AC7C18E5483EB2DAE776BD9C8B89208EEACFADA2418F9B22292C6E33737CD8DFA1B8E754CE697B3E760CB124947BF5B246468672A2E5575F7D35309FA46AE47943C3D749D60963C3D7E546B01F864A62E821AC8B99C48350FA149CC349C134BBAC52249D1C06CF52A0C2730AAE12894EBB137317E478ACF9265B56823CDF4B2F9D3508CF1B164F951DCA80193F326E0453C5A0E842581F34BDA4ED6697C3099E53FD2D8DECA3740C589E538849A15C14CA2A85CC2ABB74E912E82AA202D925A47BF7EE81F3E6CB26DFE16706F3026947548D8866B8194584303EC9B3DDA9BA22995D32DD162094C5D1DBE7F3FD2217B66FDF2EEEBCF34EDB622945528A6EBE0C55F6D97C2814710228CC30CD1C5392609A15D07099A695063E764552F50C240008652EE99AA60DCC15B175EBD6899B6EBAC97235AC3C4E1EFFE1871FE65F2D5FF86FE727067BD9A18A7929C34DE62C84F9099EED88A11B55B00827C40E8911BCB6AC1295FDA4DE94DF436696F5EBD70F4CE6FCC8238F181A0B56B66E950D77E43BC97CD5AD92C7F532939F178C09657E54CE47196E1F4DE167D5CBAA5BC652E50A08A555A689600BB6497AA928C54E8A9E6CE423E7AB945365C95946A468CA517C64F5AA14473998C0E2C58B035D40323333F39F4F7E1824189A099409A7EA638D748B5031E1B30A61742ABB442401A1B492596E086596B24371203B942258A02F643864C31DF94E92EA56704918AD9EDBC9E1ED8CEEE77676E9C6FD06885DA194A4EBE5CF22386A4F1F111CEBD1E8779302395504AB5A69B80336C4CC8921ECBC28986E6797082420942A991F2AD542A279A35EE40CCFF285A57C9F29AB6965F3583976EBDAD0BEE9FC8CE09DEC52D5D8AF6604D1AE784662EE4B0084D22E72049F71A102E07171B4726E2786B7539551229200D120940011104AA7AA5EAD88A61302E985EC1200A10420BB5436F66B346494882420940088A363D7704A3023D96504910484120094679256C5D12981442401104A00C7334A27AB5FAD0AA493C2884802420980503A761D15FD29AD8AA25531442401A10400C744D7EE3BCB48BCAF349B690220940064948E649246C530D2024916090825409C0AA5EAD943EC88A6EAF7958824004209E0890CD34E15AC1747EC412401A1044018237A9D480C40A032BB04402801625C287D8ACEE355C15439DC1D020908250059A56BE7F4CA0004649100082580AB22E9A56C5245468940024209109724272709BF3F2BF0D77DD1757BFC571519A573E8BF0393AE836749E01640BC72E59597FDDF860D69213150518A13B870FB9A595F705D49FB14F5D9C8BE22CCFFA49EF5EBBFD9298213B2032094005EA166CD4B36AF5BB7C984E885133F23E729691F23EBC389A116E6B391E3DDAF6A9D3B77D5CFFA9F3558252094001EE28A2B2EFDD7D4A90B4476768E49310C87D163CD669966B347B39F23F72E72CE9C15D5F53F0BB04AF022A5B80510AF7CF2C9C6CDB56BD7E87BF2A4BF5CD3A6D73A78253B2D60DD1E30DD7D468E9C98B67AF597FBF4C5E7B04A20A304F0180D1AD4BDE7F9E7A76867DE559A15402F54BFAA7A5FE93E9B37EF3AF1C20BD3ABEA8B43B14620A304F0209B366DDDD3BB77C7932FBE38B5759326D7F8AA55BBC8C399A4AA0CD31BDD3DB66CD995D3ACD90347FCFEDF1FD43FAEC31A01A104F0285F7CB1657DD7AE6D32478E7CAD7552D239BE468DAE1609093EC557D16C6C776AC0F4C8F1F2CB338F76EDFAB8FFE449FFFDFAC7A5582178191FB70020C8E5975F7A6DE9D289EFFDDFFF65A63EF450A78466CD1A88A64DFF68A09FA51501726AF08170D96464D0B3469196F6BD58BBF6ABACD75E7BE7F8CF3F1FD9929D9DFDB0BE692B96070825409451A1429986975D5663F0B163C75B64641CA87AEA5436352F36494848385DBE7C999D7E7FD6BFB3B24ECDD5576DE0AE00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008012FE1F1AF4D544B5053A450000000049454E44AE426082, null);
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.15.1)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.15.1', '1');
INSERT INTO `act_re_deployment` VALUES ('566004a976614fad8136b9394bcd1615', 'SpringAutoDeployment', null, '', '2015-05-18 10:56:11');
INSERT INTO `act_re_model` VALUES ('5d84d3be5eb64cd9b7055a7953445b28', '5', '请假流程', 'qingjiamodel', '1', '2015-06-18 16:14:28', '2015-06-18 16:18:15', '1', '{\"name\":\"请假流程\",\"revision\":1,\"description\":\"请假流程\"}', null, 'd64a72fb53fc4fbca92cb325819e6261', 'e102464714de41648b2408f7d5d1f8bb', '');
INSERT INTO `act_re_procdef` VALUES ('test_audit:1:80ff2d8d18e7488fa8e8fdfe23edadf3', '1', 'http://www.activiti.org/test', '流程审批测试流程', 'test_audit', '1', '566004a976614fad8136b9394bcd1615', 'test_audit.bpmn20.xml', 'test_audit.png', null, '1', '1', '');
INSERT INTO `cms_article` VALUES ('1', '3', '公司历史文化', '', 'green', '/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/20120223391.jpg', '关键字1,关键字2', '', '0', null, '4', ',1,2,', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 17:21:23', null, '0');
INSERT INTO `cms_article` VALUES ('10', '4', '人鱼——平行世界的错位传奇', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('11', '5', '倾城魔女 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('12', '5', '长篇连载----黑虎山风云录', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('13', '5', '《城里的那点事儿》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('14', '7', '小说《生命的诡容》（沙三郎作品） ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('15', '7', '老婆下班回家说杀人了 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('16', '7', '期货的世界 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('17', '7', '《何处相思明月楼：古典诗词里的离愁别恨》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('18', '8', '武侠小说《星云传奇》连载求关注', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('19', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('2', '3', '北京我们的祖国首都', '', 'red', '/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/c2cec3fdfc039245363f3f4e8594a4c27c1e25ed.jpg', '新能源,背景', '我爱北京，我爱北京天安门，北京是五千年中国文化的汇聚地，凝聚了华夏祖宗多少梦想', '0', null, '12', ',1,2,', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 17:21:56', null, '0');
INSERT INTO `cms_article` VALUES ('20', '8', '晚来 无颜的爱 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('21', '8', '大学最后一年，和实习美女老师合租', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('22', '9', '龙凤胎', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('23', '9', '疯狂小子与美丽老师（第二部）', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('24', '9', '社会悬疑推理小说《房奴》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('25', '9', '养蜂女儿的蜂蜜私家鉴别共享', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('26', '9', '纸媒无故事', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('27', '11', '美国和中国老师讲灰姑娘的故事', null, null, null, '关键字1,关键字2', null, '0', null, '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('28', '11', '传奇老兵和他的女人们', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('29', '11', '黑色的起因-老流氓的人生之二 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('3', '3', '美丽的公司文化', '', '', '', '关键字1,关键字2', '', '0', null, '6', ',null,', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 09:08:41', null, '0');
INSERT INTO `cms_article` VALUES ('30', '11', '世情小说《小镇美女》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('31', '11', ' 追梦人生 第一部 乡村女孩的梦', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('32', '12', '《碎尸迷雾》 罪案小说', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('33', '12', ' 等你一起来成仙', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('34', '12', '《真爱能走多远》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('35', '12', ' 我的黑道自白书-《血煮江湖梦》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('36', '12', '驻守在新疆的那群爷们', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('37', '13', ' 情天孽海（长篇小说）', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('38', '13', '《我与白马王子之恋》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('39', '13', '女帝后宫传奇', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('4', '3', '《我的草原我的家》：无悔的青春', null, 'green', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('40', '13', '中小企业对SEO认知现状', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('41', '14', '《我的北美雇佣兵生涯》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('42', '14', '悬疑小说（失落的珍宝） ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('43', '14', '不要忽略小事 才可成就大事', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('44', '14', '我是一个兵，讲述我在央朝的故事', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('45', '14', '爱已至，情纷飞--婚外迷情 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('46', '15', '剑与龙之歌——真男人的成长历程', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('47', '15', '血染南国——高科技时代的黑帮', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('48', '15', '[懂懂日记]20150612：胖妞瘦了 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('49', '16', '《打错电话嫁对郎》 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('5', '3', '佛心相伴人自然', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('50', '17', '《谁为逝去的青春买单》', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('51', '17', '指缝里的流年', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('52', '26', '《透视男人女人：十里红杏今又红》', null, null, null, '关键字1,关键字2', null, '0', null, '2', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('53', '26', '六道养生_涧竹悟 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('6', '3', '一杯水如何让客户抢着买? 本书作者将把一切告诉你', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('7', '4', '穿越女变身和亲公主，嫁给心机男，斗智斗勇 ', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('8', '4', '带你走进一个令人匪夷所思的世界(转载) ', null, 'blue', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('9', '4', '闲云邂月传', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article_data` VALUES ('1', '<div class=\"mod-top\" id=\"card-container\">\r\n	<div class=\"card-summary nslog-area clearfix\" data-nslog-type=\"72\">\r\n		<div class=\"card-summary-content\">\r\n			<div class=\"para\">\r\n				公司是指一般依法<a href=\"http://baike.baidu.com/view/501201.htm\" target=\"_blank\">设立</a>的，有独立的法人财产，以<a href=\"http://baike.baidu.com/view/608545.htm\" target=\"_blank\">营利</a>为目的的<a href=\"http://baike.baidu.com/view/64488.htm\" target=\"_blank\">企业法人</a>。根据现行中国<a href=\"http://baike.baidu.com/view/33348.htm\" target=\"_blank\">公司法</a>（2005），其两种主要形式为<a href=\"http://baike.baidu.com/view/30762.htm\" target=\"_blank\">有限责任公司</a>和<a href=\"http://baike.baidu.com/view/30746.htm\" target=\"_blank\">股份有限公司</a>。两类公司均为<a href=\"http://baike.baidu.com/subview/10873/9354108.htm\" target=\"_blank\">法人</a>（<a href=\"http://baike.baidu.com/view/115704.htm\" target=\"_blank\">民法通则</a>36条），投资者可受到有限责任保护。根据<a href=\"http://baike.baidu.com/view/1760358.htm\" target=\"_blank\">方流芳</a>教授的考证，公司曾被称为&ldquo;<a href=\"http://baike.baidu.com/view/2213301.htm\" target=\"_blank\">公班衙</a>&rdquo;，是对<a href=\"http://baike.baidu.com/view/400076.htm\" target=\"_blank\">英国东印度公司</a>的专属称呼。在百多年的历史中，中文&ldquo;公司&rdquo;词义在不断地误读和重新诠释中逐渐明确为现在的含义。</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>', '来源', '', '1');
INSERT INTO `cms_article_data` VALUES ('10', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('11', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('12', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('13', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('14', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('15', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('16', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('17', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('18', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('19', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('2', '<p>\r\n	&nbsp;&nbsp; 北京市发展和改革委员会下发《关于大唐青灰岭风光发电示范项目49.7兆瓦工程核准的批复》文件，标志着北京首个风光发电示范项目落户大唐新能源公司。</p>\r\n<p>\r\n	　 　青灰岭风光发电示范项目位于北京市昌平区流村镇，是北京市开发的首个风光示范项目。该项目所在地风能资源较丰富，年平均风速为6.58米/秒，拟建设 49.5兆瓦风力发电机组和0.2兆瓦太阳能光伏发电站，配套建设110千伏升压站、风电场内集电线路等相关设施，实现风光能源互补。</p>\r\n<p>\r\n	在提倡低碳经济、绿色环保的背景下，北京市作为首都和全国的政治、经济和文化中心，发展清洁能源具有良好的示范和带动作用。大唐新能源公司能够核准北京首个示范项目也彰显了集团公司的形象和实力。</p>\r\n<p>\r\n	　 　据介绍，该项目由大唐新能源北京昌裕公司负责开发建设，建成后，预计年上网电量将达到1.1亿千瓦时以上，与火电相比，每年可节约标准煤3.33万吨， 节水31万吨，减少二氧化碳排放7.97万吨，减排灰渣1.2万吨，将极大改善北京电网能源结构，对于提高可再生能源与化石能源的互补性、带动地区经济发 展、改善当地环境都具有重要的推动作用。</p>\r\n<p>\r\n	<img alt=\"\" height=\"464\" src=\"/MyJeeSite/userfiles/1/images/cms/article/2015/06/20120223391.jpg\" width=\"407\" /></p>\r\n<p>\r\n	青灰岭风光发电示范项目位于北京市昌平区流村镇，是北京市开发的首个风光示范项目。该项目所在地风能资源较丰富，年平均风速为6.58米/秒，拟建设 49.5兆瓦风力发电机组和0.2兆瓦太阳能光伏发电站，配套建设110千伏升压站、风电场内集电线路等相关设施，实现风光能源互补。</p>\r\n<p>\r\n	在提倡低碳经济、绿色环保的背景下，北京市作为首都和全国的政治、经济和文化中心，发展清洁能源具有良好的示范和带动作用。大唐新能源公司能够核准北京首个示范项目也彰显了集团公司的形象和实力。</p>\r\n<p>\r\n	　 　据介绍，该项目由大唐新能源北京昌裕公司负责开发建设，建成后，预计年上网电量将达到1.1亿千瓦时以上，与火电相比，每年可节约标准煤3.33万吨， 节水31万吨，减少二氧化碳排放7.97万吨，减排灰渣1.2万吨，将极大改善北京电网能源结构，对于提高可再生能源与化石能源的互补性、带动地区经济发 展、改善当地环境都具有重要的推动作用。</p>\r\n<p>\r\n	&nbsp;</p>', '来源', '1,2,3,', '1');
INSERT INTO `cms_article_data` VALUES ('20', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('21', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('22', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('23', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('24', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('25', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('26', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('27', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('28', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('29', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('3', '<p>\r\n	<font color=\"blue\">中国已经五千年<a _stat=\"/stat/bbs/post/贴内版块\" href=\"http://bbs.tianya.cn/list-50337-1.shtml\" target=\"_blank\">历史</a>，我们每个人的家族源远流长，我们的新中国也已经成立66年，而天涯社区陪伴大家也已经16年，滔滔岁月，于国家，于家族，于每一个独立的生命个体一定都有着最为独特的生命印记。你来过，请留下故事。</font></p>', '来源', '1,2,3,', '1');
INSERT INTO `cms_article_data` VALUES ('30', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('31', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('32', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('33', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('34', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('35', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('36', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('37', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('38', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('39', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('4', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('40', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('41', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('42', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('43', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('44', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('45', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('46', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('47', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('48', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('49', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('5', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('50', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('51', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('52', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('53', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('6', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('7', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('8', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('9', '文章内容内容内容内容', '来源', '1,2,3', '1');
INSERT INTO `cms_category` VALUES ('1', '0', '0,', '0', '1', null, '顶级栏目', null, null, null, null, null, '0', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('10', '1', '0,1,', '1', '4', 'article', '公司产品', '', '', '', '', '', '20', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 17:16:19', null, '0');
INSERT INTO `cms_category` VALUES ('11', '10', '0,1,10,', '1', '4', 'article', '网络工具', null, null, null, null, null, '30', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('12', '10', '0,1,10,', '1', '4', 'article', '浏览工具', null, null, null, null, null, '40', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('13', '10', '0,1,10,', '1', '4', 'article', '浏览辅助', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('14', '7be5ba2e4b164b909e67f6289096fa24', '0,1,7be5ba2e4b164b909e67f6289096fa24,', '1', '4', 'article', '网络优化', '', '', '', '', '', '50', '1', '1', '0', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 17:18:31', null, '0');
INSERT INTO `cms_category` VALUES ('15', '10', '0,1,10,', '1', '4', 'article', '邮件处理', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('16', '10', '0,1,10,', '1', '4', 'article', '下载工具', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('17', '7be5ba2e4b164b909e67f6289096fa24', '0,1,7be5ba2e4b164b909e67f6289096fa24,', '1', '4', 'article', '搜索工具', '', '', '', '', '', '50', '1', '1', '2', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 17:18:56', null, '0');
INSERT INTO `cms_category` VALUES ('18', '1', '0,1,', '1', '5', 'link', '友情链接', null, null, null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('19', '18', '0,1,18,', '1', '5', 'link', '常用网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('2', '1', '0,1,', '1', '3', 'article', '公司介绍', '', '', '', '', '', '10', '1', '1', '0', '0', '1', '', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 17:15:47', null, '0');
INSERT INTO `cms_category` VALUES ('20', '18', '0,1,18,', '1', '5', 'link', '门户网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('21', '18', '0,1,18,', '1', '5', 'link', '购物网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('22', '18', '0,1,18,', '1', '5', 'link', '交友社区', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('23', '18', '0,1,18,', '1', '5', 'link', '音乐视频', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('24', '1', '0,1,', '1', '6', null, '百度一下', null, 'http://www.baidu.com', '_blank', null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('25', '1', '0,1,', '1', '6', null, '全文检索', null, '/search', null, null, null, '90', '0', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('26', '1', '0,1,', '2', '6', 'article', '测试栏目', null, null, null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('27', '1', '0,1,', '1', '6', null, '公共留言', null, '/guestbook', null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('3', '2', '0,1,2,', '1', '3', 'article', '网站简介', null, null, null, null, null, '30', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('4', '2', '0,1,2,', '1', '3', 'article', '内部机构', null, null, null, null, null, '40', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('5', '2', '0,1,2,', '1', '3', 'article', '地方机构', null, null, null, null, null, '50', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('6', '1', '0,1,', '1', '3', 'article', '典型案例', '', '', '', '', '', '20', '1', '1', '1', '1', '0', '', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 17:17:02', null, '0');
INSERT INTO `cms_category` VALUES ('7', '6', '0,1,6,', '1', '3', 'article', '产品质量', null, null, null, null, null, '30', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('7be5ba2e4b164b909e67f6289096fa24', '1', '0,1,', '1', '1', '', '客户服务', '', '', '', '', '', '30', '1', '1', '0', '1', '0', '', '', '', '1', '2015-06-12 17:18:04', '1', '2015-06-12 17:19:29', null, '0');
INSERT INTO `cms_category` VALUES ('8', '6', '0,1,6,', '1', '3', 'article', '技术质量', null, null, null, null, null, '40', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('9', '6', '0,1,6,', '1', '3', 'article', '工程质量', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_comment` VALUES ('f53edc2668654a159f78a07e8ef3fa2c', '26', '52', '&aelig;&ccedil;&laquo;&nbsp;&aelig;&nbsp;&eacute;&cent;&aelig;&nbsp;&eacute;&cent;&aelig;&nbsp;&eacute;&cent;&aelig;&nbsp;&eacute;&cent;', 'dsfdfdfdsfs', '匿名', '127.0.0.1', '2015-06-10 17:19:19', null, null, '2');
INSERT INTO `cms_link` VALUES ('1', '19', 'JeeSite', null, null, 'http://thinkgem.github.com/jeesite', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('10', '22', '58同城', null, null, 'http://www.58.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('11', '23', '视频大全', null, null, 'http://v.360.cn/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('12', '23', '凤凰网', null, null, 'http://www.ifeng.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('2', '19', 'ThinkGem', null, null, 'http://thinkgem.iteye.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('3', '19', '百度一下', null, null, 'http://www.baidu.com', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('4', '19', '谷歌搜索', null, null, 'http://www.google.com', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('5', '20', '新浪网', null, null, 'http://www.sina.com.cn', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('6', '20', '腾讯网', null, null, 'http://www.qq.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('7', '21', '淘宝网', null, null, 'http://www.taobao.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('8', '21', '新华网', null, null, 'http://www.xinhuanet.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('9', '22', '赶集网', null, null, 'http://www.ganji.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_site` VALUES ('1', '华英总公司', 'Hua Ying Soft', '/MyJeeSite/userfiles/1/images/cms/site/2015/06/biaoti.jpg', null, '中国华英科技有限公司，坐落于美丽的浏阳河畔，成立于公元1990年，目前公司员工100多人，从事软件开发与互联网业务。', '华英科技', 'basic', '<p>\r\n	Copyright &copy; 2012-2013</p>', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 16:42:06', null, '0');
INSERT INTO `cms_site` VALUES ('2', '华英长沙分公司', 'Hua Ying Soft Changsha', '/MyJeeSite/userfiles/1/images/cms/site/2015/06/20120223391.jpg', null, '华英旗下的子公司，目前处于建设之前', '华英,公司', 'basic', '<p>\r\n	Copyright &copy; 2012-2013 V1.0</p>', '', '1', '2013-05-27 08:00:00', '1', '2015-06-12 09:44:40', null, '0');
INSERT INTO `gen_scheme` VALUES ('35a13dc260284a728a270db3f382664b', '树结构', 'treeTable', 'com.thinkgem.jeesite.modules', 'test', null, '树结构生成', '树结构', 'ThinkGem', 'f6e4dafaa72f4c509636484715f33a96', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_scheme` VALUES ('9c9de9db6da743bb899036c6546061ac', '单表', 'curd', 'com.thinkgem.jeesite.modules', 'test', null, '单表生成', '单表', 'ThinkGem', 'aef6f1fc948f4c9ab1c1b780bc471cc2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_scheme` VALUES ('e6d905fd236b46d1af581dd32bdfb3b0', '主子表', 'curd_many', 'com.thinkgem.jeesite.modules', 'test', null, '主子表生成', '主子表', 'ThinkGem', '43d6d5acffa14c258340ce6765e46c6f', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('43d6d5acffa14c258340ce6765e46c6f', 'test_data_main', '业务数据表', 'TestDataMain', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('6e05c389f3c6415ea34e55e9dfb28934', 'test_data_child', '业务数据子表', 'TestDataChild', 'test_data_main', 'test_data_main_id', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('aef6f1fc948f4c9ab1c1b780bc471cc2', 'test_data', '业务数据表', 'TestData', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table` VALUES ('f6e4dafaa72f4c509636484715f33a96', 'test_tree', '树结构表', 'TestTree', null, null, '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('0902a0cb3e8f434280c20e9d771d0658', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '1', '1', '=', 'radiobox', 'sex', null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('103fc05c88ff40639875c2111881996a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('12fa38dd986e41908f7fefa5839d1220', '6e05c389f3c6415ea34e55e9dfb28934', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('195ee9241f954d008fe01625f4adbfef', 'f6e4dafaa72f4c509636484715f33a96', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('19c6478b8ff54c60910c2e4fc3d27503', '43d6d5acffa14c258340ce6765e46c6f', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1ac6562f753d4e599693840651ab2bf7', '43d6d5acffa14c258340ce6765e46c6f', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1b8eb55f65284fa6b0a5879b6d8ad3ec', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'in_date', '加入日期', 'date(7)', 'java.util.Date', 'inDate', '0', '1', '1', '1', '0', '1', 'between', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('1d5ca4d114be41e99f8dc42a682ba609', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('21756504ffdc487eb167a823f89c0c06', '43d6d5acffa14c258340ce6765e46c6f', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('24bbdc0a555e4412a106ab1c5f03008e', 'f6e4dafaa72f4c509636484715f33a96', 'parent_ids', '所有父级编号', 'varchar2(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('33152ce420904594b3eac796a27f0560', '6e05c389f3c6415ea34e55e9dfb28934', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('35af241859624a01917ab64c3f4f0813', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '13', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('398b4a03f06940bfb979ca574e1911e3', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('3a7cf23ae48a4c849ceb03feffc7a524', '43d6d5acffa14c258340ce6765e46c6f', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '0', '0', '=', 'areaselect', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('3d9c32865bb44e85af73381df0ffbf3d', '43d6d5acffa14c258340ce6765e46c6f', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('416c76d2019b4f76a96d8dc3a8faf84c', 'f6e4dafaa72f4c509636484715f33a96', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('46e6d8283270493687085d29efdecb05', 'f6e4dafaa72f4c509636484715f33a96', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('4a0a1fff86ca46519477d66b82e01991', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('4c8ef12cb6924b9ba44048ba9913150b', '43d6d5acffa14c258340ce6765e46c6f', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('53d65a3d306d4fac9e561db9d3c66912', '6e05c389f3c6415ea34e55e9dfb28934', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '9', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('56fa71c0bd7e4132931874e548dc9ba5', '6e05c389f3c6415ea34e55e9dfb28934', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('5a4a1933c9c844fdba99de043dc8205e', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('5e5c69bd3eaa4dcc9743f361f3771c08', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('633f5a49ec974c099158e7b3e6bfa930', 'f6e4dafaa72f4c509636484715f33a96', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('652491500f2641ffa7caf95a93e64d34', '6e05c389f3c6415ea34e55e9dfb28934', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('6763ff6dc7cd4c668e76cf9b697d3ff6', 'f6e4dafaa72f4c509636484715f33a96', 'sort', '排序', 'number(10)', 'Integer', 'sort', '0', '0', '1', '1', '1', '0', '=', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('67d0331f809a48ee825602659f0778e8', '43d6d5acffa14c258340ce6765e46c6f', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('68345713bef3445c906f70e68f55de38', '6e05c389f3c6415ea34e55e9dfb28934', 'test_data_main_id', '业务主表', 'varchar2(64)', 'String', 'testDataMain.id', '0', '1', '1', '1', '0', '0', '=', 'input', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('71ea4bc10d274911b405f3165fc1bb1a', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'area_id', '归属区域', 'nvarchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Area', 'area.id|name', '0', '1', '1', '1', '1', '1', '=', 'areaselect', null, null, '4', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('7f871058d94c4d9a89084be7c9ce806d', '6e05c389f3c6415ea34e55e9dfb28934', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b48774cfe184913b8b5eb17639cf12d', '43d6d5acffa14c258340ce6765e46c6f', 'create_by', '创建者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b7cf0525519474ebe1de9e587eb7067', '6e05c389f3c6415ea34e55e9dfb28934', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '5', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8b9de88df53e485d8ef461c4b1824bc1', '43d6d5acffa14c258340ce6765e46c6f', 'user_id', '归属用户', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'user.id|name', '0', '1', '1', '1', '1', '1', '=', 'userselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('8da38dbe5fe54e9bb1f9682c27fbf403', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '12', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('92481c16a0b94b0e8bba16c3c54eb1e4', 'f6e4dafaa72f4c509636484715f33a96', 'create_date', '创建时间', 'timestamp(6)', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', null, null, '7', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('9a012c1d2f934dbf996679adb7cc827a', 'f6e4dafaa72f4c509636484715f33a96', 'parent_id', '父级编号', 'varchar2(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', null, null, '2', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('ad3bf0d4b44b4528a5211a66af88f322', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '1', '1', '=', 'officeselect', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('bb1256a8d1b741f6936d8fed06f45eed', 'f6e4dafaa72f4c509636484715f33a96', 'update_by', '更新者', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', null, null, '8', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('ca68a2d403f0449cbaa1d54198c6f350', '43d6d5acffa14c258340ce6765e46c6f', 'office_id', '归属部门', 'varchar2(64)', 'com.thinkgem.jeesite.modules.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('cb9c0ec3da26432d9cbac05ede0fd1d0', '43d6d5acffa14c258340ce6765e46c6f', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '12', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('cfcfa06ea61749c9b4c4dbc507e0e580', 'f6e4dafaa72f4c509636484715f33a96', 'id', '编号', 'varchar2(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', null, null, '1', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('d5c2d932ae904aa8a9f9ef34cd36fb0b', '43d6d5acffa14c258340ce6765e46c6f', 'sex', '性别', 'char(1)', 'String', 'sex', '0', '1', '1', '1', '0', '1', '=', 'select', 'sex', null, '6', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('e64050a2ebf041faa16f12dda5dcf784', '6e05c389f3c6415ea34e55e9dfb28934', 'name', '名称', 'nvarchar2(100)', 'String', 'name', '0', '1', '1', '1', '1', '1', 'like', 'input', null, null, '3', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('e8d11127952d4aa288bb3901fc83127f', '43d6d5acffa14c258340ce6765e46c6f', 'del_flag', '删除标记（0：正常；1：删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '13', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('eb2e5afd13f147a990d30e68e7f64e12', 'aef6f1fc948f4c9ab1c1b780bc471cc2', 'update_date', '更新时间', 'timestamp(6)', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', null, null, '11', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `gen_table_column` VALUES ('f5ed8c82bad0413fbfcccefa95931358', 'f6e4dafaa72f4c509636484715f33a96', 'remarks', '备注信息', 'nvarchar2(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', null, null, '10', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', null, '0');
INSERT INTO `oa_notify` VALUES ('306360cf9f6c453c9dd769753fb0be88', '3', '公司全体去岳麓山玩', '去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩去岳麓山玩', '|/jeesite/userfiles/1/files/oa/notify/2015/05/005JFMZKjw1ek8yfzcfzej30qs0zq7aw.jpg', '1', '1', '2015-05-18 11:10:42', '1', '2015-05-18 11:10:42', null, '1');
INSERT INTO `oa_notify` VALUES ('ee1c184df0874bc9b1eb6fa77389a080', '1', '年终大会', '就看见空间库监控监控就监控监控就进口机科教科监控监控进口机看进口机科教科进口机看看进口机科教科监控监控进口机看空间空间', '', '1', '1', '2015-06-11 09:25:44', '1', '2015-06-11 09:25:44', null, '0');
INSERT INTO `oa_notify_record` VALUES ('119b86a60d1e4081a141faff31963412', '306360cf9f6c453c9dd769753fb0be88', '8', '0', null);
INSERT INTO `oa_notify_record` VALUES ('197791d5a92846ca8a29d6917c961406', 'ee1c184df0874bc9b1eb6fa77389a080', '2', '0', null);
INSERT INTO `oa_notify_record` VALUES ('1caac1202d924856838661366496ac07', '306360cf9f6c453c9dd769753fb0be88', '3', '0', null);
INSERT INTO `oa_notify_record` VALUES ('45b69e54b6d14d95a91a3ec20041ae72', '306360cf9f6c453c9dd769753fb0be88', '6', '0', null);
INSERT INTO `oa_notify_record` VALUES ('48bb0e90f4cc43e0b0a30c0e2578258f', '306360cf9f6c453c9dd769753fb0be88', '12', '0', null);
INSERT INTO `oa_notify_record` VALUES ('4b6ae8b7532d477fb9aab444df0eacd0', '306360cf9f6c453c9dd769753fb0be88', '9', '0', null);
INSERT INTO `oa_notify_record` VALUES ('77e7909cb4b841849faf7bee854f015e', '306360cf9f6c453c9dd769753fb0be88', '11', '0', null);
INSERT INTO `oa_notify_record` VALUES ('87fef472e5e74e0294abc0d89dddcfe8', '306360cf9f6c453c9dd769753fb0be88', '2', '0', null);
INSERT INTO `oa_notify_record` VALUES ('9f29f82abf71400aae6f58227641a58b', '306360cf9f6c453c9dd769753fb0be88', '13', '0', null);
INSERT INTO `oa_notify_record` VALUES ('aeaaf34c59c74d8aa34e86a0a64ceed7', '306360cf9f6c453c9dd769753fb0be88', '1', '0', null);
INSERT INTO `oa_notify_record` VALUES ('af02764dbed244b8a29267f828ae5b70', '306360cf9f6c453c9dd769753fb0be88', '4', '0', null);
INSERT INTO `oa_notify_record` VALUES ('b7f03c4cf9b14baa80707a56d7056771', '306360cf9f6c453c9dd769753fb0be88', '10', '0', null);
INSERT INTO `oa_notify_record` VALUES ('d5f288905a6c46c8a679d5372373aa22', 'ee1c184df0874bc9b1eb6fa77389a080', '1', '1', '2015-06-11');
INSERT INTO `oa_notify_record` VALUES ('e845a044b380473b9a13282c6419a88f', '306360cf9f6c453c9dd769753fb0be88', '5', '0', null);
INSERT INTO `oa_notify_record` VALUES ('f9c4961d46fa4989bdd9c4460917aeb0', '306360cf9f6c453c9dd769753fb0be88', '7', '0', null);
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '湖南省', '20', '110000', '2', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:05:01', '湖南省毛泽东的故乡', '0');
INSERT INTO `sys_area` VALUES ('2b241fd8b7b74bc391f20f27054cfc85', '2', '0,1,2,', '浏阳市', '30', '130098', '1', '1', '2015-06-10 15:11:32', '1', '2015-06-10 15:11:32', '', '1');
INSERT INTO `sys_area` VALUES ('3', '2', '0,1,2,', '长沙市', '30', '110101', '3', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:05:37', '', '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '开福区', '40', '110102', '4', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:06:07', '', '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '天心区', '50', '110104', '4', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:06:18', '', '0');
INSERT INTO `sys_area` VALUES ('5505897c7e74484181ca99b8c0d6786f', 'ff8fb2c20e1140bd92e87ba801fa1152', '0,1,ff8fb2c20e1140bd92e87ba801fa1152,', '淮安市', '30', '12000301', '1', '1', '2015-06-10 15:08:42', '1', '2015-06-10 15:08:42', '', '1');
INSERT INTO `sys_area` VALUES ('6', '3', '0,1,2,3,', '岳麓区', '60', '110105', '4', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:06:29', '', '0');
INSERT INTO `sys_area` VALUES ('6487494a49424fc7b049d77ee644303a', '2', '0,1,2,', '岳阳市', '30', '110002', '1', '1', '2015-06-10 15:10:42', '1', '2015-06-10 15:10:42', '', '1');
INSERT INTO `sys_area` VALUES ('8690a33107684caa9aab0e25f3570794', 'ff8fb2c20e1140bd92e87ba801fa1152', '0,1,ff8fb2c20e1140bd92e87ba801fa1152,', '泰州市', '30', '12000302', '1', '1', '2015-06-10 15:09:25', '1', '2015-06-10 15:09:25', '', '1');
INSERT INTO `sys_area` VALUES ('a626ae20fcd342c0911b935e26825fd7', 'ff8fb2c20e1140bd92e87ba801fa1152', '0,1,ff8fb2c20e1140bd92e87ba801fa1152,', '苏州市', '30', '12000303', '1', '1', '2015-06-10 15:10:07', '1', '2015-06-10 15:10:07', '', '1');
INSERT INTO `sys_area` VALUES ('f56c4d4287b345b0b312dfc5ab00ae80', '3', '0,1,2,3,', '测试区域', '30', '1111', '1', '1', '2015-06-11 10:06:08', '1', '2015-06-11 10:06:08', '说的冯绍峰', '0');
INSERT INTO `sys_area` VALUES ('ff8fb2c20e1140bd92e87ba801fa1152', '1', '0,1,', '江苏省', '30', '120003', '1', '1', '2015-06-10 15:08:20', '1', '2015-06-10 15:08:20', '', '1');
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_log` VALUES ('00504a7a93e74844aab8c5d4a8675836', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-20 22:16:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('0114e8de4a6848ee8949a09b3ba95384', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:15:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', 'office.name=æµåå¸åå¬å¸&office.id=7', '');
INSERT INTO `sys_log` VALUES ('0144f8be33124bfaa1af5be27bcf0140', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-10 17:11:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=thinkgem&loginName=adm', '');
INSERT INTO `sys_log` VALUES ('0194e90c16ca45db8df96a91b7a4de23', '1', '内容管理-内容管理-内容发布', '1', '2015-05-18 11:22:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_35', '');
INSERT INTO `sys_log` VALUES ('028aef8f58074e27bc7ef147aa3c0812', '1', '内容管理-内容管理', '2', '2015-06-10 17:53:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('02966b3491fa4bb19e74249273d6f73a', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:08:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=10', '');
INSERT INTO `sys_log` VALUES ('03a892d03bca45b3af5a5078fddce934', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:13:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('03a946ad82c445aa9f8f081ad50301dd', '1', '我的面板-个人信息-修改密码', '1', '2015-06-10 14:20:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/modifyPwd', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('03cd7079243f4e9a8f3abf10ab67b759', '1', '系统设置-系统设置-字典管理', '1', '2015-06-11 10:00:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_13', '');
INSERT INTO `sys_log` VALUES ('046cd4a6637548679235c20391322e13', '1', '系统登录', '1', '2015-06-12 16:23:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('04e139e98c6b429792781370cacb6f00', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 16:21:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('0551bd7c77b246ac82a5af8e9c4a4fac', '1', '我的面板-个人信息-修改密码', '1', '2015-05-18 11:08:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('059bac03e34f497eadbce973c61dd2c8', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-18 15:00:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/usertorole', 'POST', 'id=5&___t0.4403102346216914=', '');
INSERT INTO `sys_log` VALUES ('05c8b15836164f689a5b37f6671faa5b', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-12 17:19:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('05c8bd2a14474e9a9283bf2c71d8b9fb', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-10 17:13:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=10', '');
INSERT INTO `sys_log` VALUES ('05eff4e412a140fb912867fe9f10f43e', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:09:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('05fcb395388a41edbb909ecf1e9b2a29', '1', '内容管理-内容管理-内容发布-链接模型-查看', '1', '2015-06-12 09:20:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/link/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('06089d48f17043b88e86d41706290fe1', '1', '系统设置-系统设置-菜单管理-修改', '1', '2015-06-10 16:24:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/save', 'POST', 'id=29&icon=user&sort=30&parent.id=28&name=个人信息&target=&permission=&remarks=&href=/sys/user/info&parent.name=个人信息&isShow=1', '');
INSERT INTO `sys_log` VALUES ('060adf49b410438c8466e77f16bd4faf', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 15:11:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('067af1a949ef4299b2e096340213b589', '1', '内容管理-内容管理', '1', '2015-05-18 11:22:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('087abc9f7a5d47ae9fcf50e70d35088f', '1', '系统设置-机构用户-用户管理', '1', '2015-05-20 17:38:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('09274e5a111c413887d4b3b1be4df26e', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 17:00:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('09698a62a4484ec881afe83b033d7974', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-18 14:56:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('09813225a3a44259810de9e36a0b43b8', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:14:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('09b3ab9bf83142cf96d3ab7db0492ab9', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 15:15:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('09bf69e9138b4f1e92c9bf4997704c9d', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 11:24:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0a5b339d099744739d641b81cc5e8d2c', '1', '系统登录', '1', '2015-06-12 09:09:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('0ad15813f60e446890e99a643848461d', '1', '代码生成-代码生成-生成方案配置', '1', '2015-06-18 15:04:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genScheme', 'GET', 'tabPageId=jerichotabiframe_49', '');
INSERT INTO `sys_log` VALUES ('0b50b45cca4f4b1faab835c93ae6f13b', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 16:22:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('0b807816a71544afab684429268feabe', '1', '我的面板-个人信息-个人信息', '2', '2015-06-10 17:52:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('0bb890c173d045a0846c697c0da39356', '1', '在线办公-个人办公-我的任务', '1', '2015-05-20 16:52:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/act/task/todo/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0c3d75e691974aa9a4b0768bbb14fbde', '1', '系统设置-机构用户-机构管理-修改', '1', '2015-06-10 15:19:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/save', 'POST', 'primaryPerson.id=&phone=&fax=&area.id=4&office.primaryPerson.name=&remarks=&code=201000&type=1&master=&id=12&area.name=开福区&useable=1&office.deputyPerson.name=&address=&email=&parent.id=7&name=开福区分公司&zipCode=&grade=3&parent.name=长沙市分公司&deputyPerson.id=', '');
INSERT INTO `sys_log` VALUES ('0c5be597fe85488faa6c12cf8463ff23', '1', '内容管理-栏目设置-站点设置-修改', '1', '2015-06-12 09:47:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/save', 'POST', 'logo=/MyJeeSite/userfiles/1/images/cms/site/2015/06/TB1mVdMHpXXXXXyXpXXXXXXXXXX_0-item_pic_003.jpg&keywords=华英科技&theme=basic&copyright=\r\n	Copyright © 2012-2013\r\n&id=1&title=Hua Ying Soft&description=   中国华英科技有限公司，坐落于美丽的浏阳河畔，成立于公元1990年，目前公司员工100多人，从事软件开...&customIndexView=&name=华英总公司', '');
INSERT INTO `sys_log` VALUES ('0c678cc1ac894323b3119851b98d1421', '1', '内容管理-栏目设置-站点设置', '1', '2015-05-20 22:15:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('0c846ec90f11471ea15990d2bca7cbf5', '1', '在线办公-流程管理-流程管理', '1', '2015-05-21 11:08:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('0d0e1d3b5a4c448dba83ff4b434de34a', '1', '在线办公-个人办公-我的任务', '1', '2015-05-21 11:08:00', '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET4.0E; .NET4.0C; Shuame)', '/MyJeeSite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('0d357eebf5cf473b8ef08d43660185bc', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-18 14:57:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', 'tabPageId=jerichotabiframe_20', '');
INSERT INTO `sys_log` VALUES ('0d6b73fc02ae4a1ea73f85ac1be3ce63', '1', '系统登录', '1', '2015-06-12 16:42:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/save', 'POST', 'id=1&logo=/MyJeeSite/userfiles/1/images/cms/site/2015/06/biaoti.jpg&title=Hua Ying Soft&keywords=华英科技&description=中国华英科技有限公司，坐落于美丽的浏阳河畔，成立于公元1990年，目前公司员工100多人，从事软件开发与...&customIndexView=&name=华英总公司&theme=basic&copyright=\r\n	Copyright © 2012-2013\r\n', '');
INSERT INTO `sys_log` VALUES ('0de0e99f16be40e3a86d03aef130c89b', '1', '内容管理-栏目设置-站点设置', '1', '2015-05-20 22:15:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('0f9a3a89ebd740718de5b6032d53877d', '1', '系统设置-机构用户-区域管理', '1', '2015-05-18 11:16:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_28', '');
INSERT INTO `sys_log` VALUES ('10dcf83bfef14e508eda3f1858acace8', '1', '系统设置-机构用户-用户管理', '1', '2015-06-18 14:58:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_27', '');
INSERT INTO `sys_log` VALUES ('11362cc4ebcc41848e35c33b94a14173', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 09:07:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('11442e07d27743e79a422b6dddf5370d', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:20:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('11ce0f86e8614aaabe7a346d1a738ad8', '1', '在线办公-个人办公-审批测试', '1', '2015-05-21 11:08:03', '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET4.0E; .NET4.0C; Shuame)', '/MyJeeSite/a/oa/testAudit', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('11f74ef4dfc64d21a0edc3210c187e98', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-11 10:05:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('125601fb6830403b94cd0de1ee99110d', '1', '内容管理-内容管理-公共留言-查看', '1', '2015-05-20 22:14:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/guestbook/', 'GET', 'tabPageId=jerichotabiframe_9&status=2', '');
INSERT INTO `sys_log` VALUES ('1279b5f8197442089e3e69e32998889d', '1', '系统登录', '1', '2015-06-12 09:41:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('12cdd8085b8146649920ee845df9c25e', '1', '系统设置-日志查询-日志查询', '1', '2015-05-18 17:26:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/log', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('12eed05920d7476d8ff6e8affd894ca7', '1', '系统登录', '1', '2015-06-11 09:23:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('12f0916967374792ac253112960b897e', '1', '内容管理-统计分析-信息量统计', '1', '2015-05-20 22:14:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('12f5fb21762c42918842b9467563b7d4', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-05-18 17:24:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/article/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('134c57fbab0940a0ae9c58f12b0b19af', '1', '内容管理-内容管理-内容发布', '1', '2015-06-12 08:59:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('13c3ef8566dc4774b1d0898d157c69cf', '1', '我的面板-个人信息-个人信息', '2', '2015-06-10 17:52:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('1551cd150cca4135bc211c63964a3550', '1', '系统登录', '1', '2015-06-10 15:06:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('15dcf6ae8e2542d284ee005477819045', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:17:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=&parentIds=0,', '');
INSERT INTO `sys_log` VALUES ('165f79bbe7d4499aac00dcf2c136ee54', '1', '系统登录', '1', '2015-06-12 16:57:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/tree', 'GET', 'parentId=62', '');
INSERT INTO `sys_log` VALUES ('1785e029a3e94aac8f777863d76494bb', '1', '系统设置-机构用户-区域管理', '1', '2015-06-11 10:04:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('17996e04a98e4318b16578a030ca06a0', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:07:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('17db746191074e6cb2a1b522612c280c', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:05:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=3&parent.id=2&name=长沙市&remarks=&code=110101&type=3&parent.name=湖南省', '');
INSERT INTO `sys_log` VALUES ('17fe41acd611401a838389ed986761b0', '1', '内容管理-内容管理', '1', '2015-06-18 14:57:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('181f993496e34688919f65985c775044', '1', '系统登录', '1', '2015-06-18 16:08:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('182ce8d96a064bda9f524b2a4835bb7f', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:08:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=&parent.id=ff8fb2c20e1140bd92e87ba801fa1152&name=淮安市&remarks=&code=12000301&type=1&parent.name=江苏省', '');
INSERT INTO `sys_log` VALUES ('185321e9640b4577addac58a45a6cac8', '1', '内容管理-内容管理', '2', '2015-06-11 09:28:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('187884cc9234410f9ef4676d3d2eeedb', '1', '内容管理-内容管理', '1', '2015-06-12 09:41:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none/', 'GET', 'category.id=25', '');
INSERT INTO `sys_log` VALUES ('19452fee674d46babc18d5f2030d2b16', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-10 17:12:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('195761844060422db71ab07e3f38f2ef', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:03:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('19917f8b30bd41c896656592088b85bb', '1', '内容管理-内容管理', '1', '2015-06-12 17:22:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('19aee575831a4eeb9fea34eff70a63e4', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 17:22:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('19e5dd63e01e4524982615b9e23c1dbd', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 17:56:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('1a17f42f1f924a1fb1599a3ff94154b5', '1', '系统设置-系统设置-字典管理', '1', '2015-06-18 15:02:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_40', '');
INSERT INTO `sys_log` VALUES ('1a8fd5c0bb3542a096376fbcfdac4234', '1', '在线办公-通知通告-我的通告', '1', '2015-05-20 22:14:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('1ac063e70d4e495b9676893319f71552', '1', '代码生成-代码生成-生成方案配置', '1', '2015-05-18 11:06:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/gen/genScheme', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('1b656eca481c4869969b0e174ac69678', '1', '系统设置-日志查询-日志查询', '1', '2015-05-18 11:17:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/log', 'GET', 'tabPageId=jerichotabiframe_33', '');
INSERT INTO `sys_log` VALUES ('1be455b5f864466b92d8ef1f691ca774', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 15:50:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('1be4749552b441579197d5f8cb975cd6', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:05:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1c007cbafe984d2f82593fcc8ad1c3cc', '1', '内容管理-栏目设置-站点设置-查看', '1', '2015-06-12 09:44:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('1c75a151dea74c1c8d56c0d218f1b5d7', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 16:23:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_15', '');
INSERT INTO `sys_log` VALUES ('1ca5e4d68bbb4050ac6b8597c53560a7', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 16:50:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('1ccdd1bf06a04e128d5340e30ff052c8', '1', '在线办公-个人办公-审批测试', '1', '2015-05-18 11:11:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/testAudit', 'GET', 'tabPageId=jerichotabiframe_20', '');
INSERT INTO `sys_log` VALUES ('1d3dcd99399f476492e06dfba8c1552f', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:05:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'id=4', '');
INSERT INTO `sys_log` VALUES ('1d49a553ab384bf3bf42c21a76ad6a8a', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:05:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('1d9f7a50e0414237bf15f4e248b39e0d', '1', '内容管理-内容管理', '1', '2015-06-11 09:23:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1da9bd1e618f481db8f272f3f2e16743', '1', '系统登录', '2', '2015-06-10 17:57:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1db4777726b844e8ae1e1d4e19e23e11', '1', '代码生成-生成示例-树结构', '1', '2015-05-20 17:11:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/test/testTree', 'GET', 'tabPageId=jerichotabiframe_18', '');
INSERT INTO `sys_log` VALUES ('1de29568fcef46299ace76aa051716bb', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:15:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('1f0d69687fab450390e8bd213d37fd79', '1', '系统设置-机构用户-机构管理', '1', '2015-06-11 10:05:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('1f266dad87094233b989b95abae5c318', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 15:51:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1f39a8e38f4041adb9c5d84bbfadd590', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 16:22:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('1f893a0a4a9640e9a5a211e273f822c5', '1', '系统设置-系统设置-菜单管理-修改', '1', '2015-06-10 16:23:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/save', 'POST', 'id=29&icon=user&sort=30&parent.id=28&name=个人信息11&target=&permission=&remarks=&href=/sys/user/info&parent.name=个人信息&isShow=1', '');
INSERT INTO `sys_log` VALUES ('1fa3f6cb9c81493fbf3b860fc3109b5e', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:20:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/delete', 'GET', 'id=5505897c7e74484181ca99b8c0d6786f', '');
INSERT INTO `sys_log` VALUES ('202aa71ffd2f490280666cbeaf545f07', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 17:57:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('204d525872684168954131085e0d50cf', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:22:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=6', '');
INSERT INTO `sys_log` VALUES ('205232b683ef4dd383cf8d56eb89a9e7', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:33:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('20564c3a82584ed58643c3cbc4b3329d', '1', '我的面板-个人信息-修改密码', '1', '2015-06-10 14:32:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/modifyPwd', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('20ca980ea6214353806d5df62b828ae4', '1', '内容管理-内容管理', '1', '2015-05-18 11:24:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('21216d710aa3452aac8bd6a94e15090b', '1', '内容管理-栏目设置-站点设置-修改', '1', '2015-05-20 22:15:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/save', 'POST', 'id=1&logo=&title=JeeSite Web&keywords=JeeSite&description=JeeSite&customIndexView=&name=默认站点&theme=basic&copyright=\r\n	Copyright © 2012-2013 - Powered By V1.0\r\n', '');
INSERT INTO `sys_log` VALUES ('2145885fe6c441098fc3de82c1456dd3', '1', '代码生成-代码生成-业务表配置', '1', '2015-06-12 17:01:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_18', '');
INSERT INTO `sys_log` VALUES ('216cd15344944819903daa9a6bfd8abf', '1', '内容管理-内容管理', '1', '2015-05-20 22:14:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2188c9c81fd740cda742ed60fcdd8cdd', '1', '内容管理-内容管理-评论管理-查看', '1', '2015-06-12 09:09:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/comment/', 'GET', 'status=2&tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('22687dc20a924af496907a1bb79e6992', '1', '在线办公-通知通告-通告管理', '1', '2015-05-18 11:24:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('22a2c8ae0b414155ac8450f9b1b22d78', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 17:04:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=新能源,背景&weight=0&customContentView=&category.id=3&category.name=网站简介&articleData.copyfrom=来源&link=&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/c2cec3fdfc039245363f3f4e8594a4c27c1e25e...&articleData.allowComment=1&id=2&articleData.relation=1,2,3,&title=北京我们的祖国首都&color=red&articleData.content=\r\n	北京市发展和改革委员会下发《关于大唐青灰岭风光发电示范项目49.7兆瓦工程核准的批复》文件，标志着...&description=我爱北京，我爱北京天安门，北京是五千年中国文化的汇聚地，凝聚了华夏祖宗多少梦想&weightDate=&posidList=1&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('22a721b2dd4447bbbc576774995427b8', '1', '系统设置-机构用户-用户管理', '1', '2015-06-11 10:02:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('22de7ddb7fda439ca921c9ff61bfab43', '1', '系统设置-系统设置-字典管理', '1', '2015-05-18 11:17:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_32', '');
INSERT INTO `sys_log` VALUES ('22e2c6e654ac473a912635b172735a2c', '1', '系统设置-机构用户-机构管理', '1', '2015-06-10 15:47:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_22', '');
INSERT INTO `sys_log` VALUES ('22ebcc9e0b0a4d888be8332387fb90df', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 17:22:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('230dc035fb3b4349aa857ed122614273', '1', '我的面板-个人信息-个人信息', '1', '2015-06-11 09:51:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('238af429f87e477ea6521cdf3bb47c35', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 15:50:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('23daf8d6815d4944ad4f1c85f059863e', '1', '内容管理-内容管理', '1', '2015-05-18 17:22:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('23e6d7d2acf74366909ee10f70a7fa15', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 17:19:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('240b57626f3049b7bf0d22373f7a65bb', '1', '系统设置-机构用户-机构管理-修改', '1', '2015-06-10 15:18:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/save', 'POST', 'primaryPerson.id=&phone=&fax=&area.id=3&office.primaryPerson.name=&remarks=&code=200000&type=1&master=&id=7&area.name=长沙市&useable=1&office.deputyPerson.name=&address=&email=&name=长沙市分公司&parent.id=1&zipCode=&grade=2&parent.name=湖南省总公司&deputyPerson.id=', '');
INSERT INTO `sys_log` VALUES ('24d6272739ce4ac293442a6e9993c4b5', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:15:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', 'office.name=åååºåå¬å¸&office.id=12', '');
INSERT INTO `sys_log` VALUES ('255ca6af17734fcaad88bb3f4a875393', '1', '系统设置-系统设置-角色管理', '2', '2015-06-10 17:53:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('2563ee7ff5a24589a11dfb000b5cf932', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-12 17:17:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2583f6fddcf34420bfc4323e2a1b4bc9', '1', '系统设置-系统设置-字典管理', '1', '2015-06-10 15:21:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('25a34a7a9542489482c070deb4c8cf02', '1', '我的面板-个人信息-修改密码', '1', '2015-06-18 14:52:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/modifyPwd', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('25cb64693382448cb7ac22423398e25e', '1', '系统登录', '2', '2015-06-11 09:53:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('25fceca6143e421796239fe631873a75', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-11 09:59:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/office/list', 'GET', 'parentIds=0,1,&id=1', '');
INSERT INTO `sys_log` VALUES ('261a13c8406645af8b027d231bd34534', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:15:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('2636162ba64049289629928c126f6d2d', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:08:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=&parent.id=1&name=江苏省&remarks=&code=120003&type=1&parent.name=中国', '');
INSERT INTO `sys_log` VALUES ('267117523115428898d4bf200b1b9dfd', '1', '系统登录', '1', '2015-05-20 16:50:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('268dccf92fc14c738ad377d951b8f59f', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:41:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('26af943419d84081bc84ccf49689fc98', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 16:24:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('27338c719f4847a3994bd0b620afc548', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:47:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('27624404a5774289849212a8c4090dca', '1', '内容管理-内容管理', '1', '2015-06-18 14:56:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2780b1ef026a4296be87e4882d107e74', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:29:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'POST', 'orderBy=&pageNo=1&office.name=公司领导&company.id=&name=&pageSize=30&office.id=2&company.name=&loginName=', '');
INSERT INTO `sys_log` VALUES ('279fabcee8414de4a0e90a0891ba2cfd', '1', '在线办公-个人办公-审批测试', '1', '2015-06-18 14:54:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/testAudit', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('2826bde224114c1ca9b026980840d435', '1', '内容管理-内容管理-内容发布', '1', '2015-06-18 16:14:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('2855477c09d445a6abe306b13fabcd44', '1', '内容管理-栏目设置-站点设置-查看', '1', '2015-05-20 22:15:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('28970760d890480fa2c80f524aebbcce', '1', '系统设置-系统设置-字典管理-查看', '1', '2015-06-10 15:53:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/form', 'GET', 'id=71', '');
INSERT INTO `sys_log` VALUES ('28bce7554d93424abdf019712a361ac2', '1', '系统设置-日志查询-日志查询', '1', '2015-06-10 15:45:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/log', 'GET', 'tabPageId=jerichotabiframe_17', '');
INSERT INTO `sys_log` VALUES ('28cd20413b9145a8a2b7744ddd9a251c', '1', '代码生成-代码生成-业务表配置', '1', '2015-06-10 16:27:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_18', '');
INSERT INTO `sys_log` VALUES ('28dc8131cdf846d5a791fb1f795ead50', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-11 10:07:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/save', 'POST', 'phone=13977892345&no=0001&oldLoginName=admin&newPassword=&roleIdList=5&remarks=最高管理员&loginFlag=1&photo=/MyJeeSite/userfiles/1/images/photo/2015/06/6135d612jw1ei5sjvujkej20xc18gqb2.jpg&office.id=2&company.name=湖南省总公司&userType=&id=1&confirmNewPassword=&_roleIdList=on&email=rongrong2773@163.com&office.name=公司领导&company.id=1&name=系统管理员&loginName=admin&mobile=13977892345', '');
INSERT INTO `sys_log` VALUES ('29279ee33a8d40e088013a0b1a00d9c9', '1', '我的面板-个人信息-修改密码', '1', '2015-06-10 14:33:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2977e0795fcf47a99fc87e5212bf5fdd', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 17:11:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('29bd2c3bcef146a8b74b55f9eea1d24f', '1', '系统设置-机构用户-区域管理', '1', '2015-06-12 08:59:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('2a4d163e9a7a4e2dbc1c909df8efac08', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:20:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=6', '');
INSERT INTO `sys_log` VALUES ('2b288c4c99c94a67b8c2f5a0774f2fa0', '1', '在线办公-个人办公-我的任务', '1', '2015-05-18 11:11:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_19', '');
INSERT INTO `sys_log` VALUES ('2b4adde5dfe64a2d98fe6314ca5c0585', '1', '内容管理-栏目设置-切换站点', '1', '2015-06-12 17:01:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/select', 'GET', 'tabPageId=jerichotabiframe_15', '');
INSERT INTO `sys_log` VALUES ('2b572e93a0cf4339a9ee350bbb8373df', '1', '在线办公-通知通告-通告管理', '1', '2015-05-20 22:14:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('2b63897d508f437ebeddb79b0118b5f7', '1', '我的面板-个人信息-个人信息', '2', '2015-06-11 09:28:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('2b93b84fb3b4438699048d7dfec9467a', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-18 14:58:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2c4e571e6e5a4f019e1c61927087cd34', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:08:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('2cfcabed14e841daab4df4a73a488cb1', '1', '在线办公-通知通告-我的通告', '1', '2015-06-18 14:54:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('2da3a3ef9b914a19ba02d97e0dec5ba4', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-11 09:56:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=sd_scb&loginName=sd_scb', '');
INSERT INTO `sys_log` VALUES ('2dbd7a8c36dd4ab4a1f624daffc85ec8', '1', '系统设置-系统设置-字典管理', '1', '2015-05-18 11:17:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2dc13d3a3a254503b097510fba13af2a', '1', '内容管理-内容管理', '1', '2015-05-18 11:13:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2e8e2ce9e80d4e5caac9d467b918039d', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2015-06-12 17:16:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/save', 'POST', 'module=article&keywords=&sort=20&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=4&id=10&customListView=&office.name=市场部&description=&parent.id=1&name=公司产品&target=&allowComment=1&showModes=0&href=&viewConfig=&parent.name=顶级栏目', '');
INSERT INTO `sys_log` VALUES ('2f117e509d3f4d25bcb80b58e3cc130b', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:55:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2f17192d158246999de5751d152b34e8', '1', '内容管理-内容管理', '1', '2015-06-12 08:59:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2f1f131195174186839ad88d98424b8d', '1', '系统设置-机构用户-机构管理', '1', '2015-06-12 08:59:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('2f815c3e474342749799d5f52421a784', '1', '内容管理-内容管理', '1', '2015-05-18 11:13:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2f911adf72d447ae9612b52574006bf1', '1', '系统登录', '2', '2015-06-10 17:52:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2fdd321904cc4f5892ceaa9f43e7618e', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:05:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('30778d7a3df64f34a16ed99c641bda14', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-11 10:03:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('30a1c9c6dd404f4097c49323137ede09', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 15:11:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('3144d3738c754797943de8ec1b9791b6', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:50:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('319a99f4fd1d403cbd4e7a655eb2cdb0', '1', '系统登录', '2', '2015-06-11 09:28:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('31c052fecb7248faa5fc87489f3b8a52', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:24:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('320cd49dfa414d01a454ceb224f76c1f', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 11:24:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('327f61cfe35f4ed4b67f18bff42a6724', '1', '系统设置-机构用户-区域管理', '1', '2015-06-18 14:59:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_29', '');
INSERT INTO `sys_log` VALUES ('32bc3e1637714c179d5fe98ff5b1ff1d', '1', '系统设置-机构用户-机构管理', '1', '2015-06-18 14:59:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_28', '');
INSERT INTO `sys_log` VALUES ('32d82cc10da74e4aa4d45159cedbe853', '1', '系统登录', '1', '2015-06-12 17:21:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=关键字1,关键字2&weight=0&customContentView=&category.id=3&category.name=网站简介&articleData.copyfrom=来源&link=&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/20120223391.jpg&articleData.allowComment=1&id=1&articleData.relation=&title=公司历史文化&color=green&articleData.content=\r\n	\r\n		\r\n			\r\n				公司是指一般依法设立的，有独立的法人财产，以营利为目的的企业法人。根据现行中国...&description=&weightDate=&posidList=1&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('330dd670b4dc41ef9aed78d9e97bba38', '1', '在线办公-流程管理-模型管理', '2', '2015-06-11 09:28:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('33285cab2c6d4f9694f1d407d770459c', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:08:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('340bec5a4c4c463abaa7eb1bfdeb5cd9', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 17:07:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3437833da02b42e9a9713e2a3fd73e2b', '1', '内容管理-内容管理', '1', '2015-06-18 16:14:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('344cdd2e289b4ec5bf461b4194794a9a', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:09:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'parent.id=ff8fb2c20e1140bd92e87ba801fa1152', '');
INSERT INTO `sys_log` VALUES ('345ab0ca9cea48c4a6ecf92ef2af8b7c', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 16:44:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3,', '');
INSERT INTO `sys_log` VALUES ('34a4efbf1ee14b6898bb33fa1bb39c82', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:11:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=&parent.id=2&name=浏阳市&remarks=&code=130098&type=1&parent.name=湖南省', '');
INSERT INTO `sys_log` VALUES ('34f660547b124b75b7749bd03b3c99c2', '1', '代码生成-生成示例-树结构', '1', '2015-05-18 11:07:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/test/testTree', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('3536181f9c1e47e29a667edb43104c21', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-10 17:16:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('35caa42ef3fb4fffa81887e25fc753d0', '1', '内容管理-内容管理-内容发布', '1', '2015-05-18 11:05:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('35d053c7f4e8468e8daeeaf8b975ae9f', '1', '系统设置-机构用户-用户管理', '2', '2015-06-10 17:57:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('35f66193c53e4016aaaca855f56357e9', '1', '代码生成-生成示例-单表', '1', '2015-05-20 17:11:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/test/testData', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('364ca5599efb454281ec42618af5b501', '1', '在线办公-通知通告-我的通告', '1', '2015-06-10 17:03:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('368c676f8dc04547a370d58e6ee944b6', '1', '内容管理-内容管理', '1', '2015-06-10 16:58:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('36d459fa9af34a9cb9c56bb5c20376f8', '1', '代码生成-生成示例-主子表', '1', '2015-05-20 17:11:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/test/testDataMain', 'GET', 'tabPageId=jerichotabiframe_17', '');
INSERT INTO `sys_log` VALUES ('373d79653a7449018f0ab387af1f1e4e', '1', '系统登录', '1', '2015-06-10 14:38:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('37b9ee7de4e849eb96ac3ca3640aad59', '1', '内容管理-栏目设置-栏目管理', '1', '2015-05-18 11:01:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/category/', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('38988c09ebb24fb19d49d9f25d64be84', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:08:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('389df71bf11b45f5b245abc9c9e53b86', '1', '系统设置-系统设置-字典管理', '1', '2015-06-18 15:01:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'POST', 'pageNo=1&description=&pageSize=30&type=cms_guestbook', '');
INSERT INTO `sys_log` VALUES ('395589410d724cde9db76926fb3f92c4', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 16:23:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3966093109ef4ca68d1c86d81aa53bd1', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:04:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', 'office.name=æµåå¸åå¬å¸&office.id=7', '');
INSERT INTO `sys_log` VALUES ('396b0d07112b4560b76ad93e635354fa', '1', '系统设置-机构用户-机构管理', '1', '2015-06-11 09:59:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('3986919ddbb345cb80899d92aceaeffe', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-10 17:11:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=thinkgem&loginName=admin', '');
INSERT INTO `sys_log` VALUES ('39ae3a178d9f44eabac36baf4aa910b5', '1', '系统设置-机构用户-用户管理', '1', '2015-06-10 15:01:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('3d1de8069df74a308a09af640fc6cced', '1', '内容管理-内容管理', '1', '2015-06-18 14:55:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3d7cba0cd98d4280951f7e1f917c79be', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 16:27:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3d9df2499dcc400291fbe55b9219597d', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:23:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3e3e5708bd8047d3ab267bbe107cc87c', '1', '内容管理-内容管理', '1', '2015-06-10 16:58:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3eaf3c3af80d4f0d9214b01646eaa53f', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:15:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('3f97ac9b87094b8b8b127f2b9aadd12d', '1', '系统设置-机构用户-用户管理', '2', '2015-06-10 17:53:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('400d3e2b8fdb43c49e91f62c57292a93', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 16:27:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('40403bb2317d44678e09b21b2c86d8fa', '1', '在线办公-流程管理-流程管理', '2', '2015-06-11 09:28:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('4105f6d188e24136a10687ff2c23d2bc', '1', '内容管理-内容管理-内容发布', '1', '2015-06-12 17:22:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_24', '');
INSERT INTO `sys_log` VALUES ('4159a7ef3ecd4043bbee720be5846712', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-05-18 17:24:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/article/findByIds', 'GET', 'ids=1,2,3', '');
INSERT INTO `sys_log` VALUES ('42fa58feb3794e109b4f3915b468a8c2', '1', '内容管理-内容管理', '1', '2015-05-18 11:01:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('430f7ef7381046718d8b7ce98385e2cd', '1', '在线办公-通知通告-我的通告', '1', '2015-06-10 16:27:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_17', '');
INSERT INTO `sys_log` VALUES ('43de0fcc534b498e903c8ccadc841bb2', '1', '系统设置-机构用户-用户管理', '1', '2015-05-18 17:23:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('44103ed4d5e54bf08aed64044486b058', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2015-06-12 17:19:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/save', 'POST', 'module=&isAudit=0&sort=30&keywords=&customContentView=&inList=1&inMenu=1&image=&office.id=1&id=7be5ba2e4b164b909e67f6289096fa24&customListView=&description=&office.name=湖南省总公司&name=客户服务&parent.id=1&target=&allowComment=1&showModes=0&href=&viewConfig=&parent.name=顶级栏目', '');
INSERT INTO `sys_log` VALUES ('448de07938044d66b7afb5ef926a2762', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 15:48:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('44d141ec9dc243048e9b3fe0b31ced38', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 09:03:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=', '');
INSERT INTO `sys_log` VALUES ('45e85617bb114adfbd22775ce9c8c1bf', '1', '内容管理-内容管理', '2', '2015-06-11 09:28:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('45fe472606c14d0d92ed94f5acf5a79d', '1', '在线办公-通知通告-通告管理', '1', '2015-06-12 16:57:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('461950311d2644ec93474e4b491219f8', '1', '内容管理-内容管理-内容发布', '1', '2015-06-11 09:23:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('4629c765c52e47abbe62305d7874e620', '1', '在线办公-个人办公-我的任务', '1', '2015-05-20 22:14:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('468faa97c8cb4ae69bdf1d7e6c57fd1c', '1', '内容管理-栏目设置-站点设置-查看', '1', '2015-05-20 22:15:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('4734d5cb91a44cb18cf1146b51d670f1', '1', '内容管理-栏目设置-站点设置-修改', '1', '2015-05-20 22:15:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/save', 'POST', 'id=2&logo=&title=JeeSite Subsite&keywords=JeeSite subsite&description=JeeSite subsite&customIndexView=&name=子站点测试&theme=basic&copyright=\r\n	Copyright © 2012-2013  V1.0\r\n', '');
INSERT INTO `sys_log` VALUES ('47edf48007d047dcaed891371b78a832', '1', '系统设置-机构用户-机构管理', '1', '2015-06-10 17:12:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('4856e03ad15545998fb9f72e8d828787', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-18 14:56:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('4872a13cf2274948b70ae1f754e69955', '1', '内容管理-内容管理', '1', '2015-05-18 11:01:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('487b49732cd941b3b2ee846ae45bf5ca', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-10 16:21:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/save', 'POST', 'dataScope=2&officeIds=&remarks=&office.id=2&oldName=公司管理员&id=2&menuIds=1,27,28,29,30,71,56,57,58,59,62,63,64,65,66,69,70,72,31,40,41,42,43,44,45,46,47,48,49,50,51,52,53...&useable=1&office.name=公司领导&name=公司管理员1&roleType=assignment&sysData=1&enname=hr&oldEnname=hr', '');
INSERT INTO `sys_log` VALUES ('48dab90e9f7b4f2fb5aa29988d833d79', '1', '系统设置-系统设置-字典管理', '1', '2015-06-18 15:01:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'POST', 'pageNo=1&description=&pageSize=30&type=act_type', '');
INSERT INTO `sys_log` VALUES ('48f0181702214b44b22a8be847802a78', '1', '代码生成-生成示例-单表', '1', '2015-06-18 15:03:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/test/testData', 'GET', 'tabPageId=jerichotabiframe_45', '');
INSERT INTO `sys_log` VALUES ('4956044276804b5c80f6d9589e43a90a', '1', '在线办公-通知通告-我的通告', '1', '2015-05-21 11:08:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('49569c987f8844beba4b06eeb7732009', '1', '系统登录', '1', '2015-06-10 14:56:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/tree', 'GET', 'parentId=62', '');
INSERT INTO `sys_log` VALUES ('49c82c925d764cceaf968638d533362b', '1', '内容管理-内容管理-内容发布', '2', '2015-06-10 17:57:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('49da87476fb3491c83e8ace6d70b7fae', '1', '在线办公-通知通告-我的通告', '1', '2015-06-12 16:57:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('4a844297d6624feda0c7a3596a152d3e', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:24:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4b02fb74b38b4591a2f21af275516a4e', '1', '代码生成-代码生成-业务表配置', '1', '2015-05-18 17:23:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('4b401902edae4ffa99eb2a0836a4532d', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2015-06-12 17:18:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/form', 'GET', 'id=14', '');
INSERT INTO `sys_log` VALUES ('4ba6abe136e54c66a3722927560a300e', '1', '内容管理-内容管理', '1', '2015-05-20 22:14:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4c193c793c3641acb9c1f9752a6898e3', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-18 14:58:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('4c6985987d6b435884259d93bd714b9a', '1', '代码生成-代码生成-业务表配置', '1', '2015-05-20 17:10:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_15', '');
INSERT INTO `sys_log` VALUES ('4c7897b5cee149ab8aea790ea51cca8a', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:33:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('4ca36412667d4a7baaaca21fc30625d5', '1', '内容管理-栏目设置-站点设置-查看', '1', '2015-05-20 22:15:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('4d2e5628a7f44ca6a788f4eccd280cff', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:14:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('4d4d306cf4d541fb9d2f82ffa846bb3d', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 15:47:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4d7be1b5344549e881f173fd89b28c82', '1', '在线办公-流程管理-流程管理', '2', '2015-06-10 17:57:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('4d922c5d85374a39b58b2a03eb08a266', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:11:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('4de095d40eab44d9a43039a99a817877', '1', '在线办公-通知通告-我的通告', '1', '2015-06-10 17:55:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('4e6da37a7e474606b6bc5a79ae6f8df7', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:18:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'parentIds=0,1,&id=1', '');
INSERT INTO `sys_log` VALUES ('4edd15bc8c064829b4d2521663ad2c00', '1', '在线办公-通知通告-我的通告', '1', '2015-06-18 16:14:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('4ee2966121ff4c6d83a14ff0d2795518', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 15:01:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', 'office.name=å±±ä¸çæ»å¬å¸&office.id=1', '');
INSERT INTO `sys_log` VALUES ('4f60a8bd09504fa9beae52474cfe1403', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:04:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('4f89529fde2a40a2ad1ecf172dd210e1', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-18 14:59:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_30', '');
INSERT INTO `sys_log` VALUES ('4fd01e3025eb477bb8a4f0b6b1406a8e', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 16:21:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4fe4844a39074f4c8fe447d39f7929db', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 10:06:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('4ff90787b82f4d44ad766de352c2e18a', '1', '内容管理-内容管理', '1', '2015-05-18 11:22:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('500edf6f07684ef69fab293ec09c533b', '1', '内容管理-内容管理', '1', '2015-05-18 17:22:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('50a97e0b297d445d97050937049e4eb9', '1', '系统登录', '1', '2015-06-11 09:51:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('50ccc14970f24da8aa324d5f0cf8df22', '1', '系统登录', '1', '2015-05-20 17:38:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('51a790d2b2394e85a5c5821b8c8a21bc', '1', '系统设置-系统设置-菜单管理', '1', '2015-05-18 11:16:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_30', '');
INSERT INTO `sys_log` VALUES ('52b3c3a01285425aa2952675b9c316b3', '1', '内容管理-栏目设置-站点设置', '1', '2015-06-12 09:44:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('52f22e8e5aaa4b45a34f85fa8e381c9b', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:20:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/delete', 'GET', 'id=6487494a49424fc7b049d77ee644303a', '');
INSERT INTO `sys_log` VALUES ('5395e27b2e3048d891c321438bbcccaf', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 17:00:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('53df475b6af44d279f77205d0e40411e', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 17:55:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('53e1b9e3db944033ba73b1d0d78523c7', '1', '我的面板-个人信息-修改密码', '1', '2015-05-18 11:01:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('53e550de62ba4ff5a4f015dead27ba1c', '1', '系统设置-机构用户-区域管理', '1', '2015-06-11 10:02:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('54b6e1b49f7e45eeb097dd61add5cfbe', '1', '在线办公-通知通告-通告管理', '1', '2015-06-11 09:24:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('54dac53061874fb28f7eb7ab89d9d3db', '1', '在线办公-流程管理-模型管理', '1', '2015-05-20 16:51:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('54ee592f5d244d148745f34b05ad3fb4', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:21:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3,', '');
INSERT INTO `sys_log` VALUES ('5558987de2b6471dbe51cfc099deaaa0', '1', '在线办公-通知通告-通告管理', '1', '2015-05-18 11:09:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('560488ee21f34ba8b0f4a08b2740a943', '1', '在线办公-流程管理-模型管理', '1', '2015-06-18 16:08:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('575708a0fb754bbf88b9e707ac1add9d', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 11:24:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('58a1777d5abc497fbc8fd6f524858347', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 17:56:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5979ac0cd08c474b948bff172b7cd6c3', '1', '系统设置-机构用户-区域管理', '1', '2015-06-11 10:01:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_17', '');
INSERT INTO `sys_log` VALUES ('598c7e0d51524569b1d6ab2ce4c82dc5', '1', '我的面板-个人信息-个人信息', '1', '2015-06-11 09:31:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('59af442a587a4487ba8e7fcdd00b36ea', '1', '我的面板-个人信息-个人信息', '1', '2015-06-11 10:04:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('5a1818c203c24ff99a113de399adf996', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-20 17:38:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5a27024468304ae8b8008a98de33a0ce', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 17:44:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5a5b5df1332e4f6688ada1cc912101a1', '1', '内容管理-内容管理', '1', '2015-06-18 16:14:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5aa05c40484445cfac8314f28de6e653', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:20:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('5abbeb3ca10c4036bf9a68cc85366c9a', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-05-18 17:24:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/article/', 'GET', 'category.id=3', '');
INSERT INTO `sys_log` VALUES ('5b36fc6bc03648a3adff8052a2f93951', '1', '系统设置-机构用户-用户管理', '1', '2015-06-12 16:35:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('5bd82cbbdca44d9393fb9866459461db', '1', '系统设置-系统设置-字典管理', '2', '2015-06-10 17:53:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('5bfb154d20444eb2b9d869e8c8584187', '1', '我的面板-个人信息-个人信息', '1', '2015-06-11 09:23:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('5c121a61ba2e409cb9a1bcc3f3f5c04b', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-18 15:03:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/assign', 'GET', 'id=5', '');
INSERT INTO `sys_log` VALUES ('5c3b2d6ab039454593340a6ce1b454eb', '1', '内容管理-内容管理', '1', '2015-06-12 17:22:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5d46efb3bb5c4878912c2e6b349ea2eb', '1', '系统登录', '1', '2015-06-18 15:02:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'POST', 'pageNo=1&description=&pageSize=30&type=theme', '');
INSERT INTO `sys_log` VALUES ('5d74647ffc7547e28a1a56f782998ce7', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 11:10:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'POST', 'title=&pageNo=1&pageSize=30&type=', '');
INSERT INTO `sys_log` VALUES ('5dab510f805f4bc5b822723ed5119514', '1', '系统设置-系统设置-菜单管理-查看', '1', '2015-06-10 15:15:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/form', 'GET', 'id=90', '');
INSERT INTO `sys_log` VALUES ('5de3f02f2ae94b8b96695906afe0b15b', '1', '系统设置-系统设置-字典管理-查看', '1', '2015-06-10 15:23:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/form', 'GET', 'sort=10', '');
INSERT INTO `sys_log` VALUES ('5e49d6be78164644a3b926d346b6589f', '1', '系统设置-系统设置-字典管理-查看', '1', '2015-05-18 11:17:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/dict/form', 'GET', 'id=71', '');
INSERT INTO `sys_log` VALUES ('5f0dc301279e4e42a82cac0e48a2769b', '1', '内容管理-内容管理-内容发布', '1', '2015-06-10 16:58:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_27', '');
INSERT INTO `sys_log` VALUES ('5f2ec96d994e4733b3ab3294194e43ed', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 16:20:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5f459b98eed440a6b88313df3d5aee5b', '1', '内容管理-内容管理', '1', '2015-06-10 17:07:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5f6ae1c91d0d479c94dabe89890a787f', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:08:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'POST', 'phone=8675&email=thinkgem@163.com&name=系统管理员&remarks=最高管理员&photo=/jeesite/userfiles/1/images/photo/2015/05/005JFMZKjw1ek4aze73pij30qs0zqn2t.jpg&mobile=8675', '');
INSERT INTO `sys_log` VALUES ('5fb95c64b7d143d2b411ec39660a6d1e', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-12 17:16:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5ff85b067ccf4902a552aa917d20bd76', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-05-18 11:23:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/office/form', 'GET', 'parent.id=', '');
INSERT INTO `sys_log` VALUES ('6027fa04b2f34cfdacc85b0ef3bc8e7c', '1', '系统登录', '1', '2015-06-11 09:31:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('608100d6b0104568bd753509f18024ce', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-12 08:59:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('613d6a9be95b4765b15c42f5d49d20f0', '1', '在线办公-通知通告-我的通告', '1', '2015-06-10 17:16:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('6181976971f54dd4b3f9b669d5f6712d', '1', '系统设置-系统设置-字典管理', '1', '2015-05-18 11:17:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/dict/', 'POST', 'pageNo=1&description=&pageSize=30&type=act_category', '');
INSERT INTO `sys_log` VALUES ('61aa7db4ef754fd5a4af20c04c047a4b', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:00:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3', '');
INSERT INTO `sys_log` VALUES ('61fb9c6a17704f459df0be16d34549e2', '1', '系统设置-系统设置-字典管理-查看', '1', '2015-05-18 11:17:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/dict/form', 'GET', 'id=71', '');
INSERT INTO `sys_log` VALUES ('627a1e06147e4a1093e0eb3a370d5344', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:10:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('627d25a2c9ee4535bd567cb942b1b490', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 17:23:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('629f6745380d48239134b515d90baf37', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 15:50:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('634e1f57d73e46e88380e548e713749b', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-18 14:56:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=10', '');
INSERT INTO `sys_log` VALUES ('63665f774cfc48bf897c301bf297a956', '1', '系统设置-机构用户-用户管理', '1', '2015-05-18 11:05:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('641c815b4bc24f31903ee59a1c380775', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-10 17:11:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/save', 'POST', 'phone=13977892345&no=0001&oldLoginName=thinkgem&newPassword=&roleIdList=1&remarks=最高管理员&loginFlag=1&photo=/MyJeeSite/userfiles/1/images/photo/2015/06/6135d612jw1ei5sjvujkej20xc18gqb2.jpg&office.id=2&company.name=湖南省总公司&userType=&id=1&confirmNewPassword=&_roleIdList=on&email=rongrong2773@163.com&office.name=公司领导&company.id=1&name=系统管理员&loginName=admin&mobile=13977892345', '');
INSERT INTO `sys_log` VALUES ('64b9c2dddde542fab8b57cd9e05e0dc1', '1', '系统设置-机构用户-用户管理', '1', '2015-06-11 09:29:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('64cabf15abaa4d79b9c24633bbc51884', '1', '在线办公-通知通告-我的通告', '1', '2015-06-11 09:31:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('6540324646f84de1b0e3aa641ca4c8dd', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 15:17:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('654e2ea6993a42d9869a8331a40a7601', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-20 22:16:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('655d2f829db748d1979a288b27b07947', '1', '系统设置-机构用户-用户管理-查看', '2', '2015-06-10 17:57:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6569629d8ee240b2b980dc5e5063eef6', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 16:50:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3', '');
INSERT INTO `sys_log` VALUES ('658638a7188445798aeee2bb6b357f14', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:10:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('662014c87801492b9b494a34e99f2488', '1', '在线办公-流程管理-流程管理', '2', '2015-06-11 09:53:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('66274c00706a44dda29889d45288db74', '1', '代码生成-生成示例-树结构', '1', '2015-06-18 15:03:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/test/testTree', 'GET', 'tabPageId=jerichotabiframe_47', '');
INSERT INTO `sys_log` VALUES ('66b862abc5ed4f8ab3501d282d93cb1b', '1', '内容管理-内容管理-公共留言-查看', '1', '2015-06-10 17:16:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/guestbook/', 'GET', 'tabPageId=jerichotabiframe_8&status=2', '');
INSERT INTO `sys_log` VALUES ('66f1ce4079f8429cb3882f9ec5c34308', '1', '在线办公-通知通告-我的通告', '1', '2015-06-18 16:08:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('673d69a3420147388eea305f341f3fb7', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:20:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('67af08dd96604fd3a0457810b6186ab0', '1', '内容管理-内容管理', '1', '2015-06-12 09:41:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none/', 'GET', 'category.id=24', '');
INSERT INTO `sys_log` VALUES ('67ff9ca886ae4376a6783cffbbf8c4fd', '1', '系统设置-系统设置-菜单管理-修改', '1', '2015-06-10 17:00:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/save', 'POST', 'id=&icon=&sort=5030&parent.id=1&name=测试模块&target=&permission=&remarks=&href=/&parent.name=功能菜单&isShow=1', '');
INSERT INTO `sys_log` VALUES ('687e287893bd4d18a9b0588bf1de0c68', '1', '我的面板-个人信息-修改密码', '1', '2015-05-18 11:24:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/modifyPwd', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('694837c0d8bc4570b205cda7022ed06b', '1', '代码生成-生成示例-单表', '1', '2015-06-10 16:27:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/test/testData', 'GET', 'tabPageId=jerichotabiframe_20', '');
INSERT INTO `sys_log` VALUES ('69a5404be90843d98d0b677a42541563', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-05-18 11:23:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=0,', '');
INSERT INTO `sys_log` VALUES ('6a29b0b20080443db7f228624aa46bc9', '1', '在线办公-流程管理-流程管理', '2', '2015-06-10 17:53:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('6a5381f1169e42eab7b0f7590bc018cc', '1', '系统登录', '1', '2015-05-21 11:06:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6ac6858e278c43249197e08e690d4b35', '1', '系统设置-机构用户-机构管理', '1', '2015-05-18 11:16:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_29', '');
INSERT INTO `sys_log` VALUES ('6ad492a406f94f5c9f1ac83d21635970', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 15:48:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_26', '');
INSERT INTO `sys_log` VALUES ('6b3bb85b0ec049aca97557ff6203a693', '1', '内容管理-内容管理-内容发布-文章模型', '2', '2015-06-11 09:54:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('6b3ff109f25a4f2db0d28b1adf8ce31b', '1', '在线办公-流程管理-流程管理', '1', '2015-05-20 16:51:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('6b43146923944f5aa64e04d3b18f9fcf', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 17:20:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('6bd0c1fcd44640f690067ece84678559', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 17:06:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=新能源,背景&weight=0&customContentView=&category.id=3&category.name=网站简介&articleData.copyfrom=来源&link=&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/c2cec3fdfc039245363f3f4e8594a4c27c1e25e...&articleData.allowComment=1&id=2&articleData.relation=1,2,3,&title=北京我们的祖国首都&color=red&articleData.content=\r\n	北京市发展和改革委员会下发《关于大唐青灰岭风光发电示范项目49.7兆瓦工程核准的批复》文件，标志着...&description=我爱北京，我爱北京天安门，北京是五千年中国文化的汇聚地，凝聚了华夏祖宗多少梦想&weightDate=&posidList=1&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('6c0fff440e3140088225524876f42f57', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:32:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('6c54e05a45ad4588bb54484be983a74d', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:06:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('6d0689bc4f7248dd809ed0c7a0a69fea', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-05-18 11:23:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/office/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('6d074aa064a644adbfa1e94b8d4353c7', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:07:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6d8f907c103b435f9c75da555cfe6a77', '1', '系统设置-机构用户-机构管理-修改', '1', '2015-06-10 15:19:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/save', 'POST', 'primaryPerson.id=&phone=&fax=&area.id=5&office.primaryPerson.name=&remarks=&code=201010&type=1&master=&id=17&area.name=天心区&useable=1&office.deputyPerson.name=&address=&email=&parent.id=7&name=天心区分公司&zipCode=&grade=3&parent.name=长沙市分公司&deputyPerson.id=', '');
INSERT INTO `sys_log` VALUES ('6e4c79eb198142c687ed3625a3b0a99b', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2015-06-12 17:19:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/form', 'GET', 'id=7be5ba2e4b164b909e67f6289096fa24', '');
INSERT INTO `sys_log` VALUES ('6e55cb740f1e4fcc95108e7a42211f11', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 15:52:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/import/template', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6e99b0bb0b5e41f4b89a7fcc3ce32128', '1', '代码生成-代码生成-业务表配置', '1', '2015-06-18 16:08:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('6ef5512a50ff476a8b713156735b1fe3', '1', '系统设置-系统设置-字典管理', '1', '2015-06-11 10:00:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/dict/', 'POST', 'pageSize=30&type=&pageNo=3&description=', '');
INSERT INTO `sys_log` VALUES ('6f948af6df12481bae29dee62319de79', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:19:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/form', 'GET', 'id=17', '');
INSERT INTO `sys_log` VALUES ('6fb81462320a44ffb6b6affc512415a6', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 11:24:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('702b615b02a7466c9952b57d64f150e3', '1', '内容管理-栏目设置-站点设置-修改', '1', '2015-06-12 16:42:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/save', 'POST', 'id=1&logo=/MyJeeSite/userfiles/1/images/cms/site/2015/06/biaoti.jpg&title=Hua Ying Soft&keywords=华英科技&description=中国华英科技有限公司，坐落于美丽的浏阳河畔，成立于公元1990年，目前公司员工100多人，从事软件开发与...&customIndexView=&name=华英总公司&theme=basic&copyright=\r\n	Copyright © 2012-2013\r\n', '');
INSERT INTO `sys_log` VALUES ('703be5148b364fa7b784c5db0e9ab187', '1', '我的面板-个人信息-个人信息', '1', '2015-06-12 08:59:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('7114ee86a9bb4c4785b57c6b26311dad', '1', '在线办公-通知通告-我的通告', '1', '2015-06-10 14:56:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('7142cac9f3b845429a393c5f186de659', '1', '内容管理-内容管理', '1', '2015-06-12 09:42:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('718e8da1b7a849efab1ce27165d47035', '1', '系统登录', '1', '2015-05-21 11:07:38', '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET4.0E; .NET4.0C; Shuame)', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('71be7f206d4644348c9a8b071d78f8c8', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:06:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=6&parent.id=3&name=岳麓区&remarks=&code=110105&type=4&parent.name=长沙市', '');
INSERT INTO `sys_log` VALUES ('726361694953448fb7e8b5e152f5b7b4', '1', '系统登录', '1', '2015-06-12 09:20:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('72b9b37cd4b24477899689fe44c90d20', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:18:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'parentIds=0,&id=', '');
INSERT INTO `sys_log` VALUES ('72c9cdbb006c41768b423537d8aa612c', '1', '内容管理-栏目设置-切换站点', '1', '2015-06-18 14:57:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/select', 'GET', 'tabPageId=jerichotabiframe_19', '');
INSERT INTO `sys_log` VALUES ('737b5886c1884158a2bb037056a67c34', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 15:15:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('73fd0d10ac964bc1975e2aa6b08f79b1', '1', '系统设置-机构用户-用户管理', '1', '2015-05-18 11:14:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_26', '');
INSERT INTO `sys_log` VALUES ('74887ae038644df1b93c4f1772156449', '1', '内容管理-内容管理-内容发布', '1', '2015-06-12 09:09:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('74bd93a31daf4229915ffc18322546ba', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2015-06-12 17:17:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/save', 'POST', 'module=article&keywords=&sort=20&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=3&id=6&customListView=&office.name=综合部&description=&parent.id=1&name=典型案例&target=&allowComment=1&showModes=1&href=&viewConfig=&parent.name=顶级栏目', '');
INSERT INTO `sys_log` VALUES ('7549bf62428f45cd99126935f8c400b2', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:06:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'id=5', '');
INSERT INTO `sys_log` VALUES ('7591da8ef98a4cbba392af2248c0db30', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:56:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'POST', 'orderBy=&pageNo=1&office.name=市场部&company.id=&name=&pageSize=30&office.id=4&company.name=&loginName=', '');
INSERT INTO `sys_log` VALUES ('76b4d18ef9944cd683b4018f58f9ec90', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 09:00:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3', '');
INSERT INTO `sys_log` VALUES ('76f7bba2bc014074ba7b824536fa6a4c', '1', '在线办公-流程管理-模型管理', '1', '2015-05-21 11:08:24', '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET4.0E; .NET4.0C; Shuame)', '/MyJeeSite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('77980805cd104c74908667f916d88028', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:20:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('779be956a3e947c2873d6e7427e34db0', '1', '系统设置-系统设置-字典管理', '1', '2015-06-10 15:22:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'POST', 'pageNo=1&description=&pageSize=30&type=act_category', '');
INSERT INTO `sys_log` VALUES ('77e6bedb726140d2a9c0e117553168f9', '1', '系统登录', '1', '2015-05-18 17:21:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('77fa3f831f01490c854722c9f7c08498', '1', '内容管理-栏目设置-站点设置-修改', '1', '2015-06-12 09:44:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/save', 'POST', 'logo=/MyJeeSite/userfiles/1/images/cms/site/2015/06/20120223391.jpg&keywords=华英,公司&theme=basic&copyright=\r\n	Copyright © 2012-2013 V1.0\r\n&id=2&title=Hua Ying Soft Changsha&description=   华英旗下的子公司，目前处于建设之前&customIndexView=&name=华英长沙分公司', '');
INSERT INTO `sys_log` VALUES ('77fac3ea8fc64cbc891c4e51639395ea', '1', '系统设置-机构用户-机构管理-修改', '1', '2015-06-10 15:20:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/save', 'POST', 'primaryPerson.id=&phone=&fax=&area.id=6&office.primaryPerson.name=&remarks=&code=201010&type=1&master=&id=22&area.name=岳麓区&useable=1&office.deputyPerson.name=&address=&email=&parent.id=7&name=岳麓区分公司&zipCode=&grade=3&parent.name=长沙市分公司&deputyPerson.id=', '');
INSERT INTO `sys_log` VALUES ('781174328c6448f39dc6ab04c1b0c183', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:04:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('78609ad284db4d3f87ba1cf8b4b4dc21', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:06:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('79315fa12080481f8da9a96e6795577d', '1', '系统设置-系统设置-字典管理', '1', '2015-06-18 14:59:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_31', '');
INSERT INTO `sys_log` VALUES ('79431efbb22e4bdea723f82d6b3fee09', '1', '内容管理-内容管理-内容发布', '1', '2015-06-10 17:07:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('794ded2335194a9e831d017a935b9dce', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:19:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/form', 'GET', 'id=12', '');
INSERT INTO `sys_log` VALUES ('7958e40efeb44a21b3b15068b088adf4', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 17:37:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('797449dce3e743258736b9c405dc14eb', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:01:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('79c3b3b7f22641bdb8eb2cdfbbf47ea3', '1', '代码生成-代码生成-业务表配置', '1', '2015-06-18 16:14:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('79ee63cd33654ce0a497de5386daf9c8', '1', '在线办公-通知通告-我的通告', '1', '2015-06-12 17:23:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('7a809dfea8e741c4af44c5ae9312cd76', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:20:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7abe7f11bed74aee962fe230b3220aaf', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 10:07:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('7af3c021c1764fb0b86078cfd9864709', '1', '在线办公-流程管理-流程管理', '1', '2015-05-20 17:07:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_12', '');
INSERT INTO `sys_log` VALUES ('7b29a8569e164d9caf3541e92a7d7db5', '1', '系统登录', '1', '2015-06-10 15:17:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7b64ff2a749441f5a7febf5487c0ff19', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:13:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('7bfddfb55d6c480db4347703cf162c94', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:10:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'parent.id=2', '');
INSERT INTO `sys_log` VALUES ('7c317d78f8e143d09f93229caad02ef3', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-18 14:59:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('7ce01b2e8f214280b927da468b328543', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 16:50:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3,', '');
INSERT INTO `sys_log` VALUES ('7d0e11369d0e41bba40a45fd526e90dc', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 17:04:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('7d1311093a454f6f857ce3f577db3faf', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:36:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('7e29e47d44564194a8ccf7486e00686a', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-05-18 11:13:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/article/', 'GET', 'category.id=3', '');
INSERT INTO `sys_log` VALUES ('7e465ee6eb174b4995f3a2e4eded418b', '1', '在线办公-通知通告-我的通告', '1', '2015-05-21 15:10:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('7f322718a6a14237a1c6908716f7ad60', '1', '内容管理-内容管理-内容发布-文章模型', '2', '2015-06-11 09:54:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=10', '');
INSERT INTO `sys_log` VALUES ('7f722e2ed58c48da9e49e353ab2497ec', '1', '系统设置-系统设置-菜单管理-查看', '1', '2015-06-10 16:23:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/form', 'GET', 'id=29', '');
INSERT INTO `sys_log` VALUES ('7fc7b46290d640dd80dc11b8aabd8a32', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:56:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7fd689a63a6a4ed9896d0be12c243a58', '1', '我的面板-个人信息-个人信息', '1', '2015-06-11 10:02:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('802d4a625f484351b1171df40d0d1977', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-05-18 11:23:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('806c652165784c4ab6735c7f6ab43bfe', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-18 14:57:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('809f873b397a416f86315cf007413484', '1', '代码生成-代码生成-生成方案配置', '1', '2015-05-18 11:25:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/gen/genScheme', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('80d6549eac63426f94f647cc6dd3e4ac', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 17:55:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('80e663e9c7834576be47918025c09631', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-10 17:11:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=thinkgem&loginName=admi', '');
INSERT INTO `sys_log` VALUES ('812990f0c81d44d782e761bfbfe9d3f5', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:01:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('8132957dc50f45639c5848db57feb4d7', '1', '内容管理-栏目设置-切换站点', '1', '2015-05-20 22:16:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/select', 'GET', 'tabPageId=jerichotabiframe_13', '');
INSERT INTO `sys_log` VALUES ('813719e80d0947aba35fe8678edff468', '1', '我的面板-个人信息-修改密码', '1', '2015-05-18 11:23:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('815f89eea47443caad89ba4e94ba9dc3', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-10 16:22:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/save', 'POST', 'dataScope=8&officeIds=&remarks=&office.id=2&oldName=普通用户&id=6&menuIds=1,27,28,29,30,71,56,57,58,59,62,63,64,65,66,69,70,72,31,40,41,42,43,44,45,46,47,48,49,50,51,52,53...&useable=1&office.name=公司领导&name=普通用户&roleType=assignment&oldEnname=d&enname=d&sysData=1', '');
INSERT INTO `sys_log` VALUES ('81b52951424c4ce7bbc38567df2f70a4', '1', '我的面板-个人信息-个人信息', '1', '2015-06-12 17:23:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('8206fbbd5ad944fdbf22822ca49153ae', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 09:08:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=关键字1,关键字2&weight=0&category.id=3&customContentView=&category.name=网站简介&link=&articleData.copyfrom=来源&_posidList=on&image=&articleData.allowComment=1&id=3&articleData.relation=1,2,3,&title=美丽的公司文化&color=&description=&articleData.content=\r\n	中国已经五千年历史，我们每个人的家族源远流长，我们的新中国也已经成立66年，而天涯社区陪伴大家也...&weightDate=&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('82fc88ad038f425d97e1135218b2984a', '1', '系统设置-机构用户-区域管理', '1', '2015-06-11 10:04:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('83be217da3db418b9d9961f4751aef86', '1', '在线办公-通知通告-我的通告', '1', '2015-06-11 09:51:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('842c9b6d669d4fb7ad318bd69ff36135', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 17:55:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('84b96a7c05f8415b9bd12d30740ecfaf', '1', '系统设置-机构用户-区域管理', '1', '2015-06-11 09:59:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('84e735786ce54d768212ad53d3aa9d70', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:09:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('857f68025ffc480c9fb2ce8b555394ad', '1', '系统设置-机构用户-用户管理', '1', '2015-06-18 14:58:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_25', '');
INSERT INTO `sys_log` VALUES ('859f532bae0c47cfa2d522b503bb5f16', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:04:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3,', '');
INSERT INTO `sys_log` VALUES ('8603811fb400471fb512cce6de63934e', '1', '内容管理-内容管理-内容发布-链接模型', '1', '2015-06-12 09:21:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/link/', 'GET', 'category.id=19', '');
INSERT INTO `sys_log` VALUES ('8630dea56ee24eca972e7b14ef2cad4e', '1', '内容管理-内容管理-内容发布-链接模型', '1', '2015-06-12 09:08:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/link/', 'GET', 'category.id=18', '');
INSERT INTO `sys_log` VALUES ('86b741d76590458fb2b2f5bbcc503fa2', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:56:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('86cb517b75e748bab58e5ed5dff60487', '1', '内容管理-统计分析-信息量统计', '1', '2015-06-12 16:58:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_14', '');
INSERT INTO `sys_log` VALUES ('86e2735fb8754e689fc2752799fedd42', '1', '在线办公-流程管理-流程管理', '2', '2015-06-10 17:57:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('8730d896ddef47d8b0f4e9a0c85171ad', '1', '内容管理-内容管理-内容发布', '1', '2015-05-18 17:22:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('877a44be3ce748e9b38da768df500c0b', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:59:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'POST', 'orderBy=&pageSize=30&office.id=13&company.name=&pageNo=1&office.name=公司领导&company.id=&name=&loginName=', '');
INSERT INTO `sys_log` VALUES ('87998b6d7b644ffdba2566ca599f059b', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 16:50:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('87a4e5b363ae4a069cdf721cb15b0e70', '1', '系统设置-机构用户-用户管理', '1', '2015-06-11 09:55:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('880a699b4455450ba8ea55e904a50cb0', '1', '内容管理-内容管理-公共留言-查看', '2', '2015-06-10 17:53:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/guestbook/', 'GET', 'tabPageId=jerichotabiframe_5&status=2', '');
INSERT INTO `sys_log` VALUES ('881c28b04ff74279b6876833cbb799f9', '1', '在线办公-通知通告-通告管理', '1', '2015-06-10 17:04:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('881e162b06c148ddbf0c371f55f7b532', '1', '系统设置-机构用户-用户管理-查看', '2', '2015-06-10 17:53:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8835dde57736466c82fc839adc7758f6', '1', '内容管理-内容管理', '1', '2015-06-12 09:09:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('896c510faa8f43af86b92ff21b1dc980', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:05:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('89faa2833e77423f8b7797b1aef5587b', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 17:13:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=新能源,背景&weight=0&category.id=3&customContentView=&category.name=网站简介&link=&articleData.copyfrom=来源&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/c2cec3fdfc039245363f3f4e8594a4c27c1e25e...&articleData.allowComment=1&id=2&articleData.relation=1,2,3,&title=北京我们的祖国首都&color=red&description=我爱北京，我爱北京天安门，北京是五千年中国文化的汇聚地，凝聚了华夏祖宗多少梦想&articleData.content=\r\n	北京市发展和改革委员会下发《关于大唐青灰岭风光发电示范项目49.7兆瓦工程核准的批复》文件，标志着...&weightDate=&posidList=1&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('8a0590253c3f4cef868be3a5dcd047b2', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:20:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/delete', 'GET', 'id=a626ae20fcd342c0911b935e26825fd7', '');
INSERT INTO `sys_log` VALUES ('8a4da11fbeea4fc8a31b757bff03cd47', '1', '内容管理-内容管理-评论管理-查看', '1', '2015-05-20 22:14:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/comment/', 'GET', 'tabPageId=jerichotabiframe_8&status=2', '');
INSERT INTO `sys_log` VALUES ('8a58e75dcfdf4b98905d41fb622f5485', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:04:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('8b1a23538a164ba1845d19febd344f14', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:20:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8b4d4ede95b643518a3fe0f4ce6c3db0', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-10 17:56:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/assign', 'GET', 'id=6', '');
INSERT INTO `sys_log` VALUES ('8b5855311eeb49c886d773a5f43c3236', '1', '内容管理-内容管理', '2', '2015-06-11 09:54:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8beb665c28d04789b7393a6b16917574', '1', '内容管理-内容管理', '1', '2015-06-12 17:22:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none/', 'GET', 'category.id=7be5ba2e4b164b909e67f6289096fa24', '');
INSERT INTO `sys_log` VALUES ('8bf60318d32b45f6a8ba65e93639f370', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:19:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/form', 'GET', 'id=22', '');
INSERT INTO `sys_log` VALUES ('8c04f732cee742ec85ecd735f79d992c', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-11 10:05:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8c27c2b7852c4886839b4700aabbc353', '1', '我的面板-个人信息-个人信息', '1', '2015-06-18 16:13:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('8c684096a62d440e8e40ef530dc785f8', '1', '在线办公-流程管理-流程管理', '1', '2015-05-21 11:08:07', '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET4.0E; .NET4.0C; Shuame)', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('8c939f6d61844806bbb3bed729d7d8c1', '1', '系统登录', '1', '2015-06-18 16:13:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8dc7f3cc01b04fc395f02a19cc438153', '1', '内容管理-内容管理-内容发布', '2', '2015-06-10 17:53:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('8e62cdfb942c4617a73380199d35d7ca', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 10:02:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8ff14d46da45456bad063f71fefe4a3e', '1', '内容管理-内容管理-内容发布-文章模型', '2', '2015-06-10 17:53:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('8ff720fba8094906bb06341e1eae1de0', '1', '内容管理-内容管理-评论管理-查看', '1', '2015-06-18 14:56:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/comment/', 'POST', 'title=&pageNo=1&pageSize=30&delFlag=2', '');
INSERT INTO `sys_log` VALUES ('900505a2d28246049936d3311c73cfc2', '1', '系统设置-系统设置-字典管理-查看', '1', '2015-05-18 11:17:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/dict/form', 'GET', 'sort=20&description=æµç¨åç±»&type=act_category', '');
INSERT INTO `sys_log` VALUES ('90665e06e2e8445ca16b4c1bed42100c', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 09:07:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3', '');
INSERT INTO `sys_log` VALUES ('90bc1fde736741e5b6622129fa7564dc', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:21:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=7&parentIds=', '');
INSERT INTO `sys_log` VALUES ('90c24d9a51f949d8a09b037d6830b0fe', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-11 10:00:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/office/list', 'GET', 'parentIds=&id=', '');
INSERT INTO `sys_log` VALUES ('90e2f45cddc74bdcb4cab357a05eba00', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-12 08:59:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('90e5a8862047435bac20175f88e752bc', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:07:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'parent.id=1', '');
INSERT INTO `sys_log` VALUES ('90f8234629b2492ba7ed86923a71ae68', '1', '我的面板-个人信息-个人信息', '1', '2015-06-12 17:23:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('915345b6187b4439898ee58a845986c6', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-18 15:00:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/usertorole', 'POST', 'id=5&___t0.6734166439377455=', '');
INSERT INTO `sys_log` VALUES ('915c15e5df9747938e54a20f2f80da35', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-10 17:08:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=thinkgem&loginName=thinkgem', '');
INSERT INTO `sys_log` VALUES ('915c7ddc76274409a82e116ba6d0422a', '1', '代码生成-生成示例-主子表', '1', '2015-05-18 11:07:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/test/testDataMain', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('92242fe0b2a94d82ad22515a05496f90', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:08:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'parent.id=ff8fb2c20e1140bd92e87ba801fa1152', '');
INSERT INTO `sys_log` VALUES ('9232ead0660c4fab8ffef06dfcedb6db', '1', '系统登录', '1', '2015-06-10 16:58:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/tree', 'GET', 'parentId=31', '');
INSERT INTO `sys_log` VALUES ('925cf08eed4f4669a4995c426eefa705', '1', '系统设置-机构用户-用户管理', '1', '2015-06-10 15:50:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('92ad3b18792041a0b180eefb70c38c4d', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:06:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'id=6', '');
INSERT INTO `sys_log` VALUES ('93ca6e23afa149259fb10ab2035d0732', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2015-06-12 17:18:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/save', 'POST', 'module=article&keywords=&sort=50&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=4&id=17&customListView=&office.name=市场部&description=&parent.id=7be5ba2e4b164b909e67f6289096fa24&name=搜索工具&target=&allowComment=1&showModes=2&href=&viewConfig=&parent.name=客户服务', '');
INSERT INTO `sys_log` VALUES ('93d0e704ffaf4c038bebbfab83ff1213', '1', '系统登录', '1', '2015-05-20 17:07:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_12', '');
INSERT INTO `sys_log` VALUES ('94407865d57742fdba3e866b234b38a9', '1', '内容管理-内容管理', '1', '2015-06-12 16:24:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('947b2780245c42e7a9c6b38d2149ded5', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:19:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'parentIds=0,1,7,&id=7', '');
INSERT INTO `sys_log` VALUES ('950476f09e6342789bc0235ce862db9f', '1', '我的面板-个人信息-修改密码', '1', '2015-05-18 11:08:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('959b5e288f0c411991a20bf4da36e804', '1', '系统登录', '1', '2015-06-12 17:11:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('95a267a3189245bdafe8bc447b9ac660', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:20:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/delete', 'GET', 'id=ff8fb2c20e1140bd92e87ba801fa1152', '');
INSERT INTO `sys_log` VALUES ('95a27ad869b3469a8eecc50b682bb921', '1', '代码生成-生成示例-单表', '1', '2015-05-18 11:06:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/test/testData', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('963ecc1e2b124bcba859a33b251bfa6e', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:06:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('96a43f2d7aa24728bcf3b2fe4312b228', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:23:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('96e11439f641426fb36441a0fe597ba1', '1', '在线办公-通知通告-我的通告', '1', '2015-05-21 11:07:43', '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET4.0E; .NET4.0C; Shuame)', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('96e166950a37489fb48e6885fc98aae6', '1', '在线办公-通知通告-通告管理', '1', '2015-06-10 14:57:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('975088fc3d1e49d09c812e6f8e14ee4a', '1', '我的面板-个人信息-个人信息', '1', '2015-05-21 11:07:39', '127.0.0.1', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET4.0E; .NET4.0C; Shuame)', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('977b40560d2f4d809d0c11528ac19c45', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:29:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9783732dbde54a23a8485db6e37aaa79', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2015-06-12 17:15:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/save', 'POST', 'module=article&isAudit=1&sort=10&keywords=&customContentView=&inList=1&inMenu=1&image=&office.id=3&id=2&customListView=&description=&office.name=综合部&name=公司介绍&parent.id=1&target=&allowComment=0&showModes=0&href=&viewConfig=&parent.name=顶级栏目', '');
INSERT INTO `sys_log` VALUES ('97ae45a2451842679b4eba00763c5bef', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-11 10:00:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_15', '');
INSERT INTO `sys_log` VALUES ('989d2abcad82469aba09d76afd9f88a6', '1', '内容管理-内容管理-内容发布-文章模型', '2', '2015-06-11 09:55:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=11', '');
INSERT INTO `sys_log` VALUES ('98d8571490264f97817005b05ebc9998', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:08:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('993fe2b695cc4d14b3899ef68f8eb130', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2015-06-12 17:16:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/form', 'GET', 'id=10', '');
INSERT INTO `sys_log` VALUES ('9945fc3a29b444c181438bc338bd6fcf', '1', '系统登录', '1', '2015-06-10 17:11:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=thinkgem&loginName=a', '');
INSERT INTO `sys_log` VALUES ('994799bf33484052a288bbf1560c0bd0', '1', '内容管理-内容管理-内容发布', '1', '2015-05-18 11:24:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('99b2072d02074c658a182697348a9439', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 09:04:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('99b9f37540f8452db4f1c137c7666913', '1', '内容管理-内容管理-内容发布', '1', '2015-05-20 22:14:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('99fe2be9e9b341fda35b153c17b2ba3e', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:05:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'POST', 'orderBy=&pageNo=1&office.name=公司领导&company.id=&name=&pageSize=30&office.id=2&company.name=&loginName=', '');
INSERT INTO `sys_log` VALUES ('9a398a2e3b85469fa9b4b35d6ad9a91f', '1', '代码生成-代码生成-业务表配置', '1', '2015-06-18 15:06:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('9af9ca131b914755ae05bcabdb027870', '1', '内容管理-内容管理-内容发布', '2', '2015-06-11 09:28:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('9bcb0afd8f1743b5806be888c6229144', '1', '我的面板-个人信息-个人信息', '1', '2015-05-20 17:38:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('9c1f6c475d2146e2a290a2dc5e2c8339', '1', '系统设置-机构用户-用户管理', '1', '2015-06-10 17:19:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_15', '');
INSERT INTO `sys_log` VALUES ('9c85d228e7a840b8ae13c322336f842e', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2015-06-12 17:18:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/form', 'GET', 'id=17', '');
INSERT INTO `sys_log` VALUES ('9cc5b4b453f548debfeb7bc23d9d9451', '1', '系统设置-系统设置-字典管理', '1', '2015-06-10 15:52:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('9ced1b01bed64a04b13716b1a4893fae', '1', '在线办公-个人办公-我的任务', '1', '2015-05-20 16:52:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('9cef90ecb14b480badd5b5299e208c8b', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:06:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9d552e5c48d24f698f62287d078b3a60', '1', '系统设置-系统设置-字典管理-修改', '1', '2015-06-10 15:53:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/save', 'POST', 'id=71&sort=10&description=流程分类一&value=1&label=流程分类一&remarks=&type=act_category', '');
INSERT INTO `sys_log` VALUES ('9d5639b92ae5474a9e90007917297918', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-11 09:58:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=&loginName=zhangmeinv', '');
INSERT INTO `sys_log` VALUES ('9d6dc7cdb24d4b6bbcf29c19f6ed578a', '1', '内容管理-内容管理', '2', '2015-06-11 09:54:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9db283838fb2435fbe3ccc260f4c604a', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-12 16:43:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('9e1ba4a1980b46d7921917fcec02e027', '1', '系统设置-系统设置-角色管理', '1', '2015-06-18 14:59:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_32', '');
INSERT INTO `sys_log` VALUES ('9e63c1d3a43441b58c036bf6dbc2259e', '1', '系统登录', '1', '2015-05-18 11:01:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9ea46c2b09934a19813829279fa156dc', '1', '系统设置-机构用户-区域管理', '1', '2015-06-11 10:00:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('9ea51fbbb40f491e9ca6290fd4e62888', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:29:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', 'office.name=æ¹åçæ»å¬å¸&office.id=1', '');
INSERT INTO `sys_log` VALUES ('9ea65d21fd394dc68b614d1bcaf96785', '1', '在线办公-个人办公-审批测试', '1', '2015-05-20 22:14:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/testAudit', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('9eea338e59874f40aa22d59cf5ed9134', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:02:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9f48a59f2e4e49f78d400df749ed7125', '1', '代码生成-代码生成-业务表配置', '1', '2015-06-18 15:05:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('9f6bb26b6c584e49b0b81ff4e1f2e23a', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 11:09:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_14', '');
INSERT INTO `sys_log` VALUES ('9f893bd948e842559e635ce2d8b346f7', '1', '系统设置-机构用户-用户管理', '1', '2015-06-12 08:59:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('a05e0e5e423c4583b81f82f3decf1310', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 17:14:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=新能源,背景&weight=0&category.id=3&customContentView=&category.name=网站简介&link=&articleData.copyfrom=来源&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/c2cec3fdfc039245363f3f4e8594a4c27c1e25e...&articleData.allowComment=1&id=2&articleData.relation=1,2,3,&title=北京我们的祖国首都&color=red&description=我爱北京，我爱北京天安门，北京是五千年中国文化的汇聚地，凝聚了华夏祖宗多少梦想&articleData.content=\r\n	   北京市发展和改革委员会下发《关于大唐青灰岭风光发电示范项目49.7兆瓦工程核准的批复》文件，标...&weightDate=&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('a1a8bc13ccd7426f987ba4d53a61c0e8', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:09:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=&parent.id=ff8fb2c20e1140bd92e87ba801fa1152&name=泰州市&remarks=&code=12000302&type=1&parent.name=江苏省', '');
INSERT INTO `sys_log` VALUES ('a1c45bb9a22e4d519ea7859c09d0fd45', '1', '系统设置-系统设置-菜单管理-查看', '1', '2015-06-10 16:23:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/form', 'GET', 'id=29', '');
INSERT INTO `sys_log` VALUES ('a225088087224674875196f39df17f38', '1', '代码生成-生成示例-主子表', '1', '2015-06-18 15:03:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/test/testDataMain', 'GET', 'tabPageId=jerichotabiframe_46', '');
INSERT INTO `sys_log` VALUES ('a268f717b67f4c28977f2312d831e483', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:19:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'parentIds=0,1,7,&id=7', '');
INSERT INTO `sys_log` VALUES ('a29c86e756ca469aa34059dc1ee33e0d', '1', '系统设置-机构用户-用户管理', '1', '2015-05-20 22:16:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_14', '');
INSERT INTO `sys_log` VALUES ('a2b7b36cbd5b4b71a0879bc58fba8cc0', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 09:03:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('a2d1ca1277dd460a8e72e2747595218a', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 11:05:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('a316b200e89147d78e3cca88360b7e5f', '1', '系统设置-日志查询-日志查询', '2', '2015-06-10 17:53:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/log', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('a33237bf8ffb41578f0bf030923d4978', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 09:04:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3', '');
INSERT INTO `sys_log` VALUES ('a351d66d7d164df1a086fa82552cecdf', '1', '系统设置-机构用户-机构管理', '1', '2015-06-11 10:00:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('a375735a983c4f68961b9e9e216f2d00', '1', '系统登录', '1', '2015-05-20 22:13:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a384edb68df441e7b9760f835be3da6d', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 15:15:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a3ab16c13cb34df79ed926155b23c04a', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:00:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('a3b96f633df6492580b95fd7061f1446', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 15:01:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a3cc959eca2744f99f947db0264e981e', '1', '我的面板-个人信息-个人信息', '1', '2015-06-18 15:05:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('a3e77285576345b49cb9cd8969835a09', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2015-06-12 17:17:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a4b5c2f5fde943a49505d0df5e4183c0', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:11:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a51329730fd4440bab9de1e27e3e4052', '1', '我的面板-个人信息-修改密码', '1', '2015-06-12 16:23:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/modifyPwd', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('a5663b98d91a4993b59c99436acb8c85', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:32:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'POST', 'phone=13977892345&email=rongrong2773@163.com&name=系统管理员&remarks=最高管理员&photo=/MyJeeSite/userfiles/1/images/photo/2015/06/6135d612jw1ea03gyxzsdj20dc0hsjso.jpg&mobile=13977892345', '');
INSERT INTO `sys_log` VALUES ('a56d22341230436093ae8a1cc9df7620', '1', '系统设置-系统设置-菜单管理', '1', '2015-05-20 22:16:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_15', '');
INSERT INTO `sys_log` VALUES ('a61b2d1b35034850b8bd6155851a2dbb', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 16:48:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=新能源,背景&weight=0&customContentView=&category.id=3&category.name=网站简介&articleData.copyfrom=来源&link=&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/c2cec3fdfc039245363f3f4e8594a4c27c1e25e...&articleData.allowComment=1&id=2&articleData.relation=1,2,3,&title=北京我们的祖国首都&color=red&articleData.content=\r\n	北京市发展和改革委员会下发《关于大唐青灰岭风光发电示范项目49.7兆瓦工程核准的批复》文件，标志着...&description=我爱北京，我爱北京天安门，北京是五千年中国文化的汇聚地，凝聚了华夏祖宗多少梦想&weightDate=&posidList=1&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('a649d4f41c36449cac3a55befd38700b', '1', '内容管理-内容管理', '1', '2015-06-10 17:07:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a67dfc094d8e47178a1806ec5fa36d1c', '1', '系统设置-系统设置-菜单管理-修改', '1', '2015-06-10 17:01:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/delete', 'GET', 'id=f3063409150e41508cf55a702aef5dae', '');
INSERT INTO `sys_log` VALUES ('a6a42400925b4233b586087121eb8f0b', '1', '内容管理-栏目设置-站点设置', '1', '2015-06-12 09:47:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('a6f36285f9b84ca79b3dc2e1c8d95426', '1', '系统设置-机构用户-用户管理', '1', '2015-06-10 15:47:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_23', '');
INSERT INTO `sys_log` VALUES ('a77ff77ff4904e278337b8e34695241e', '1', '系统设置-机构用户-用户管理', '1', '2015-05-18 11:02:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_8', '');
INSERT INTO `sys_log` VALUES ('a846f6f17a0b48eaa0fa61f375ccabb7', '1', '在线办公-流程管理-模型管理', '1', '2015-05-18 11:12:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_22', '');
INSERT INTO `sys_log` VALUES ('a84a1c7fc7cf4dcc85f10e20b5f4d681', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 16:22:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('a977c1ed12cf474991cebbabad69ea3c', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:21:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=', '');
INSERT INTO `sys_log` VALUES ('a9f4a34343144636b774278c4c4577c4', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-18 15:01:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/users', 'GET', 'officeId=7', '');
INSERT INTO `sys_log` VALUES ('aa6e56eabfe04e9289e7178f7a429b0c', '1', '在线办公-个人办公-审批测试', '1', '2015-05-20 16:53:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/oa/testAudit', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('aa92dbf2afa34a3cb23cf1e3a2ff09af', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:08:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aaf2fe9071b2452b8569df99e50bf2ea', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:47:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_24', '');
INSERT INTO `sys_log` VALUES ('ab3e5bae5ba44b58b49ef0267429d0a0', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:41:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=10', '');
INSERT INTO `sys_log` VALUES ('abe7bc47a27243c5900e963420fefe09', '1', '系统登录', '1', '2015-06-10 15:50:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ac0ec816ab9b41ccb5f6a141d2a9929e', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-10 16:20:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/assign', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('ac3c3e65426f43859eff71618a516f5d', '1', '系统设置-机构用户-用户管理', '1', '2015-05-18 11:15:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_27', '');
INSERT INTO `sys_log` VALUES ('ac3d680704e9452596a50727187fe66a', '1', '在线办公-个人办公-我的任务', '1', '2015-05-20 16:55:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('ac577c81f6c745c8a94eb94f0dc0165e', '1', '系统登录', '1', '2015-05-18 11:11:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/testAudit', 'GET', 'tabPageId=jerichotabiframe_20', '');
INSERT INTO `sys_log` VALUES ('acc0b93a28a343ae89bd0f87013df81d', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-10 17:11:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=thinkgem&loginName=a', '');
INSERT INTO `sys_log` VALUES ('ace46c191e674af298042ac18c6ca31f', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:56:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/form', 'GET', 'id=4', '');
INSERT INTO `sys_log` VALUES ('ad05449556ae4781b67107f96fd25599', '1', '内容管理-栏目设置-站点设置-查看', '1', '2015-05-20 22:15:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('ad39eff708534535ba8b776e86a98f92', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 11:01:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('ad5c77d5a85e45eea68c41af78bfed85', '1', '系统设置-机构用户-机构管理', '1', '2015-06-10 15:50:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('adbd62da3f2e49dd84d9fa2b96722699', '1', '内容管理-内容管理-内容发布-链接模型', '1', '2015-06-12 17:23:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/link/', 'GET', 'category.id=18', '');
INSERT INTO `sys_log` VALUES ('aea5e77fb66e4b2fa47c93e67669f077', '1', '在线办公-通知通告-我的通告', '1', '2015-05-18 17:26:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('afa756f211a94013b7cf75302c370a20', '1', '内容管理-内容管理-评论管理-查看', '1', '2015-06-12 16:58:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/comment/', 'GET', 'tabPageId=jerichotabiframe_13&status=2', '');
INSERT INTO `sys_log` VALUES ('aff834d681ab4dfa84c9ecda656d2a16', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:21:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('affc90d0920544449f84c11892a1a4fd', '1', '在线办公-流程管理-模型管理', '1', '2015-06-18 14:54:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('b032907967e34ae2893d1466d8348a16', '1', '系统设置-日志查询-日志查询', '1', '2015-06-18 14:59:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/log', 'GET', 'tabPageId=jerichotabiframe_33', '');
INSERT INTO `sys_log` VALUES ('b04aa5ef12704b28a527dc750248608f', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 17:22:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_17', '');
INSERT INTO `sys_log` VALUES ('b0e88fcd546f432ab24f48ef632e3ee8', '1', '我的面板-个人信息-个人信息', '1', '2015-06-18 16:08:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('b17d76b19dd7495a9255b6ec2d66746e', '1', '系统设置-系统设置-菜单管理-查看', '1', '2015-05-18 11:22:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/menu/form', 'GET', 'parent.id=10', '');
INSERT INTO `sys_log` VALUES ('b192d424a4d24c9ca8fa1aa79d62ed20', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2015-06-12 17:16:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/form', 'GET', 'id=6', '');
INSERT INTO `sys_log` VALUES ('b2aba426703c4e21a7575f1364110d71', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 15:48:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b3233541185845868b1c26dffecd74ba', '1', '代码生成-代码生成-业务表配置', '1', '2015-05-20 17:38:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('b38626696e294e3a896f788a998a427f', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 15:16:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('b3db2c265d1b4ba28c40fd928b75bcef', '1', '系统登录', '1', '2015-06-10 14:29:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b4ba904be0a5425aaefc62b671feb204', '1', '我的面板-个人信息-修改密码', '1', '2015-06-10 14:30:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b4beb52eb01f4eb4bf5d83ab92e20390', '1', '系统设置-系统设置-角色管理', '1', '2015-06-11 10:00:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_12', '');
INSERT INTO `sys_log` VALUES ('b4cc172ab00e4a9d847bfcee50be2f0c', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 09:03:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=关键字1,关键字2&weight=0&customContentView=&category.id=3&category.name=网站简介&articleData.copyfrom=来源&link=&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/20120223391.jpg&articleData.allowComment=1&id=1&articleData.relation=&title=公司历史文化&color=green&articleData.content=\r\n	\r\n		\r\n			\r\n				公司是指一般依法设立的，有独立的法人财产，以营利为目的的企业法人。根据现行中国...&description=&weightDate=&posidList=1&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('b5146376ecb841689dc75e6e348813e9', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:15:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('b65860afe2e6456ca0dbaa928ac8b7d6', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 10:00:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b687f72fce4046ed86f55417094ce800', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:21:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('b6ba9c7b15fb44778b133ce5344bc6db', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-10 17:13:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('b6cfa08969fd4ce49f2886fa6a2d4523', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:05:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b6e198c1086b4fc586bc2c18725f4705', '1', '代码生成-代码生成-业务表配置', '1', '2015-05-18 11:05:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('b7161e4b99bf46bcbedc2dc5c7c15a30', '1', '在线办公-通知通告-通告管理', '1', '2015-06-18 14:54:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('b770ab80c4a8443782579f1d493cdfd2', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:20:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/delete', 'GET', 'id=8690a33107684caa9aab0e25f3570794', '');
INSERT INTO `sys_log` VALUES ('b77292efda3b4f66afb4906856ad0d2e', '1', '代码生成-代码生成-业务表配置', '1', '2015-06-10 17:19:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_14', '');
INSERT INTO `sys_log` VALUES ('b78fedb049194a8299006fc63455b689', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 10:04:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b7c0dd9e1227484ebde73f885a67c759', '1', '系统设置-机构用户-用户管理', '1', '2015-05-18 11:24:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('b7c41c2f9f6a4d96ab4cb9218ac0b936', '1', '在线办公-个人办公-我的任务', '1', '2015-05-18 11:01:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('b7df190f9e074899ba668e204c0b53f8', '1', '内容管理-内容管理', '1', '2015-06-12 09:09:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b7df4c0689254738b76106bf6a2f41d6', '1', '系统登录', '1', '2015-06-18 14:51:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b8488240fce44e9889d8f1cb8da6ca03', '1', '内容管理-内容管理', '1', '2015-06-11 09:23:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b8511ff3270a414f9f6d262957af65e0', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-05-18 11:16:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('b8b01a67474842498560f919beecd18e', '1', '在线办公-个人办公-我的任务', '1', '2015-06-18 14:54:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('b8d3c54c253e4926a9e15e570ba47541', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:08:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('b8e45d6929ec48b8a4ac0bdf316112a6', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:16:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'POST', 'orderBy=&pageNo=1&office.name=公司领导&company.id=&name=&pageSize=30&office.id=2&company.name=&loginName=', '');
INSERT INTO `sys_log` VALUES ('b8f5fb2ec96e4089b99df9e72968026f', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 09:00:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('b94f24f3cf4d4341835012f4fa936b7e', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 17:00:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('b96fffa36f9c48369c6a2acaaf45c72e', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-10 16:22:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/save', 'POST', 'dataScope=2&officeIds=&remarks=&office.id=2&oldName=公司管理员1&id=2&menuIds=1,27,28,29,30,71,56,57,58,59,62,63,64,65,66,69,70,72,31,40,41,42,43,44,45,46,47,48,49,50,51,52,53...&useable=1&office.name=公司领导&name=公司管理员&roleType=assignment&oldEnname=hr&enname=hr&sysData=1', '');
INSERT INTO `sys_log` VALUES ('b9807148a0ec43e89f004b22e1ae3cfd', '1', '内容管理-内容管理-内容发布', '1', '2015-06-18 14:57:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_23', '');
INSERT INTO `sys_log` VALUES ('b990cb4be9ff4dfc8717736c60714341', '1', '内容管理-内容管理-内容发布', '2', '2015-06-11 09:54:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('b9b04a085fb440d38bd108f38c8bc347', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:50:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('ba2158681c4d4e2d9da1654909f4ab28', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:29:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('ba91d781a16440ec8cf76084c5ab271f', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 17:21:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=新能源,背景&weight=0&category.id=3&customContentView=&category.name=网站简介&link=&articleData.copyfrom=来源&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/c2cec3fdfc039245363f3f4e8594a4c27c1e25e...&articleData.allowComment=1&id=2&articleData.relation=1,2,3,&title=北京我们的祖国首都&color=red&description=我爱北京，我爱北京天安门，北京是五千年中国文化的汇聚地，凝聚了华夏祖宗多少梦想&articleData.content=\r\n	   北京市发展和改革委员会下发《关于大唐青灰岭风光发电示范项目49.7兆瓦工程核准的批复》文件，标...&weightDate=&posidList=1&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('bac5db9f9477482fa3646522e787bc9b', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:08:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=11', '');
INSERT INTO `sys_log` VALUES ('bac7fc56b74642f3b0fc5af6e9c402be', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:20:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bae9c600ea9a49208f37df67882dcde5', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:38:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('bb5d1a2644704fc9802539e87536de2a', '1', '内容管理-栏目设置-站点设置', '1', '2015-06-12 09:42:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('bb78738068044bcba34da989b3f9e824', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-12 17:18:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bb8b19f687d34a2693e8050788f96b10', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-05-18 17:24:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/article/findByIds', 'GET', 'ids=1,2,3', '');
INSERT INTO `sys_log` VALUES ('bc2ab8a0fae0474e80fa44b610cd479a', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:06:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=4&parent.id=3&name=开福区&remarks=&code=110102&type=4&parent.name=长沙市', '');
INSERT INTO `sys_log` VALUES ('bcd93739d2584e15acb060175a5a4a98', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 16:48:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('bce7640ede14418992df037067c9e395', '1', '系统设置-系统设置-菜单管理-查看', '1', '2015-06-10 15:11:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/form', 'GET', 'parent.id=29', '');
INSERT INTO `sys_log` VALUES ('bd1b2f74edc94fd3889e13cda45b41de', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2015-06-12 17:18:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/save', 'POST', 'module=article&keywords=&sort=50&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=4&id=14&customListView=&office.name=市场部&description=&parent.id=7be5ba2e4b164b909e67f6289096fa24&name=网络优化&target=&allowComment=1&showModes=0&href=&viewConfig=&parent.name=客户服务', '');
INSERT INTO `sys_log` VALUES ('bd60876ce5444e87b48e18a41c59be9e', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 17:00:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('bda4f0b1ecc643639274912adc1ff9cf', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-18 15:00:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/assign', 'GET', 'id=5', '');
INSERT INTO `sys_log` VALUES ('be0ef728d86b4e918d3cbf1aad7b5e98', '1', '代码生成-代码生成-生成方案配置', '1', '2015-05-20 17:38:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genScheme', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('bed0ce49285747479530ee53d5c3dbf0', '1', '内容管理-内容管理-评论管理-查看', '1', '2015-06-10 17:16:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/comment/', 'GET', 'tabPageId=jerichotabiframe_7&status=2', '');
INSERT INTO `sys_log` VALUES ('bf1b9a6e654b4f36bfc470426cf8c6ed', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 16:50:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3,', '');
INSERT INTO `sys_log` VALUES ('bf782f071a0f4c9bae312d6da2eab054', '1', '在线办公-个人办公-我的任务', '1', '2015-06-12 16:58:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('bf9e9442dac44edf8dea106a849faa49', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 17:00:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bfa8c5c2a5f046e2901e7543ea124800', '1', '我的面板-个人信息-个人信息', '1', '2015-05-20 22:13:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('bfcc76479e54442eb04a081ee207b803', '1', '系统设置-系统设置-字典管理', '1', '2015-05-18 11:17:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_32', '');
INSERT INTO `sys_log` VALUES ('bfecf65c43a14b4cad9ea8754f6f5cac', '1', '在线办公-个人办公-审批测试', '1', '2015-05-18 11:24:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/oa/testAudit', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c0080d4396e643ed95049f6ff31f4479', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:59:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/list', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('c1541aa57dde417cb92b0687cf54eff4', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-10 17:55:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/assign', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('c1796cdd370b42f1a0b354c4159ff073', '1', '系统设置-系统设置-角色管理', '1', '2015-06-18 15:01:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c1d78d7e60b24a0fbf6d5d2f3ac3a9aa', '1', '系统登录', '1', '2015-06-10 17:44:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/tree', 'GET', 'parentId=2', '');
INSERT INTO `sys_log` VALUES ('c1f48990f6b64589bebee37de5a047e0', '1', '内容管理-统计分析-信息量统计', '1', '2015-05-18 11:01:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('c2081dd076444509bafae2167023cde2', '1', '我的面板-个人信息-个人信息', '1', '2015-06-12 16:23:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('c26538157cef4bfaa7cce3c35542be74', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:22:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=2', '');
INSERT INTO `sys_log` VALUES ('c2d94331ad2d4dbaa045e1603e4ac80a', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:15:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c332c04daa0a45918cdf1d888427312f', '1', '系统设置-系统设置-字典管理-查看', '1', '2015-06-10 15:52:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/form', 'GET', 'id=71', '');
INSERT INTO `sys_log` VALUES ('c3675071bc4b4616a960adacf3ca11f8', '1', '系统设置-机构用户-用户管理', '1', '2015-06-11 10:00:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_10', '');
INSERT INTO `sys_log` VALUES ('c371ab22a7eb4249877f89ca2e228427', '1', '系统登录', '1', '2015-05-18 11:22:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_35', '');
INSERT INTO `sys_log` VALUES ('c3bea4d1211f4a6ebc66a96a8dcc382e', '1', '我的面板-个人信息-个人信息', '1', '2015-05-21 14:17:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('c4894d06cfe74f7f860406a922cecf5b', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:47:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_21', '');
INSERT INTO `sys_log` VALUES ('c55514f6d38748efbbb6b815bee8db2c', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:04:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('c5aec173d5f3411e8734c10cc0c1350a', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:15:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'POST', 'phone=13977892345&email=rongrong2773@163.com&name=系统管理员&remarks=最高管理员&photo=/MyJeeSite/userfiles/1/images/photo/2015/06/6135d612jw1ea03gyxzsdj20dc0hsjso.jpg&mobile=13977892345', '');
INSERT INTO `sys_log` VALUES ('c636b620912d41c981715c9513531260', '1', '系统设置-系统设置-菜单管理', '2', '2015-06-10 17:53:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('c734b0fe3c3a4a959b89f9f6b6f1bb30', '1', '系统登录', '1', '2015-06-10 17:55:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/tree', 'GET', 'parentId=62', '');
INSERT INTO `sys_log` VALUES ('c8394495328441dea647f7cc7116c1d0', '1', '系统登录', '1', '2015-06-11 10:04:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c9517e0ec47e4abb8b068c762bcc792a', '1', '内容管理-内容管理-评论管理-查看', '1', '2015-06-18 14:56:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/comment/', 'GET', 'tabPageId=jerichotabiframe_14&status=2', '');
INSERT INTO `sys_log` VALUES ('c970966ca639434282fc70b756035e01', '1', '系统登录', '1', '2015-05-21 14:17:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ca7062f890d14c39b11a9ab9e91ce407', '1', '内容管理-统计分析-信息量统计', '1', '2015-06-18 14:57:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_22', '');
INSERT INTO `sys_log` VALUES ('ca77b25a3cb7459f80443db7a045f924', '1', '内容管理-栏目设置-站点设置-查看', '1', '2015-06-12 16:35:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('ca8620f65507481ca5055925ebed8baf', '1', '内容管理-统计分析-信息量统计', '1', '2015-06-18 14:56:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('cafb034cc15741938c8b8e67f68e60f8', '1', '内容管理-栏目设置-站点设置', '1', '2015-05-20 22:16:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cb1fae2472ec48d9bbcd83f3e00da649', '1', '代码生成-代码生成-业务表配置', '1', '2015-06-18 15:02:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_41', '');
INSERT INTO `sys_log` VALUES ('cbc05b10c20c4838b75f8b15bf2975e8', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:20:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/delete', 'GET', 'id=2b241fd8b7b74bc391f20f27054cfc85', '');
INSERT INTO `sys_log` VALUES ('cc252dfd705f495ca3e8739775943054', '1', '代码生成-代码生成-业务表配置', '1', '2015-05-18 11:06:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('ccaa59a6766445c2948e9ab7098bc83a', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:03:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3', '');
INSERT INTO `sys_log` VALUES ('ccfbf9642682434980dcc697f7cbaa74', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-11 10:05:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=1&parentIds=0,1,', '');
INSERT INTO `sys_log` VALUES ('ccff8773a56e4b5497c9549a0c135f99', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:10:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=&parent.id=2&name=岳阳市&remarks=&code=110002&type=1&parent.name=湖南省', '');
INSERT INTO `sys_log` VALUES ('cd52083813ab451d9a05564b77efb6fc', '1', '内容管理-内容管理', '1', '2015-06-12 09:42:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none/', 'GET', 'category.id=27', '');
INSERT INTO `sys_log` VALUES ('cd66c8c4fcfc4b50800eefebadaa9bf2', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:24:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cdec1d08d92344738b5e07f0fd2549c6', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-12 17:15:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ce241b24d4f946b7960c875d3bf3d517', '1', '我的面板-个人信息-个人信息', '1', '2015-06-12 17:23:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ce6528559cbe4715912c56367ca4c6bb', '1', '内容管理-栏目设置-站点设置', '1', '2015-05-20 22:15:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('ce9dc69adb6649bfbcd64cd27fb45ef0', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:24:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('cea8c3d4a96c4f8cb0add0766390ddc3', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 16:20:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/users', 'GET', 'officeId=7', '');
INSERT INTO `sys_log` VALUES ('cf05e874ce1443f1a35d120aad95483b', '1', '内容管理-内容管理-公共留言-查看', '1', '2015-06-18 14:56:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/guestbook/', 'GET', 'tabPageId=jerichotabiframe_15&status=2', '');
INSERT INTO `sys_log` VALUES ('cfcbfdc90314432991a52e8ee625291d', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-12 17:18:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d065f65695e24537962f458956d2b4e4', '1', '系统登录', '1', '2015-05-21 15:10:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d0a26c61e304499493eb10696afe6688', '1', '内容管理-栏目设置-站点设置', '1', '2015-05-20 22:14:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'tabPageId=jerichotabiframe_12', '');
INSERT INTO `sys_log` VALUES ('d0a544910962409bb45b71dd4b5b6bb7', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 17:21:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=关键字1,关键字2&weight=0&customContentView=&category.id=3&category.name=网站简介&articleData.copyfrom=来源&link=&_posidList=on&image=/MyJeeSite/userfiles/1/_thumbs/images/cms/article/2015/06/20120223391.jpg&articleData.allowComment=1&id=1&articleData.relation=&title=公司历史文化&color=green&articleData.content=\r\n	\r\n		\r\n			\r\n				公司是指一般依法设立的，有独立的法人财产，以营利为目的的企业法人。根据现行中国...&description=&weightDate=&posidList=1&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('d10fd97778c94b278ba363c1ee5ad737', '1', '在线办公-流程管理-流程管理', '1', '2015-05-18 11:11:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_21', '');
INSERT INTO `sys_log` VALUES ('d11683e78d1649f28318de39a68783ef', '1', '系统设置-机构用户-用户管理', '1', '2015-05-18 17:26:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('d166527f964a428f94d7addcfda55f74', '1', '系统设置-机构用户-机构管理-修改', '1', '2015-06-10 15:18:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/save', 'POST', 'primaryPerson.id=&phone=&fax=&area.id=2&office.primaryPerson.name=&remarks=&code=100000&type=1&master=&id=1&area.name=湖南省&useable=1&office.deputyPerson.name=&address=&email=&name=湖南省总公司&parent.id=&zipCode=&grade=1&parent.name=&deputyPerson.id=', '');
INSERT INTO `sys_log` VALUES ('d1ab883a8c344c239f294b5ef556a1e2', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:06:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=5&parent.id=3&name=天心区&remarks=&code=110104&type=4&parent.name=长沙市', '');
INSERT INTO `sys_log` VALUES ('d23573808be747d297d9cce447cf833d', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:01:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('d24d2d13bd214448afb887179e859b3f', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-12 17:18:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d28a3a0b6e1f4c20b2811f54bfa5ff8c', '1', '内容管理-内容管理', '1', '2015-05-18 11:24:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d2a1acf0793f48759aa8b71bd2535c6d', '1', '内容管理-内容管理', '1', '2015-06-18 14:57:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d2d38a3ff6bf4d0284dbe5865efffa32', '1', '在线办公-流程管理-模型管理', '1', '2015-05-20 17:09:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_13', '');
INSERT INTO `sys_log` VALUES ('d368aa967baf4479a8b6b9055df02370', '1', '我的面板-个人信息-个人信息', '2', '2015-06-10 17:52:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('d3776bc08f3345bd958ef5ab30782e5a', '1', '内容管理-栏目设置-栏目管理', '1', '2015-06-18 14:56:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', 'tabPageId=jerichotabiframe_17', '');
INSERT INTO `sys_log` VALUES ('d39c316de9d0440294662ba8f333ac80', '1', '内容管理-栏目设置-站点设置', '1', '2015-06-12 16:35:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('d3b1321ee18d444f831d9d77805cf7f2', '1', '内容管理-内容管理-内容发布', '1', '2015-05-18 11:01:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('d3e86185b54848999e897cace91d92ca', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-18 15:00:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/users', 'GET', 'officeId=1', '');
INSERT INTO `sys_log` VALUES ('d458ca887ce64c90bfece45feafa002a', '1', '内容管理-统计分析-信息量统计', '1', '2015-06-10 17:16:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/stats/article', 'GET', 'tabPageId=jerichotabiframe_9', '');
INSERT INTO `sys_log` VALUES ('d46d7b56123242d7983d908e856cab51', '1', '在线办公-流程管理-流程管理', '1', '2015-06-18 16:08:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('d47484b035cc45c19fbefde847f942c3', '1', '我的面板-个人信息-个人信息', '1', '2015-06-12 09:09:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('d4f7aa9a22ae4497a2907dfa71cf0236', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:30:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('d5023e34e7004ec58e342df337b9839e', '1', '内容管理-栏目设置-站点设置-查看', '1', '2015-06-12 09:42:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('d5d168dfd7ee4ac2b3a50cff2c9eb542', '1', '在线办公-个人办公-我的任务', '1', '2015-05-21 15:11:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/task/todo/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('d62d877a7f61408a8164febbafdfa91b', '1', '系统设置-机构用户-用户管理', '1', '2015-06-10 17:00:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('d639d6cba20a4d8ba02aaa553f2a2790', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-18 14:58:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d69f1ae72e68426c9e486cc4dc499b86', '1', '系统设置-系统设置-字典管理', '1', '2015-06-18 15:02:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'POST', 'pageNo=1&description=&pageSize=30&type=theme', '');
INSERT INTO `sys_log` VALUES ('d6cc8062a2e04a85b8fe60408df4b162', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:14:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3,', '');
INSERT INTO `sys_log` VALUES ('d75b7f9f46ab4e00b1f993642612d1b8', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:21:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('d7afcb8a9cb64bc9ba3ef51f30c086e9', '1', '系统登录', '1', '2015-06-10 17:37:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d83af24e0a074a0692b57ede5ea5debb', '1', '内容管理-内容管理', '1', '2015-05-18 11:05:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d83bec092b0e489bafa9b405de896f85', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:24:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d89a9b4b6dbf4075a5c45f6c0caa5431', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 17:11:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3,', '');
INSERT INTO `sys_log` VALUES ('d8a29dd13ed04844b80434f48bcfeb57', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 16:21:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('d8e52d889e354f5e8345f2f5b85514bc', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 17:01:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d9a06c359cde4f9aa70b490b91c40673', '1', '系统登录', '1', '2015-06-11 10:02:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d9c5934fa73740218d116d18cae9f46a', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-05-18 17:24:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/article/form', 'GET', 'id=1&category.id=3&category.name=ç½ç«ç®ä»', '');
INSERT INTO `sys_log` VALUES ('d9e963bac4264c88acedf6ecc4a6457f', '1', '内容管理-内容管理-内容发布-文章模型-修改', '1', '2015-06-12 09:06:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/save', 'POST', 'keywords=新能源,背景&weight=0&customContentView=&category.id=3&category.name=网站简介&articleData.copyfrom=来源&link=&_posidList=on&image=&articleData.allowComment=1&id=2&articleData.relation=1,2,3,&title=北京首个风光示范项目落户新能源&color=red&articleData.content=\r\n	北京市发展和改革委员会下发《关于大唐青灰岭风光发电示范项目49.7兆瓦工程核准的批复》文件，标志着...&description=北京首个风光示范项目落户新能源&weightDate=&createDate=2013-05-27 08:00:00&viewConfig=&delFlag=0', '');
INSERT INTO `sys_log` VALUES ('d9e96582095d4618a9ab1c913f0f8084', '1', '系统设置-系统设置-角色管理', '1', '2015-05-18 11:16:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_31', '');
INSERT INTO `sys_log` VALUES ('da0fb3e0542f41e1ad5d6b14f73f5b8c', '1', '我的面板-个人信息-个人信息', '1', '2015-05-21 15:10:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('db59317980c04f03a20efbfda2d87e5b', '1', '内容管理-内容管理-内容发布', '1', '2015-06-12 09:42:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('dc0019cbd0394d68a06266a7efaad4e1', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:06:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('dc34dee21df54e738cae4222fee0b97e', '1', '系统设置-系统设置-字典管理', '1', '2015-06-18 15:01:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dc644005b87b445b85e7972856405b42', '1', '内容管理-内容管理-内容发布-文章模型-查看', '2', '2015-06-11 09:54:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/findByIds', 'GET', 'ids=1,2,3', '');
INSERT INTO `sys_log` VALUES ('dc9a89aac4a94b1fab0168c62725ae96', '1', '内容管理-栏目设置-栏目管理-修改', '1', '2015-06-12 17:18:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/save', 'POST', 'module=&isAudit=0&sort=30&keywords=&customContentView=&inList=1&inMenu=0&image=&office.id=1&id=&customListView=&description=&office.name=湖南省总公司&name=客户服务&parent.id=1&target=&allowComment=0&showModes=0&href=&viewConfig=&parent.name=顶级栏目', '');
INSERT INTO `sys_log` VALUES ('dcdeaa44659845e3b8e172ad75ff6ce7', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 17:12:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('dde1c21de145408c93a6857844023782', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-11 10:07:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=admin&loginName=admin', '');
INSERT INTO `sys_log` VALUES ('de40856880b74f88901d1d58f47cf974', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:05:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=2&parent.id=1&name=湖南省&remarks=湖南省毛泽东的故乡&code=110000&type=2&parent.name=中国', '');
INSERT INTO `sys_log` VALUES ('de7594eca57c44e0be8dce83e1b4e579', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2015-06-12 17:15:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('de7cce8137c5431399878a9c7c490467', '1', '系统设置-机构用户-区域管理', '1', '2015-06-11 10:04:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('deacb15b0a71445490bfbbd5cd0a1abe', '1', '内容管理-内容管理-内容发布', '1', '2015-05-18 11:13:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_25', '');
INSERT INTO `sys_log` VALUES ('df2fde57efec4b1a90ec4b779f9c3752', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-10 15:10:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'id=&parent.id=ff8fb2c20e1140bd92e87ba801fa1152&name=苏州市&remarks=&code=12000303&type=1&parent.name=江苏省', '');
INSERT INTO `sys_log` VALUES ('df61a57027d54f4e9bb00d61713c33eb', '1', '在线办公-通知通告-我的通告', '1', '2015-06-10 17:04:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('df715d8ae2334238954d2fdf82a2d7e1', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:23:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=6', '');
INSERT INTO `sys_log` VALUES ('e0a16a89a624405c8267b83fb8584741', '1', '代码生成-代码生成-生成方案配置', '1', '2015-06-18 15:05:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genScheme', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('e0a5f3521c3e41bf97239e55446c8ac6', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-11 10:02:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e0c84b5fbf9e4549837df6caf30a35ff', '1', '系统登录', '1', '2015-06-12 16:35:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/tree', 'GET', 'parentId=2', '');
INSERT INTO `sys_log` VALUES ('e0d96e433bdb4fa5a83c5aeca2db6260', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 15:47:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_25', '');
INSERT INTO `sys_log` VALUES ('e0e20a14140e4683977e7a9a02a08d15', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-11 09:56:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/save', 'POST', 'phone=13233333333&no=0004&oldLoginName=sd_scb&newPassword=&roleIdList=3&remarks=&loginFlag=1&photo=&office.id=4&userType=&company.name=湖南省总公司&confirmNewPassword=&id=4&_roleIdList=on&email=&office.name=市场部&name=市场部一&company.id=1&loginName=sd_scb&mobile=', '');
INSERT INTO `sys_log` VALUES ('e1102324d82e49a4b8b7ca489be4e3b7', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-11 09:59:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/office/list', 'GET', 'parentIds=&id=', '');
INSERT INTO `sys_log` VALUES ('e232eef9f9ed4a6f839bebcac7e5c26e', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 17:26:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e2825955b8984ad8bf22297d14e56355', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-05-18 11:14:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e2f76cceadd341b09868f765632aec76', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-11 09:59:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/save', 'POST', 'phone=&no=999&oldLoginName=&newPassword=&roleIdList=5&remarks=&loginFlag=1&photo=/MyJeeSite/userfiles/1/images/photo/2015/06/2107277060_853282722.jpg&office.id=13&userType=3&company.name=开福区分公司&confirmNewPassword=&id=&_roleIdList=on&email=&office.name=公司领导&name=张美女&company.id=12&loginName=zhangmeinv&mobile=', '');
INSERT INTO `sys_log` VALUES ('e3b5f872462f4f37a633ce78c24896a4', '1', '系统设置-机构用户-区域管理-修改', '1', '2015-06-11 10:06:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/save', 'POST', 'remarks=说的冯绍峰&code=1111&type=1&id=&parent.id=3&name=测试区域&parent.name=长沙市', '');
INSERT INTO `sys_log` VALUES ('e3e02900b2e4402b884b2924e93bf428', '1', '系统设置-机构用户-区域管理', '2', '2015-06-10 17:53:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/area/', 'GET', 'tabPageId=jerichotabiframe_7', '');
INSERT INTO `sys_log` VALUES ('e4cbbfd13749430987a345c22865cc3a', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:29:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e51c5a5f02ec4d37800e972420e99b8a', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:35:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('e523fbe58a1947f8ba09f5a31be2f8d0', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:20:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/list', 'GET', 'parentIds=0,1,7,&id=7', '');
INSERT INTO `sys_log` VALUES ('e5626916743b4589b5d312ad657b378d', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-11 09:30:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', 'office.name=å¬å¸é¢å¯¼&office.id=2', '');
INSERT INTO `sys_log` VALUES ('e578174ee2294b6c8d7f8bbb1a2b1acd', '1', '系统设置-系统设置-字典管理', '1', '2015-06-11 10:00:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/dict/', 'POST', 'pageSize=30&type=&pageNo=2&description=', '');
INSERT INTO `sys_log` VALUES ('e584483978924b059b85f8cd15cbfc92', '1', '我的面板-个人信息-个人信息', '2', '2015-06-11 09:53:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('e5af4b950b394d5d8719dbbc00c3a0d8', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 16:20:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/usertorole', 'POST', 'id=2&___t0.7969787848794543=', '');
INSERT INTO `sys_log` VALUES ('e68dbbc762ac4bcf8f6490d2c7f2e3c3', '1', '内容管理-内容管理', '1', '2015-06-10 17:13:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none/', 'GET', 'category.id=24', '');
INSERT INTO `sys_log` VALUES ('e6af9fd6042d4994b90467c6c47064bb', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 15:50:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e6cc097ed16845dd97ba5dd3fef58746', '1', '在线办公-流程管理-流程管理', '1', '2015-06-18 14:54:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/process', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('e710b223fdf9406f8350c0560fa6f7ff', '1', '系统设置-机构用户-区域管理', '1', '2015-06-11 10:06:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e74bab9f5f5241c4a127ca5bcfd22abd', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:23:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('e75fb1a0c8e0418b9ce9e7b8970426f3', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-05-18 11:16:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('e949620bfe28424a9205dc030c529c90', '1', '系统设置-机构用户-用户管理', '1', '2015-06-11 10:04:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('e95ed2fdf9a8447e9e9522273e341956', '1', '在线办公-流程管理-模型管理', '1', '2015-06-18 16:14:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/act/model', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('e982875da9904d178bd5bf0233d65366', '1', '内容管理-内容管理', '1', '2015-06-12 17:22:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none/', 'GET', 'category.id=7be5ba2e4b164b909e67f6289096fa24', '');
INSERT INTO `sys_log` VALUES ('ea9ecef7862f44f188aed7d6630d0440', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 15:51:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/export', 'POST', 'orderBy=&pageNo=1&office.name=&company.id=&name=&pageSize=30&office.id=&company.name=&loginName=', '');
INSERT INTO `sys_log` VALUES ('eb044ce694e247a5baba18fa5550d274', '1', '内容管理-内容管理', '1', '2015-05-18 11:05:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ebc22d56f1324da6809d871b892364de', '1', '系统设置-系统设置-字典管理-查看', '1', '2015-06-18 15:01:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/form', 'GET', 'id=71', '');
INSERT INTO `sys_log` VALUES ('ebd46f27566f4af0bf5e7cfb4eb16ec1', '1', '我的面板-个人信息-个人信息', '1', '2015-06-10 14:15:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('ec0f737ea34245f796d637f5643699a8', '1', '我的面板-个人信息-个人信息', '1', '2015-05-21 11:07:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('ec9f3ff9205e483f8aa2340e263c5847', '1', '系统设置-系统设置-菜单管理-查看', '1', '2015-06-10 16:59:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('eca2dea78bb3480ea6c0a89f0865b9e8', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:17:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('ed00b6208c8341ae9c5a6910a710efde', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-18 14:58:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ed45cba4fa5742bd8589eac1c7108c57', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:24:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ed54250d5c024c26a4f81d6f0eac221b', '1', '内容管理-内容管理-评论管理-查看', '1', '2015-06-12 16:58:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/comment/', 'POST', 'title=&pageNo=1&pageSize=30&delFlag=1', '');
INSERT INTO `sys_log` VALUES ('edcb9f3427ef46cab81a98710afe20b5', '1', '内容管理-内容管理-内容发布', '1', '2015-06-18 14:55:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_13', '');
INSERT INTO `sys_log` VALUES ('edfbc1f8f13a4262ad5210d27a166a81', '1', '在线办公-通知通告-通告管理', '1', '2015-05-21 15:11:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('ee2221ff8a8f4a9b813809545cddeca2', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 15:45:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('ee29144c7783490094febaaf0622695c', '1', '我的面板-个人信息-个人信息', '1', '2015-05-20 16:51:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('ee411bce1a4345d8912f8bd3d812ddf3', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 17:21:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=3&repage=', '');
INSERT INTO `sys_log` VALUES ('ee839e0db6f94c2a8f4f40781096a643', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 11:05:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('eea2a6d5617d49cd8bfaf6f0ed16ce01', '1', '内容管理-栏目设置-站点设置', '1', '2015-06-12 16:42:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('ef36a7ffc6904a3e8d9588a188fb45ae', '1', '内容管理-内容管理', '1', '2015-06-12 08:59:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ef58efc7113c45b18791ac0495259c52', '1', '系统设置-机构用户-用户管理', '1', '2015-06-10 17:07:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('efbf13c48c8b497398a24267a89601c0', '1', '内容管理-内容管理', '1', '2015-06-12 16:24:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f05767826dab4be5a03cdf7458bed742', '1', '在线办公-通知通告-我的通告', '1', '2015-06-11 09:31:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('f07d6887a7ff4727856abfde80efade6', '1', '系统登录', '1', '2015-06-10 16:19:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/assign', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('f0a52cb258ae41c4be22a4b4d857de8e', '1', '内容管理-栏目设置-站点设置', '1', '2015-06-18 14:56:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'tabPageId=jerichotabiframe_18', '');
INSERT INTO `sys_log` VALUES ('f0cb7bf8d287491aa0d810ccae3fa2f6', '1', '内容管理-内容管理-内容发布', '1', '2015-06-12 16:24:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/', 'GET', 'tabPageId=jerichotabiframe_2', '');
INSERT INTO `sys_log` VALUES ('f155e74fdb534fce91262f472b540fed', '1', '内容管理-内容管理-内容发布-链接模型', '1', '2015-06-12 09:20:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/link/', 'GET', 'category.id=18', '');
INSERT INTO `sys_log` VALUES ('f17708a2ec954fe0842ecf410b56f663', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:21:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/form', 'GET', 'parent.id=7', '');
INSERT INTO `sys_log` VALUES ('f20cccd8c33e4c77967479b5611f14ad', '1', '系统设置-系统设置-角色管理', '1', '2015-06-10 16:21:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/', 'GET', 'tabPageId=jerichotabiframe_14', '');
INSERT INTO `sys_log` VALUES ('f226c2eea3bf46e2a7020c41f10ac8c1', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 16:24:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f25b5822a28543bdb5645bb136d6a93c', '1', '内容管理-内容管理', '2', '2015-06-10 17:57:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f262c0680e0149d0af1682f8a83cde76', '1', '在线办公-通知通告-我的通告', '1', '2015-06-11 09:24:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('f2a8829042754bc1885dcb470e0c5178', '1', '内容管理-内容管理', '2', '2015-06-10 17:57:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f2b83f8ef9fb402ab7e757327a257fd6', '1', '系统设置-机构用户-用户管理', '1', '2015-06-10 17:44:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/index', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('f3589ef962da435a8850bbb13ea63bfc', '1', '我的面板-个人信息-个人信息', '1', '2015-06-18 14:52:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('f36d41bd63274a96b23d715fedf6e2e3', '1', '内容管理-内容管理', '1', '2015-06-12 09:42:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f3f5f1a06adb48eb9c393dab4e274530', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:20:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=11', '');
INSERT INTO `sys_log` VALUES ('f411dd06b3ce4c1ba5e8edc5750638f8', '1', '在线办公-通知通告-我的通告', '1', '2015-05-20 16:51:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/jeesite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('f4979af1e245467aa3c661c72ff90248', '1', '内容管理-栏目设置-站点设置', '1', '2015-06-18 14:57:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/site/', 'GET', 'tabPageId=jerichotabiframe_21', '');
INSERT INTO `sys_log` VALUES ('f4cea6bb81a44f7cb93c98587db21748', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-12 16:35:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f62af5854efd46bfaff08600e2f97178', '1', '系统登录', '1', '2015-06-10 15:45:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('f64214fbe9f64812a455ab4f4db0ea93', '1', '我的面板-个人信息-个人信息', '1', '2015-05-18 17:21:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('f6aa987bbbf84cce8873c43a0b08cf34', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:08:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'parent.id=ff8fb2c20e1140bd92e87ba801fa1152', '');
INSERT INTO `sys_log` VALUES ('f6cb406502e545aebdda969753e5c200', '1', '系统设置-系统设置-角色管理-修改', '1', '2015-06-10 17:57:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/save', 'POST', 'dataScope=3&officeIds=&remarks=&office.id=2&oldName=本公司管理员&id=3&menuIds=1,27,28,29,30,71,56,57,58,59,62,88,89,90,63,73,64,65,66,69,70,72,31,40,41,42,43,44,45,46,47,48,49...&useable=1&office.name=公司领导&name=本公司管理员&roleType=assignment&sysData=1&enname=a&oldEnname=a', '');
INSERT INTO `sys_log` VALUES ('f6d4b1a526934a0c89c939f7f352da90', '1', '系统设置-机构用户-用户管理-查看', '1', '2015-06-10 17:07:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('f6e0fe1b8dc149d2b19c74c76409065b', '1', '在线办公-通知通告-我的通告', '1', '2015-05-21 14:17:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_1', '');
INSERT INTO `sys_log` VALUES ('f768bdf968504f18ba6ceba98d2b3663', '1', '我的面板-个人信息-个人信息', '2', '2015-06-10 17:57:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('f78a0fef4e7641a2bd93d137ac8f21eb', '1', '我的面板-个人信息-个人信息', '1', '2015-06-12 17:23:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_log` VALUES ('f80cdca444944605af3177f5d686bdad', '1', '系统设置-机构用户-机构管理', '1', '2015-06-10 15:01:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/', 'GET', 'tabPageId=jerichotabiframe_6', '');
INSERT INTO `sys_log` VALUES ('f97f39d0490348b982e408eebe602717', '1', '在线办公-通知通告-我的通告', '1', '2015-06-11 09:36:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/oa/oaNotify/self', 'GET', 'tabPageId=jerichotabiframe_5', '');
INSERT INTO `sys_log` VALUES ('f98a084461814b75998c4a5768cab112', '1', '内容管理-内容管理-评论管理-查看', '1', '2015-05-18 11:01:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/cms/comment/', 'GET', 'tabPageId=jerichotabiframe_4&status=2', '');
INSERT INTO `sys_log` VALUES ('f99f9089adcc40ba99cc782927c4bdb4', '1', '系统设置-系统设置-字典管理', '1', '2015-06-10 15:45:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/dict/', 'GET', 'tabPageId=jerichotabiframe_16', '');
INSERT INTO `sys_log` VALUES ('f9eac9ef4a754e948dc8798733bc1833', '1', '系统设置-系统设置-菜单管理', '1', '2015-06-10 17:00:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/menu/', 'GET', 'tabPageId=jerichotabiframe_3', '');
INSERT INTO `sys_log` VALUES ('fa7a11835a2b4499ab747bbdd8d8446c', '1', '系统登录', '1', '2015-06-12 08:59:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fa90b2cee86a40e89b6d68a0afa6a900', '1', '代码生成-代码生成-生成方案配置', '1', '2015-06-10 16:27:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/gen/genScheme', 'GET', 'tabPageId=jerichotabiframe_19', '');
INSERT INTO `sys_log` VALUES ('fab9aaa4caef4329b9bcb539b18143c2', '1', '内容管理-内容管理-内容发布-文章模型-查看', '2', '2015-06-11 09:54:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=27', '');
INSERT INTO `sys_log` VALUES ('fac251f49f5a4884a04bc156092c4025', '1', '内容管理-内容管理-内容发布-文章模型-查看', '1', '2015-06-12 16:44:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('fb33a2ea941946a5a6e24695e259445b', '1', '代码生成-代码生成-业务表配置', '1', '2015-05-18 11:24:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:37.0) Gecko/20100101 Firefox/37.0', '/jeesite/a/gen/genTable', 'GET', 'tabPageId=jerichotabiframe_4', '');
INSERT INTO `sys_log` VALUES ('fb57e74645fd4757a52a88b6efa57417', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:08:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=10', '');
INSERT INTO `sys_log` VALUES ('fb5e8a713cb847e7986825f2f2ab05ea', '1', '系统设置-机构用户-机构管理-查看', '1', '2015-06-10 15:18:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/office/form', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('fb7fdc79c7864f47a7d4bff83ce44a03', '1', '系统设置-机构用户-区域管理-查看', '1', '2015-06-10 15:11:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/form', 'GET', 'parent.id=2', '');
INSERT INTO `sys_log` VALUES ('fc2d0d93a87d4db89ed810e143cbaf4d', '1', '系统设置-机构用户-区域管理', '1', '2015-06-10 15:06:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fcac070773d34a6ea68702c4b72ce0a4', '1', '系统设置-机构用户-用户管理-修改', '1', '2015-06-10 17:11:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=thinkgem&loginName=ad', '');
INSERT INTO `sys_log` VALUES ('fcd1e738426b475e8e5f055670012268', '1', '内容管理-栏目设置-栏目管理', '1', '2015-05-20 22:14:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/category/', 'GET', 'tabPageId=jerichotabiframe_11', '');
INSERT INTO `sys_log` VALUES ('fd49229c239e4c88b4c486bfe624a137', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2015-06-12 09:20:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/cms/article/', 'GET', 'category.id=10', '');
INSERT INTO `sys_log` VALUES ('fd7d82a681f84cc1b92aaf2713ae5c57', '1', '系统登录', '1', '2015-06-10 14:36:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fd8e0c7290c644309fa348ae7673571d', '1', '内容管理-内容管理', '2', '2015-06-10 17:53:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fdad486ea5be4bac821f7b885388d98d', '1', '系统设置-系统设置-角色管理-查看', '1', '2015-06-10 16:21:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a/sys/role/form', 'GET', 'id=6', '');
INSERT INTO `sys_log` VALUES ('fdfcacaf17264d51a58b8ca652aa1f49', '1', '系统登录', '1', '2015-06-10 14:12:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1; rv:38.0) Gecko/20100101 Firefox/38.0', '/MyJeeSite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ff5b0e120c704d07b82e3b85244bcd97', '1', '我的面板-个人信息-个人信息', '2', '2015-06-10 17:57:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 BIDUBrowser/6.x Safari/537.36', '/MyJeeSite/a/sys/user/info', 'GET', 'tabPageId=jerichotabiframe_0', '');
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '编辑', '60', '', '', '', '0', 'test:testData:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('0ca004d6b1bf4bcab9670a5060d82a55', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '树结构', '90', '/test/testTree', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '2', '0,1,2,', '关于帮助', '990', null, null, null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '23', '0,1,2,23', '官方首页', '30', 'http://jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '23', '0,1,2,23', '项目支持', '50', 'http://jeesite.com/donation.html', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '23', '0,1,2,23', '论坛交流', '80', 'http://bbs.jeesite.com', '_blank', null, '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', '', 'user', '1', '', '1', '2013-05-27 08:00:00', '1', '2015-06-10 16:24:01', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('31', '1', '0,1,', '内容管理', '500', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('32', '31', '0,1,31,', '栏目设置', '990', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '32', '0,1,31,32', '栏目管理', '30', '/cms/category/', null, 'align-justify', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '33', '0,1,31,32,33,', '查看', '30', null, null, null, '0', 'cms:category:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '33', '0,1,31,32,33,', '修改', '40', null, null, null, '0', 'cms:category:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '32', '0,1,31,32', '站点设置', '40', '/cms/site/', null, 'certificate', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '36', '0,1,31,32,36,', '查看', '30', null, null, null, '0', 'cms:site:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '36', '0,1,31,32,36,', '修改', '40', null, null, null, '0', 'cms:site:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '32', '0,1,31,32', '切换站点', '50', '/cms/site/select', null, 'retweet', '1', 'cms:site:select', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('3c92c17886944d0687e73e286cada573', '79', '0,1,79,', '生成示例', '120', '', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('40', '31', '0,1,31,', '内容管理', '500', null, null, null, '1', 'cms:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('41', '40', '0,1,31,40,', '内容发布', '30', '/cms/', null, 'briefcase', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('42', '41', '0,1,31,40,41,', '文章模型', '40', '/cms/article/', null, 'file', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '42', '0,1,31,40,41,42,', '查看', '30', null, null, null, '0', 'cms:article:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('44', '42', '0,1,31,40,41,42,', '修改', '40', null, null, null, '0', 'cms:article:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('45', '42', '0,1,31,40,41,42,', '审核', '50', null, null, null, '0', 'cms:article:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('46', '41', '0,1,31,40,41,', '链接模型', '60', '/cms/link/', null, 'random', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('47', '46', '0,1,31,40,41,46,', '查看', '30', null, null, null, '0', 'cms:link:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('48', '46', '0,1,31,40,41,46,', '修改', '40', null, null, null, '0', 'cms:link:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('4855cf3b25c244fb8500a380db189d97', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '查看', '30', '', '', '', '0', 'test:testDataMain:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('49', '46', '0,1,31,40,41,46,', '审核', '50', null, null, null, '0', 'cms:link:audit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', null, null, null, '0', 'sys:menu:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('50', '40', '0,1,31,40,', '评论管理', '40', '/cms/comment/?status=2', null, 'comment', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('51', '50', '0,1,31,40,50,', '查看', '30', null, null, null, '0', 'cms:comment:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('52', '50', '0,1,31,40,50,', '审核', '40', null, null, null, '0', 'cms:comment:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('53', '40', '0,1,31,40,', '公共留言', '80', '/cms/guestbook/?status=2', null, 'glass', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '0,1,31,40,53,', '查看', '30', null, null, null, '0', 'cms:guestbook:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('55', '53', '0,1,31,40,53,', '审核', '40', null, null, null, '0', 'cms:guestbook:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '90', '/../static/ckfinder/ckfinder.html', null, 'folder-open', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '30', null, null, null, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '40', null, null, null, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('60', '31', '0,1,31,', '统计分析', '600', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('61', '60', '0,1,31,60,', '信息量统计', '30', '/cms/stats/article', null, 'tasks', '1', 'cms:stats:article', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('62', '1', '0,1,', '在线办公', '200', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('63', '62', '0,1,62,', '个人办公', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('64', '63', '0,1,62,63,', '请假办理', '300', '/oa/leave', null, 'leaf', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('65', '64', '0,1,62,63,64,', '查看', '30', null, null, null, '0', 'oa:leave:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '64', '0,1,62,63,64,', '修改', '40', null, null, null, '0', 'oa:leave:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('69', '62', '0,1,62,', '流程管理', '300', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('70', '69', '0,1,62,69,', '流程管理', '50', '/act/process', null, 'road', '1', 'act:process:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '90', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('72', '69', '0,1,62,69,', '模型管理', '100', '/act/model', null, 'road', '1', 'act:model:edit', '1', '2013-09-20 08:00:00', '1', '2013-09-20 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('73', '63', '0,1,62,63,', '我的任务', '50', '/act/task/todo/', null, 'tasks', '1', null, '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('74', '63', '0,1,62,63,', '审批测试', '100', '/oa/testAudit', null, null, '1', 'oa:testAudit:view,oa:testAudit:edit', '1', '2013-09-24 08:00:00', '1', '2013-09-24 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('75', '1', '0,1,', '在线演示', '3000', null, null, null, '1', null, '1', '2013-10-08 08:00:00', '1', '2013-10-08 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '5000', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '50', null, null, null, '1', null, '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '30', '/gen/genScheme', null, null, '1', 'gen:genScheme:view,gen:genScheme:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '20', '/gen/genTable', null, null, '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('83', '80', '0,1,79,80,', '代码模板管理', '90', '/gen/genTemplate', null, null, '1', 'gen:genTemplate:view,gen:genTemplate:edit', '1', '2013-10-16 08:00:00', '1', '2013-10-16 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,2,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('86', '75', '0,1,75,', '组件演示', '50', null, null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('87', '86', '0,1,75,86,', '组件演示', '30', '/test/test/', null, null, '1', 'test:test:view,test:test:edit', '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('88', '62', '0,1,62,', '通知通告', '20', '', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('89', '88', '0,1,62,88,', '我的通告', '30', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('90', '88', '0,1,62,88,', '通告管理', '50', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:view,oa:oaNotify:edit', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('afab2db430e2457f9cf3a11feaa8b869', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '编辑', '60', '', '', '', '0', 'test:testTree:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('b1f6d1b86ba24365bae7fd86c5082317', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '主子表', '60', '/test/testDataMain', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('ba8092291b40482db8fe7fc006ea3d76', '3c92c17886944d0687e73e286cada573', '0,1,79,3c92c17886944d0687e73e286cada573,', '单表', '30', '/test/testData', '', '', '1', '', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('c2e4d9082a0b4386884a0b203afe2c5c', '0ca004d6b1bf4bcab9670a5060d82a55', '0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,', '查看', '30', '', '', '', '0', 'test:testTree:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('d15ec45a4c5449c3bbd7a61d5f9dd1d2', 'b1f6d1b86ba24365bae7fd86c5082317', '0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,', '编辑', '60', '', '', '', '0', 'test:testDataMain:edit', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('df7ce823c5b24ff9bada43d992f373e2', 'ba8092291b40482db8fe7fc006ea3d76', '0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,', '查看', '30', '', '', '', '0', 'test:testData:view', '1', '2013-08-12 13:10:05', '1', '2013-08-12 13:10:05', '', '0');
INSERT INTO `sys_menu` VALUES ('f3063409150e41508cf55a702aef5dae', '1', '0,1,', '测试模块', '5030', '/', '', '', '1', '', '1', '2015-06-10 17:00:21', '1', '2015-06-10 17:00:21', '', '1');
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '湖南省总公司', '10', '2', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:18:26', '', '0');
INSERT INTO `sys_office` VALUES ('10', '7', '0,1,7,', '市场部', '30', '3', '200003', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('11', '7', '0,1,7,', '技术部', '40', '3', '200004', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('12', '7', '0,1,7,', '开福区分公司', '0', '4', '201000', '1', '3', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:19:23', '', '0');
INSERT INTO `sys_office` VALUES ('13', '12', '0,1,7,12,', '公司领导', '10', '4', '201001', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('14', '12', '0,1,7,12,', '综合部', '20', '4', '201002', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('15', '12', '0,1,7,12,', '市场部', '30', '4', '201003', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('16', '12', '0,1,7,12,', '技术部', '40', '4', '201004', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('17', '7', '0,1,7,', '天心区分公司', '40', '5', '201010', '1', '3', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:19:47', '', '0');
INSERT INTO `sys_office` VALUES ('18', '17', '0,1,7,17,', '公司领导', '10', '5', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('19', '17', '0,1,7,17,', '综合部', '20', '5', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('20', '17', '0,1,7,17,', '市场部', '30', '5', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('21', '17', '0,1,7,17,', '技术部', '40', '5', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('22', '7', '0,1,7,', '岳麓区分公司', '50', '6', '201010', '1', '3', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:20:04', '', '0');
INSERT INTO `sys_office` VALUES ('23', '22', '0,1,7,22,', '公司领导', '10', '6', '201011', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('24', '22', '0,1,7,22,', '综合部', '20', '6', '201012', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('25', '22', '0,1,7,22,', '市场部', '30', '6', '201013', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('26', '22', '0,1,7,22,', '技术部', '40', '6', '201014', '2', '3', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '2', '100002', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '长沙市分公司', '20', '3', '200000', '1', '2', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2015-06-10 15:18:57', '', '0');
INSERT INTO `sys_office` VALUES ('8', '7', '0,1,7,', '公司领导', '10', '3', '200001', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('9', '7', '0,1,7,', '综合部', '20', '3', '200002', '2', '2', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', 'dept', 'assignment', '1', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('2', '2', '公司管理员', 'hr', 'assignment', '2', '1', '1', '1', '2013-05-27 08:00:00', '1', '2015-06-10 16:22:15', '', '0');
INSERT INTO `sys_role` VALUES ('3', '2', '本公司管理员', 'a', 'assignment', '3', '1', '1', '1', '2013-05-27 08:00:00', '1', '2015-06-10 17:57:26', '', '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('6', '2', '普通用户', 'd', 'assignment', '8', '1', '1', '1', '2013-05-27 08:00:00', '1', '2015-06-10 16:22:00', '', '0');
INSERT INTO `sys_role` VALUES ('7', '7', '济南市管理员', 'e', 'assignment', '9', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '31');
INSERT INTO `sys_role_menu` VALUES ('1', '32');
INSERT INTO `sys_role_menu` VALUES ('1', '33');
INSERT INTO `sys_role_menu` VALUES ('1', '34');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '36');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '38');
INSERT INTO `sys_role_menu` VALUES ('1', '39');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '40');
INSERT INTO `sys_role_menu` VALUES ('1', '41');
INSERT INTO `sys_role_menu` VALUES ('1', '42');
INSERT INTO `sys_role_menu` VALUES ('1', '43');
INSERT INTO `sys_role_menu` VALUES ('1', '44');
INSERT INTO `sys_role_menu` VALUES ('1', '45');
INSERT INTO `sys_role_menu` VALUES ('1', '46');
INSERT INTO `sys_role_menu` VALUES ('1', '47');
INSERT INTO `sys_role_menu` VALUES ('1', '48');
INSERT INTO `sys_role_menu` VALUES ('1', '49');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '50');
INSERT INTO `sys_role_menu` VALUES ('1', '51');
INSERT INTO `sys_role_menu` VALUES ('1', '52');
INSERT INTO `sys_role_menu` VALUES ('1', '53');
INSERT INTO `sys_role_menu` VALUES ('1', '54');
INSERT INTO `sys_role_menu` VALUES ('1', '55');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '60');
INSERT INTO `sys_role_menu` VALUES ('1', '61');
INSERT INTO `sys_role_menu` VALUES ('1', '62');
INSERT INTO `sys_role_menu` VALUES ('1', '63');
INSERT INTO `sys_role_menu` VALUES ('1', '64');
INSERT INTO `sys_role_menu` VALUES ('1', '65');
INSERT INTO `sys_role_menu` VALUES ('1', '66');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '70');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '72');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '23');
INSERT INTO `sys_role_menu` VALUES ('2', '24');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '31');
INSERT INTO `sys_role_menu` VALUES ('2', '32');
INSERT INTO `sys_role_menu` VALUES ('2', '33');
INSERT INTO `sys_role_menu` VALUES ('2', '34');
INSERT INTO `sys_role_menu` VALUES ('2', '35');
INSERT INTO `sys_role_menu` VALUES ('2', '36');
INSERT INTO `sys_role_menu` VALUES ('2', '37');
INSERT INTO `sys_role_menu` VALUES ('2', '38');
INSERT INTO `sys_role_menu` VALUES ('2', '39');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '40');
INSERT INTO `sys_role_menu` VALUES ('2', '41');
INSERT INTO `sys_role_menu` VALUES ('2', '42');
INSERT INTO `sys_role_menu` VALUES ('2', '43');
INSERT INTO `sys_role_menu` VALUES ('2', '44');
INSERT INTO `sys_role_menu` VALUES ('2', '45');
INSERT INTO `sys_role_menu` VALUES ('2', '46');
INSERT INTO `sys_role_menu` VALUES ('2', '47');
INSERT INTO `sys_role_menu` VALUES ('2', '48');
INSERT INTO `sys_role_menu` VALUES ('2', '49');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '50');
INSERT INTO `sys_role_menu` VALUES ('2', '51');
INSERT INTO `sys_role_menu` VALUES ('2', '52');
INSERT INTO `sys_role_menu` VALUES ('2', '53');
INSERT INTO `sys_role_menu` VALUES ('2', '54');
INSERT INTO `sys_role_menu` VALUES ('2', '55');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '60');
INSERT INTO `sys_role_menu` VALUES ('2', '61');
INSERT INTO `sys_role_menu` VALUES ('2', '62');
INSERT INTO `sys_role_menu` VALUES ('2', '63');
INSERT INTO `sys_role_menu` VALUES ('2', '64');
INSERT INTO `sys_role_menu` VALUES ('2', '65');
INSERT INTO `sys_role_menu` VALUES ('2', '66');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '69');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '70');
INSERT INTO `sys_role_menu` VALUES ('2', '71');
INSERT INTO `sys_role_menu` VALUES ('2', '72');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '23');
INSERT INTO `sys_role_menu` VALUES ('3', '24');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '71');
INSERT INTO `sys_role_menu` VALUES ('3', '72');
INSERT INTO `sys_role_menu` VALUES ('3', '73');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '88');
INSERT INTO `sys_role_menu` VALUES ('3', '89');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '90');
INSERT INTO `sys_role_menu` VALUES ('4', '1');
INSERT INTO `sys_role_menu` VALUES ('4', '10');
INSERT INTO `sys_role_menu` VALUES ('4', '11');
INSERT INTO `sys_role_menu` VALUES ('4', '12');
INSERT INTO `sys_role_menu` VALUES ('4', '13');
INSERT INTO `sys_role_menu` VALUES ('4', '14');
INSERT INTO `sys_role_menu` VALUES ('4', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '16');
INSERT INTO `sys_role_menu` VALUES ('4', '17');
INSERT INTO `sys_role_menu` VALUES ('4', '18');
INSERT INTO `sys_role_menu` VALUES ('4', '19');
INSERT INTO `sys_role_menu` VALUES ('4', '2');
INSERT INTO `sys_role_menu` VALUES ('4', '20');
INSERT INTO `sys_role_menu` VALUES ('4', '21');
INSERT INTO `sys_role_menu` VALUES ('4', '22');
INSERT INTO `sys_role_menu` VALUES ('4', '23');
INSERT INTO `sys_role_menu` VALUES ('4', '24');
INSERT INTO `sys_role_menu` VALUES ('4', '25');
INSERT INTO `sys_role_menu` VALUES ('4', '26');
INSERT INTO `sys_role_menu` VALUES ('4', '27');
INSERT INTO `sys_role_menu` VALUES ('4', '28');
INSERT INTO `sys_role_menu` VALUES ('4', '29');
INSERT INTO `sys_role_menu` VALUES ('4', '3');
INSERT INTO `sys_role_menu` VALUES ('4', '30');
INSERT INTO `sys_role_menu` VALUES ('4', '31');
INSERT INTO `sys_role_menu` VALUES ('4', '32');
INSERT INTO `sys_role_menu` VALUES ('4', '33');
INSERT INTO `sys_role_menu` VALUES ('4', '34');
INSERT INTO `sys_role_menu` VALUES ('4', '35');
INSERT INTO `sys_role_menu` VALUES ('4', '36');
INSERT INTO `sys_role_menu` VALUES ('4', '37');
INSERT INTO `sys_role_menu` VALUES ('4', '38');
INSERT INTO `sys_role_menu` VALUES ('4', '39');
INSERT INTO `sys_role_menu` VALUES ('4', '4');
INSERT INTO `sys_role_menu` VALUES ('4', '40');
INSERT INTO `sys_role_menu` VALUES ('4', '41');
INSERT INTO `sys_role_menu` VALUES ('4', '42');
INSERT INTO `sys_role_menu` VALUES ('4', '43');
INSERT INTO `sys_role_menu` VALUES ('4', '44');
INSERT INTO `sys_role_menu` VALUES ('4', '45');
INSERT INTO `sys_role_menu` VALUES ('4', '46');
INSERT INTO `sys_role_menu` VALUES ('4', '47');
INSERT INTO `sys_role_menu` VALUES ('4', '48');
INSERT INTO `sys_role_menu` VALUES ('4', '49');
INSERT INTO `sys_role_menu` VALUES ('4', '5');
INSERT INTO `sys_role_menu` VALUES ('4', '50');
INSERT INTO `sys_role_menu` VALUES ('4', '51');
INSERT INTO `sys_role_menu` VALUES ('4', '52');
INSERT INTO `sys_role_menu` VALUES ('4', '53');
INSERT INTO `sys_role_menu` VALUES ('4', '54');
INSERT INTO `sys_role_menu` VALUES ('4', '55');
INSERT INTO `sys_role_menu` VALUES ('4', '56');
INSERT INTO `sys_role_menu` VALUES ('4', '57');
INSERT INTO `sys_role_menu` VALUES ('4', '58');
INSERT INTO `sys_role_menu` VALUES ('4', '59');
INSERT INTO `sys_role_menu` VALUES ('4', '6');
INSERT INTO `sys_role_menu` VALUES ('4', '60');
INSERT INTO `sys_role_menu` VALUES ('4', '61');
INSERT INTO `sys_role_menu` VALUES ('4', '62');
INSERT INTO `sys_role_menu` VALUES ('4', '63');
INSERT INTO `sys_role_menu` VALUES ('4', '64');
INSERT INTO `sys_role_menu` VALUES ('4', '65');
INSERT INTO `sys_role_menu` VALUES ('4', '66');
INSERT INTO `sys_role_menu` VALUES ('4', '67');
INSERT INTO `sys_role_menu` VALUES ('4', '68');
INSERT INTO `sys_role_menu` VALUES ('4', '69');
INSERT INTO `sys_role_menu` VALUES ('4', '7');
INSERT INTO `sys_role_menu` VALUES ('4', '70');
INSERT INTO `sys_role_menu` VALUES ('4', '71');
INSERT INTO `sys_role_menu` VALUES ('4', '72');
INSERT INTO `sys_role_menu` VALUES ('4', '8');
INSERT INTO `sys_role_menu` VALUES ('4', '9');
INSERT INTO `sys_role_menu` VALUES ('5', '1');
INSERT INTO `sys_role_menu` VALUES ('5', '10');
INSERT INTO `sys_role_menu` VALUES ('5', '11');
INSERT INTO `sys_role_menu` VALUES ('5', '12');
INSERT INTO `sys_role_menu` VALUES ('5', '13');
INSERT INTO `sys_role_menu` VALUES ('5', '14');
INSERT INTO `sys_role_menu` VALUES ('5', '15');
INSERT INTO `sys_role_menu` VALUES ('5', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '17');
INSERT INTO `sys_role_menu` VALUES ('5', '18');
INSERT INTO `sys_role_menu` VALUES ('5', '19');
INSERT INTO `sys_role_menu` VALUES ('5', '2');
INSERT INTO `sys_role_menu` VALUES ('5', '20');
INSERT INTO `sys_role_menu` VALUES ('5', '21');
INSERT INTO `sys_role_menu` VALUES ('5', '22');
INSERT INTO `sys_role_menu` VALUES ('5', '23');
INSERT INTO `sys_role_menu` VALUES ('5', '24');
INSERT INTO `sys_role_menu` VALUES ('5', '25');
INSERT INTO `sys_role_menu` VALUES ('5', '26');
INSERT INTO `sys_role_menu` VALUES ('5', '27');
INSERT INTO `sys_role_menu` VALUES ('5', '28');
INSERT INTO `sys_role_menu` VALUES ('5', '29');
INSERT INTO `sys_role_menu` VALUES ('5', '3');
INSERT INTO `sys_role_menu` VALUES ('5', '30');
INSERT INTO `sys_role_menu` VALUES ('5', '31');
INSERT INTO `sys_role_menu` VALUES ('5', '32');
INSERT INTO `sys_role_menu` VALUES ('5', '33');
INSERT INTO `sys_role_menu` VALUES ('5', '34');
INSERT INTO `sys_role_menu` VALUES ('5', '35');
INSERT INTO `sys_role_menu` VALUES ('5', '36');
INSERT INTO `sys_role_menu` VALUES ('5', '37');
INSERT INTO `sys_role_menu` VALUES ('5', '38');
INSERT INTO `sys_role_menu` VALUES ('5', '39');
INSERT INTO `sys_role_menu` VALUES ('5', '4');
INSERT INTO `sys_role_menu` VALUES ('5', '40');
INSERT INTO `sys_role_menu` VALUES ('5', '41');
INSERT INTO `sys_role_menu` VALUES ('5', '42');
INSERT INTO `sys_role_menu` VALUES ('5', '43');
INSERT INTO `sys_role_menu` VALUES ('5', '44');
INSERT INTO `sys_role_menu` VALUES ('5', '45');
INSERT INTO `sys_role_menu` VALUES ('5', '46');
INSERT INTO `sys_role_menu` VALUES ('5', '47');
INSERT INTO `sys_role_menu` VALUES ('5', '48');
INSERT INTO `sys_role_menu` VALUES ('5', '49');
INSERT INTO `sys_role_menu` VALUES ('5', '5');
INSERT INTO `sys_role_menu` VALUES ('5', '50');
INSERT INTO `sys_role_menu` VALUES ('5', '51');
INSERT INTO `sys_role_menu` VALUES ('5', '52');
INSERT INTO `sys_role_menu` VALUES ('5', '53');
INSERT INTO `sys_role_menu` VALUES ('5', '54');
INSERT INTO `sys_role_menu` VALUES ('5', '55');
INSERT INTO `sys_role_menu` VALUES ('5', '56');
INSERT INTO `sys_role_menu` VALUES ('5', '57');
INSERT INTO `sys_role_menu` VALUES ('5', '58');
INSERT INTO `sys_role_menu` VALUES ('5', '59');
INSERT INTO `sys_role_menu` VALUES ('5', '6');
INSERT INTO `sys_role_menu` VALUES ('5', '60');
INSERT INTO `sys_role_menu` VALUES ('5', '61');
INSERT INTO `sys_role_menu` VALUES ('5', '62');
INSERT INTO `sys_role_menu` VALUES ('5', '63');
INSERT INTO `sys_role_menu` VALUES ('5', '64');
INSERT INTO `sys_role_menu` VALUES ('5', '65');
INSERT INTO `sys_role_menu` VALUES ('5', '66');
INSERT INTO `sys_role_menu` VALUES ('5', '67');
INSERT INTO `sys_role_menu` VALUES ('5', '68');
INSERT INTO `sys_role_menu` VALUES ('5', '69');
INSERT INTO `sys_role_menu` VALUES ('5', '7');
INSERT INTO `sys_role_menu` VALUES ('5', '70');
INSERT INTO `sys_role_menu` VALUES ('5', '71');
INSERT INTO `sys_role_menu` VALUES ('5', '72');
INSERT INTO `sys_role_menu` VALUES ('5', '8');
INSERT INTO `sys_role_menu` VALUES ('5', '9');
INSERT INTO `sys_role_menu` VALUES ('6', '1');
INSERT INTO `sys_role_menu` VALUES ('6', '10');
INSERT INTO `sys_role_menu` VALUES ('6', '11');
INSERT INTO `sys_role_menu` VALUES ('6', '12');
INSERT INTO `sys_role_menu` VALUES ('6', '13');
INSERT INTO `sys_role_menu` VALUES ('6', '14');
INSERT INTO `sys_role_menu` VALUES ('6', '15');
INSERT INTO `sys_role_menu` VALUES ('6', '16');
INSERT INTO `sys_role_menu` VALUES ('6', '17');
INSERT INTO `sys_role_menu` VALUES ('6', '18');
INSERT INTO `sys_role_menu` VALUES ('6', '19');
INSERT INTO `sys_role_menu` VALUES ('6', '2');
INSERT INTO `sys_role_menu` VALUES ('6', '20');
INSERT INTO `sys_role_menu` VALUES ('6', '21');
INSERT INTO `sys_role_menu` VALUES ('6', '22');
INSERT INTO `sys_role_menu` VALUES ('6', '23');
INSERT INTO `sys_role_menu` VALUES ('6', '24');
INSERT INTO `sys_role_menu` VALUES ('6', '27');
INSERT INTO `sys_role_menu` VALUES ('6', '28');
INSERT INTO `sys_role_menu` VALUES ('6', '29');
INSERT INTO `sys_role_menu` VALUES ('6', '3');
INSERT INTO `sys_role_menu` VALUES ('6', '30');
INSERT INTO `sys_role_menu` VALUES ('6', '31');
INSERT INTO `sys_role_menu` VALUES ('6', '32');
INSERT INTO `sys_role_menu` VALUES ('6', '33');
INSERT INTO `sys_role_menu` VALUES ('6', '34');
INSERT INTO `sys_role_menu` VALUES ('6', '35');
INSERT INTO `sys_role_menu` VALUES ('6', '36');
INSERT INTO `sys_role_menu` VALUES ('6', '37');
INSERT INTO `sys_role_menu` VALUES ('6', '38');
INSERT INTO `sys_role_menu` VALUES ('6', '39');
INSERT INTO `sys_role_menu` VALUES ('6', '4');
INSERT INTO `sys_role_menu` VALUES ('6', '40');
INSERT INTO `sys_role_menu` VALUES ('6', '41');
INSERT INTO `sys_role_menu` VALUES ('6', '42');
INSERT INTO `sys_role_menu` VALUES ('6', '43');
INSERT INTO `sys_role_menu` VALUES ('6', '44');
INSERT INTO `sys_role_menu` VALUES ('6', '45');
INSERT INTO `sys_role_menu` VALUES ('6', '46');
INSERT INTO `sys_role_menu` VALUES ('6', '47');
INSERT INTO `sys_role_menu` VALUES ('6', '48');
INSERT INTO `sys_role_menu` VALUES ('6', '49');
INSERT INTO `sys_role_menu` VALUES ('6', '5');
INSERT INTO `sys_role_menu` VALUES ('6', '50');
INSERT INTO `sys_role_menu` VALUES ('6', '51');
INSERT INTO `sys_role_menu` VALUES ('6', '52');
INSERT INTO `sys_role_menu` VALUES ('6', '53');
INSERT INTO `sys_role_menu` VALUES ('6', '54');
INSERT INTO `sys_role_menu` VALUES ('6', '55');
INSERT INTO `sys_role_menu` VALUES ('6', '56');
INSERT INTO `sys_role_menu` VALUES ('6', '57');
INSERT INTO `sys_role_menu` VALUES ('6', '58');
INSERT INTO `sys_role_menu` VALUES ('6', '59');
INSERT INTO `sys_role_menu` VALUES ('6', '6');
INSERT INTO `sys_role_menu` VALUES ('6', '60');
INSERT INTO `sys_role_menu` VALUES ('6', '61');
INSERT INTO `sys_role_menu` VALUES ('6', '62');
INSERT INTO `sys_role_menu` VALUES ('6', '63');
INSERT INTO `sys_role_menu` VALUES ('6', '64');
INSERT INTO `sys_role_menu` VALUES ('6', '65');
INSERT INTO `sys_role_menu` VALUES ('6', '66');
INSERT INTO `sys_role_menu` VALUES ('6', '67');
INSERT INTO `sys_role_menu` VALUES ('6', '68');
INSERT INTO `sys_role_menu` VALUES ('6', '69');
INSERT INTO `sys_role_menu` VALUES ('6', '7');
INSERT INTO `sys_role_menu` VALUES ('6', '70');
INSERT INTO `sys_role_menu` VALUES ('6', '71');
INSERT INTO `sys_role_menu` VALUES ('6', '72');
INSERT INTO `sys_role_menu` VALUES ('6', '8');
INSERT INTO `sys_role_menu` VALUES ('6', '9');
INSERT INTO `sys_role_menu` VALUES ('7', '1');
INSERT INTO `sys_role_menu` VALUES ('7', '10');
INSERT INTO `sys_role_menu` VALUES ('7', '11');
INSERT INTO `sys_role_menu` VALUES ('7', '12');
INSERT INTO `sys_role_menu` VALUES ('7', '13');
INSERT INTO `sys_role_menu` VALUES ('7', '14');
INSERT INTO `sys_role_menu` VALUES ('7', '15');
INSERT INTO `sys_role_menu` VALUES ('7', '16');
INSERT INTO `sys_role_menu` VALUES ('7', '17');
INSERT INTO `sys_role_menu` VALUES ('7', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '19');
INSERT INTO `sys_role_menu` VALUES ('7', '2');
INSERT INTO `sys_role_menu` VALUES ('7', '20');
INSERT INTO `sys_role_menu` VALUES ('7', '21');
INSERT INTO `sys_role_menu` VALUES ('7', '22');
INSERT INTO `sys_role_menu` VALUES ('7', '23');
INSERT INTO `sys_role_menu` VALUES ('7', '24');
INSERT INTO `sys_role_menu` VALUES ('7', '25');
INSERT INTO `sys_role_menu` VALUES ('7', '26');
INSERT INTO `sys_role_menu` VALUES ('7', '27');
INSERT INTO `sys_role_menu` VALUES ('7', '28');
INSERT INTO `sys_role_menu` VALUES ('7', '29');
INSERT INTO `sys_role_menu` VALUES ('7', '3');
INSERT INTO `sys_role_menu` VALUES ('7', '30');
INSERT INTO `sys_role_menu` VALUES ('7', '31');
INSERT INTO `sys_role_menu` VALUES ('7', '32');
INSERT INTO `sys_role_menu` VALUES ('7', '33');
INSERT INTO `sys_role_menu` VALUES ('7', '34');
INSERT INTO `sys_role_menu` VALUES ('7', '35');
INSERT INTO `sys_role_menu` VALUES ('7', '36');
INSERT INTO `sys_role_menu` VALUES ('7', '37');
INSERT INTO `sys_role_menu` VALUES ('7', '38');
INSERT INTO `sys_role_menu` VALUES ('7', '39');
INSERT INTO `sys_role_menu` VALUES ('7', '4');
INSERT INTO `sys_role_menu` VALUES ('7', '40');
INSERT INTO `sys_role_menu` VALUES ('7', '41');
INSERT INTO `sys_role_menu` VALUES ('7', '42');
INSERT INTO `sys_role_menu` VALUES ('7', '43');
INSERT INTO `sys_role_menu` VALUES ('7', '44');
INSERT INTO `sys_role_menu` VALUES ('7', '45');
INSERT INTO `sys_role_menu` VALUES ('7', '46');
INSERT INTO `sys_role_menu` VALUES ('7', '47');
INSERT INTO `sys_role_menu` VALUES ('7', '48');
INSERT INTO `sys_role_menu` VALUES ('7', '49');
INSERT INTO `sys_role_menu` VALUES ('7', '5');
INSERT INTO `sys_role_menu` VALUES ('7', '50');
INSERT INTO `sys_role_menu` VALUES ('7', '51');
INSERT INTO `sys_role_menu` VALUES ('7', '52');
INSERT INTO `sys_role_menu` VALUES ('7', '53');
INSERT INTO `sys_role_menu` VALUES ('7', '54');
INSERT INTO `sys_role_menu` VALUES ('7', '55');
INSERT INTO `sys_role_menu` VALUES ('7', '56');
INSERT INTO `sys_role_menu` VALUES ('7', '57');
INSERT INTO `sys_role_menu` VALUES ('7', '58');
INSERT INTO `sys_role_menu` VALUES ('7', '59');
INSERT INTO `sys_role_menu` VALUES ('7', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '60');
INSERT INTO `sys_role_menu` VALUES ('7', '61');
INSERT INTO `sys_role_menu` VALUES ('7', '62');
INSERT INTO `sys_role_menu` VALUES ('7', '63');
INSERT INTO `sys_role_menu` VALUES ('7', '64');
INSERT INTO `sys_role_menu` VALUES ('7', '65');
INSERT INTO `sys_role_menu` VALUES ('7', '66');
INSERT INTO `sys_role_menu` VALUES ('7', '67');
INSERT INTO `sys_role_menu` VALUES ('7', '68');
INSERT INTO `sys_role_menu` VALUES ('7', '69');
INSERT INTO `sys_role_menu` VALUES ('7', '7');
INSERT INTO `sys_role_menu` VALUES ('7', '70');
INSERT INTO `sys_role_menu` VALUES ('7', '71');
INSERT INTO `sys_role_menu` VALUES ('7', '72');
INSERT INTO `sys_role_menu` VALUES ('7', '8');
INSERT INTO `sys_role_menu` VALUES ('7', '9');
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', 'rongrong2773@163.com', '13977892345', '13977892345', '', '/MyJeeSite/userfiles/1/images/photo/2015/06/6135d612jw1ei5sjvujkej20xc18gqb2.jpg', '127.0.0.1', '2015-06-18 16:13:57', '1', '1', '2013-05-27 08:00:00', '1', '2015-06-11 10:07:09', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('10', '7', '11', 'jn_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0010', '济南技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('11', '12', '13', 'lc_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0011', '济南历城领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('12', '12', '18', 'lx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0012', '济南历下领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('13', '22', '23', 'gx_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0013', '济南高新领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('2', '1', '2', 'sd_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0002', '管理员', null, null, null, null, null, '127.0.0.1', '2015-06-11 09:53:29', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('3', '1', '3', 'sd_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0003', '综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('4', '1', '4', 'sd_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0004', '市场部一', '', '13233333333', '', '', '', null, null, '1', '1', '2013-05-27 08:00:00', '1', '2015-06-11 09:56:25', '', '0');
INSERT INTO `sys_user` VALUES ('5', '1', '5', 'sd_jsb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0005', '技术部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('6', '1', '6', 'sd_yfb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0006', '研发部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('7', '7', '8', 'jn_admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0007', '济南领导', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('8', '7', '9', 'jn_zhb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0008', '济南综合部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user` VALUES ('88f4bbfa782a444d91877e350fb3c632', '12', '13', 'zhangmeinv', '581374906205c1a751a6ac76a9c12de0d172a11857c9f2099f8eef5f', '999', '张美女', '', '', '', '3', '/MyJeeSite/userfiles/1/images/photo/2015/06/2107277060_853282722.jpg', null, null, '1', '1', '2015-06-11 09:59:01', '1', '2015-06-11 09:59:01', '', '0');
INSERT INTO `sys_user` VALUES ('9', '7', '10', 'jn_scb', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0009', '济南市场部', null, null, null, null, null, null, null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('1', '3');
INSERT INTO `sys_user_role` VALUES ('1', '4');
INSERT INTO `sys_user_role` VALUES ('1', '5');
INSERT INTO `sys_user_role` VALUES ('1', '6');
INSERT INTO `sys_user_role` VALUES ('1', '7');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('6', '5');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('7', '7');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('88f4bbfa782a444d91877e350fb3c632', '5');
INSERT INTO `sys_user_role` VALUES ('88f4bbfa782a444d91877e350fb3c632', '6');
INSERT INTO `sys_user_role` VALUES ('9', '1');
