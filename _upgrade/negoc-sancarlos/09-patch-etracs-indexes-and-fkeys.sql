--
-- TABLE INDEXES
--

CREATE INDEX `ix_name` ON `barangay` (`name`);

CREATE INDEX `ix_collectiontypeid` ON `barcode_launcher` (`collectiontypeid`);

CREATE UNIQUE INDEX `uix_businessid_attribute_objid_lob_objid` ON `business_active_info` (`businessid`,`attribute_objid`,`lob_objid`);

CREATE UNIQUE INDEX `uix_businessid_lobid` ON `business_active_lob` (`businessid`,`lobid`);

CREATE UNIQUE INDEX `uix_businessid` ON `business_closure` (`businessid`);

CREATE UNIQUE INDEX `ux_entityidcard_idtype_idno` ON `entityid` (`idtype`,`idno`);

CREATE INDEX `ix_adminstrator_address_objid` ON `entityjuridical` (`administrator_address_objid`);

CREATE INDEX `ix_taxpayer_name` ON `entitymember` (`member_name`);

CREATE INDEX `ix_lguid` ON `municipality_taxaccount_mapping` (`lguid`);

CREATE UNIQUE INDEX `uix_username` ON `sys_user` (`username`);

CREATE UNIQUE INDEX `uix_user_usergroup_org` ON `sys_usergroup_member` (`user_objid`,`usergroup_objid`,`org_objid`);




--
-- FOREIGN KEYS
--

ALTER TABLE `account_item_mapping` ADD CONSTRAINT `fk_account_item_mapping` 
   FOREIGN KEY (`itemid`) REFERENCES `itemaccount` (`objid`)
;

ALTER TABLE `afrequestitem` ADD CONSTRAINT `fk_afrequestitem_item_objid` 
   FOREIGN KEY (`item_objid`) REFERENCES `af` (`objid`)
;

ALTER TABLE `bankaccount` ADD CONSTRAINT `fk_bankaccount_bank_objid` 
   FOREIGN KEY (`bank_objid`) REFERENCES `bank` (`objid`)
;

ALTER TABLE `bankaccount` ADD CONSTRAINT `fk_bankaccount_fund_objid` 
   FOREIGN KEY (`fund_objid`) REFERENCES `fund` (`objid`)
;

ALTER TABLE `barangay` ADD CONSTRAINT `fk_barangay_objid` 
   FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
;

ALTER TABLE `barcode_launcher` ADD CONSTRAINT `fk_barcode_launcher_collectiontypeid` 
   FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
;

ALTER TABLE `brgyshareitem` ADD CONSTRAINT `fk_brgyshareitem_brgyshare` 
   FOREIGN KEY (`brgyshareid`) REFERENCES `brgyshare` (`objid`)
;

ALTER TABLE `business` ADD CONSTRAINT `fk_business_address_objid` 
   FOREIGN KEY (`address_objid`) REFERENCES `business_address` (`objid`)
;
ALTER TABLE `business` ADD CONSTRAINT `fk_business_currentapplicationid` 
   FOREIGN KEY (`currentapplicationid`) REFERENCES `business_application` (`objid`)
;

set foreign_key_checks=0
;

ALTER TABLE `business` ADD CONSTRAINT `fk_business_owner_address_objid` 
   FOREIGN KEY (`owner_address_objid`) REFERENCES `entity_address` (`objid`)
;
ALTER TABLE `business` ADD CONSTRAINT `fk_business_owner_objid` 
   FOREIGN KEY (`owner_objid`) REFERENCES `entity` (`objid`)
;

ALTER TABLE `business_active_info` ADD CONSTRAINT `fk_business_active_info_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;
ALTER TABLE `business_active_info` ADD CONSTRAINT `fk_business_active_info_lob` 
   FOREIGN KEY (`lob_objid`) REFERENCES `lob` (`objid`)
;

ALTER TABLE `business_active_lob` ADD CONSTRAINT `FK_business_active_lob_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;
ALTER TABLE `business_active_lob` ADD CONSTRAINT `FK_business_active_lob_lob` 
   FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
;

ALTER TABLE `business_active_lob_history` ADD CONSTRAINT `fk_business_active_lob_history_businessid` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;
ALTER TABLE `business_active_lob_history` ADD CONSTRAINT `fk_business_active_lob_history_lobid` 
   FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
;

ALTER TABLE `business_address` ADD CONSTRAINT `FK_business_address_ownerid` 
   FOREIGN KEY (`ownedaddressid`) REFERENCES `business_lessor` (`objid`)
;
ALTER TABLE `business_address` ADD CONSTRAINT `FK_business_address_rentedaddressid` 
   FOREIGN KEY (`rentedaddressid`) REFERENCES `business_lessor` (`objid`)
;

ALTER TABLE `business_application` ADD CONSTRAINT `fk_business_application_business_objid` 
   FOREIGN KEY (`business_objid`) REFERENCES `business` (`objid`)
;
ALTER TABLE `business_application` ADD CONSTRAINT `fk_business_application_parentapplicationid` 
   FOREIGN KEY (`parentapplicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_application` ADD CONSTRAINT `fk_business_application_permit_objid` 
   FOREIGN KEY (`permit_objid`) REFERENCES `business_permit` (`objid`)
;

ALTER TABLE `business_application_info` ADD CONSTRAINT `fk_business_application_info_applicationid` 
   FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_application_info` ADD CONSTRAINT `fk_business_application_info_businessid` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;
ALTER TABLE `business_application_info` ADD CONSTRAINT `fk_business_application_info_lob_objid` 
   FOREIGN KEY (`lob_objid`) REFERENCES `lob` (`objid`)
;

ALTER TABLE `business_application_lob` ADD CONSTRAINT `fk_business_application_lob_applicationid` 
   FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_application_lob` ADD CONSTRAINT `fk_business_application_lob_businessid` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_application_task` ADD CONSTRAINT `fk_business_application_task_application` 
   FOREIGN KEY (`refid`) REFERENCES `business_application` (`objid`)
;

ALTER TABLE `business_application_workitem` ADD CONSTRAINT `fk_business_application_workitem_task` 
   FOREIGN KEY (`taskid`) REFERENCES `business_application_task` (`objid`)
;

ALTER TABLE `business_billing` ADD CONSTRAINT `FK_business_billing_applicationid` 
   FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_billing` ADD CONSTRAINT `FK_business_billing_businessid` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_billing_item` ADD CONSTRAINT `fk_business_billing_item_parent` 
   FOREIGN KEY (`parentid`) REFERENCES `business_billing` (`objid`)
;

ALTER TABLE `business_change_log` ADD CONSTRAINT `FK_business_change_log_applicationid` 
   FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_change_log` ADD CONSTRAINT `FK_business_change_log_businessid` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_compromise` ADD CONSTRAINT `fk_business_compromise_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_payment` ADD CONSTRAINT `fk_business_payment_application` 
   FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_payment` ADD CONSTRAINT `fk_business_payment_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_payment_item` ADD CONSTRAINT `fk_business_payment_item_parent` 
   FOREIGN KEY (`parentid`) REFERENCES `business_payment` (`objid`)
;

ALTER TABLE `business_permit` ADD CONSTRAINT `fk_business_permit_application` 
   FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_permit` ADD CONSTRAINT `fk_business_permit_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_permit_lob` ADD CONSTRAINT `fk_business_permit_lob_lobid` 
   FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
;
ALTER TABLE `business_permit_lob` ADD CONSTRAINT `fk_business_permit_lob_parentid` 
   FOREIGN KEY (`parentid`) REFERENCES `business_permit` (`objid`)
;

ALTER TABLE `business_receivable` ADD CONSTRAINT `fk_business_receivable_account_objid` 
   FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`)
;
ALTER TABLE `business_receivable` ADD CONSTRAINT `fk_business_receivable_application` 
   FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_receivable` ADD CONSTRAINT `fk_business_receivable_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_recurringfee` ADD CONSTRAINT `fk_business_recurringfee_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_redflag` ADD CONSTRAINT `fk_business_redflag_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_requirement` ADD CONSTRAINT `fk_business_requirement_application` 
   FOREIGN KEY (`applicationid`) REFERENCES `business_application` (`objid`)
;
ALTER TABLE `business_requirement` ADD CONSTRAINT `fk_business_requirement_business` 
   FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`)
;

ALTER TABLE `business_taxcredit_item` ADD CONSTRAINT `FK_business_taxcredit_detail_business_taxcredit` 
   FOREIGN KEY (`parentid`) REFERENCES `business_taxcredit` (`objid`)
;

ALTER TABLE `cash_treasury_ledger` ADD CONSTRAINT `fk_cash_treasury_ledger_jevid` 
   FOREIGN KEY (`jevid`) REFERENCES `jev` (`objid`)
;

ALTER TABLE `cashreceipt` ADD CONSTRAINT `fk_cashreceipt_collectiontype_objid` 
   FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`)
;

ALTER TABLE `cashreceipt_burial` ADD CONSTRAINT `fk_cashreceipt_burial_objid` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_cancelseries` ADD CONSTRAINT `fk_cashreceipt_cancelseries_receiptid` 
   FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_cashticket` ADD CONSTRAINT `fk_cashreceipt_cashticket_objid` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_changelog` ADD CONSTRAINT `fk_cashreceipt_changelog_receiptid` 
   FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_ctc_corporate` ADD CONSTRAINT `fk_cashreceipt_ctc_corporate_objid` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_ctc_individual` ADD CONSTRAINT `fk_cashreceipt_ctc_individual_objid` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_largecattleownership` ADD CONSTRAINT `fk_cashreceipt_largecattleownership_objid` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_largecattletransfer` ADD CONSTRAINT `fk_cashreceipt_largecattletransfer_objid` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_marriage` ADD CONSTRAINT `fk_cashreceipt_marriage_objid` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_slaughter` ADD CONSTRAINT `fk_cashreceipt_slaughter_objid` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceipt_void` ADD CONSTRAINT `fk_cashreceipt_void_receiptid` 
   FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceiptitem` ADD CONSTRAINT `fk_cashreceiptitem_item_objid` 
   FOREIGN KEY (`item_objid`) REFERENCES `itemaccount` (`objid`)
;
ALTER TABLE `cashreceiptitem` ADD CONSTRAINT `fk_cashreceiptitem_receiptid` 
   FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceiptitem_discount` ADD CONSTRAINT `fk_cashreceiptitem_discount_receiptid` 
   FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `cashreceiptpayment_noncash` ADD CONSTRAINT `fk_cashreceiptpayment_noncash_receiptid` 
   FOREIGN KEY (`receiptid`) REFERENCES `cashreceipt` (`objid`)
;

ALTER TABLE `city` ADD CONSTRAINT `fk_city_org` 
   FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
;

ALTER TABLE `collectiontype_account` ADD CONSTRAINT `fk_collectiontype_account_parentid` 
   FOREIGN KEY (`collectiontypeid`) REFERENCES `collectiontype` (`objid`)
;

ALTER TABLE `creditmemotype_account` ADD CONSTRAINT `fk_creditmemotype_account_account_objid` 
   FOREIGN KEY (`account_objid`) REFERENCES `itemaccount` (`objid`)
;
ALTER TABLE `creditmemotype_account` ADD CONSTRAINT `fk_creditmemotype_account_typeid` 
   FOREIGN KEY (`typeid`) REFERENCES `creditmemotype` (`objid`)
;

ALTER TABLE `entityindividual` ADD CONSTRAINT `fk_entityindividual_profileid` 
   FOREIGN KEY (`profileid`) REFERENCES `entityprofile` (`objid`)
;

ALTER TABLE `entitymultiple` ADD CONSTRAINT `fk_entitymultiple_objid` 
   FOREIGN KEY (`objid`) REFERENCES `entity` (`objid`)
;

ALTER TABLE `itemaccount` ADD CONSTRAINT `fk_itemaccount_org_objid` 
   FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`)
;

ALTER TABLE `itemaccount_tag` ADD CONSTRAINT `fk_itemaccount_tag_acctid` 
   FOREIGN KEY (`acctid`) REFERENCES `itemaccount` (`objid`)
;

ALTER TABLE `lob` ADD CONSTRAINT `fk_lob_classification_objid` 
   FOREIGN KEY (`classification_objid`) REFERENCES `lobclassification` (`objid`)
;

ALTER TABLE `lob_lobattribute` ADD CONSTRAINT `fk_lob_lobattribute_lobattributeid` 
   FOREIGN KEY (`lobattributeid`) REFERENCES `lobattribute` (`objid`)
;
ALTER TABLE `lob_lobattribute` ADD CONSTRAINT `fk_lob_lobattribute_lobid` 
   FOREIGN KEY (`lobid`) REFERENCES `lob` (`objid`)
;

ALTER TABLE `lob_report_category` ADD CONSTRAINT `fk_lob_report_category_groupid` 
   FOREIGN KEY (`groupid`) REFERENCES `lob_report_group` (`objid`)
;

ALTER TABLE `lob_report_category_mapping` ADD CONSTRAINT `fk_lob_report_category_mapping_categoryid` 
   FOREIGN KEY (`categoryid`) REFERENCES `lob_report_category` (`objid`)
;

ALTER TABLE `municipality` ADD CONSTRAINT `fk_municipality_org` 
   FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
;

ALTER TABLE `paymentorder_type` ADD CONSTRAINT `fk_paymentorder_type_barcodeid` 
   FOREIGN KEY (`barcodeid`) REFERENCES `barcode_launcher` (`objid`)
;
ALTER TABLE `paymentorder_type` ADD CONSTRAINT `fk_paymentorder_type_collectiontype_objid` 
   FOREIGN KEY (`collectiontype_objid`) REFERENCES `collectiontype` (`objid`)
;

ALTER TABLE `province` ADD CONSTRAINT `fk_province_org` 
   FOREIGN KEY (`objid`) REFERENCES `sys_org` (`objid`)
;


ALTER TABLE `realproperty` ADD CONSTRAINT `FK_realproperty_barangayid` 
   FOREIGN KEY (`barangayid`) REFERENCES `barangay` (`objid`)
;

ALTER TABLE `remittance` ADD CONSTRAINT `fk_remittance_collector_objid` 
   FOREIGN KEY (`collector_objid`) REFERENCES `sys_user` (`objid`)
;
ALTER TABLE `remittance` ADD CONSTRAINT `fk_remittance_liquidatingofficer_objid` 
   FOREIGN KEY (`liquidatingofficer_objid`) REFERENCES `sys_user` (`objid`)
;

ALTER TABLE `remittance_af` ADD CONSTRAINT `fk_remittance_af_remittanceid` 
   FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
;

ALTER TABLE `remittance_fund` ADD CONSTRAINT `fk_remittance_fund_remittanceid` 
   FOREIGN KEY (`remittanceid`) REFERENCES `remittance` (`objid`)
;

ALTER TABLE `subcollector_remittance_cashreceipt` ADD CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_1` 
   FOREIGN KEY (`objid`) REFERENCES `cashreceipt` (`objid`)
;
ALTER TABLE `subcollector_remittance_cashreceipt` ADD CONSTRAINT `subcollector_remittance_cashreceipt_ibfk_2` 
   FOREIGN KEY (`remittanceid`) REFERENCES `subcollector_remittance` (`objid`)
;

ALTER TABLE `sys_org` ADD CONSTRAINT `fk_sys_org_orgclass` 
   FOREIGN KEY (`orgclass`) REFERENCES `sys_orgclass` (`name`)
;
ALTER TABLE `sys_org` ADD CONSTRAINT `fk_sys_org_parent_objid` 
   FOREIGN KEY (`parent_objid`) REFERENCES `sys_org` (`objid`)
;
ALTER TABLE `sys_org` ADD CONSTRAINT `fk_sys_org_parent_orgclass` 
   FOREIGN KEY (`parent_orgclass`) REFERENCES `sys_orgclass` (`name`)
;

ALTER TABLE `sys_report_admin` ADD CONSTRAINT `fk_sys_report_admin_reportfolderid` 
   FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`)
;
ALTER TABLE `sys_report_admin` ADD CONSTRAINT `fk_sys_report_admin_userid` 
   FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`)
;

ALTER TABLE `sys_report_member` ADD CONSTRAINT `fk_sys_report_member_reportfolderid` 
   FOREIGN KEY (`reportfolderid`) REFERENCES `sys_report_folder` (`objid`)
;
ALTER TABLE `sys_report_member` ADD CONSTRAINT `fk_sys_report_member_usergroupid` 
   FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
;
ALTER TABLE `sys_report_member` ADD CONSTRAINT `fk_sys_report_member_userid` 
   FOREIGN KEY (`userid`) REFERENCES `sys_user` (`objid`)
;

ALTER TABLE `sys_rule` ADD CONSTRAINT `fk_sys_rule_rulegroup_ruleset` 
   FOREIGN KEY (`rulegroup`,`ruleset`) REFERENCES `sys_rulegroup` (`name`,`ruleset`)
;
ALTER TABLE `sys_rule` ADD CONSTRAINT `fk_sys_rule_ruleset` 
   FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
;

ALTER TABLE `sys_rule_action` ADD CONSTRAINT `fk_sys_rule_action_parentid` 
   FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
;

ALTER TABLE `sys_rule_action_param` ADD CONSTRAINT `fk_sys_rule_action_param_parentid` 
   FOREIGN KEY (`parentid`) REFERENCES `sys_rule_action` (`objid`)
;
ALTER TABLE `sys_rule_action_param` ADD CONSTRAINT `fk_sys_rule_action_param_var_objid` 
   FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
;

ALTER TABLE `sys_rule_actiondef_param` ADD CONSTRAINT `fk_sys_rule_actiondef_param_parentid` 
   FOREIGN KEY (`parentid`) REFERENCES `sys_rule_actiondef` (`objid`)
;

ALTER TABLE `sys_rule_condition` ADD CONSTRAINT `fk_sys_rule_condition_fact_objid` 
   FOREIGN KEY (`fact_objid`) REFERENCES `sys_rule_fact` (`objid`)
;
ALTER TABLE `sys_rule_condition` ADD CONSTRAINT `fk_sys_rule_condition_parentid` 
   FOREIGN KEY (`parentid`) REFERENCES `sys_rule` (`objid`)
;

ALTER TABLE `sys_rule_condition_constraint` ADD CONSTRAINT `fk_sys_rule_condition_constraint_parentid` 
   FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
;
ALTER TABLE `sys_rule_condition_constraint` ADD CONSTRAINT `fk_sys_rule_condition_constraint_var_objid` 
   FOREIGN KEY (`var_objid`) REFERENCES `sys_rule_condition_var` (`objid`)
;

ALTER TABLE `sys_rule_condition_var` ADD CONSTRAINT `fk_sys_rule_condition_var_parentid` 
   FOREIGN KEY (`parentid`) REFERENCES `sys_rule_condition` (`objid`)
;

ALTER TABLE `sys_rule_deployed` ADD CONSTRAINT `fk_sys_rule_deployed_objid` 
   FOREIGN KEY (`objid`) REFERENCES `sys_rule` (`objid`)
;

ALTER TABLE `sys_rule_fact_field` ADD CONSTRAINT `fk_sys_rule_fact_field_parentid` 
   FOREIGN KEY (`parentid`) REFERENCES `sys_rule_fact` (`objid`)
;

ALTER TABLE `sys_rulegroup` ADD CONSTRAINT `fk_sys_rulegroup_ruleset` 
   FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
;

ALTER TABLE `sys_ruleset_actiondef` ADD CONSTRAINT `fk_sys_ruleset_actiondef_ruleset` 
   FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
;

ALTER TABLE `sys_ruleset_fact` ADD CONSTRAINT `fk_sys_ruleset_fact_ruleset` 
   FOREIGN KEY (`ruleset`) REFERENCES `sys_ruleset` (`name`)
;

ALTER TABLE `sys_securitygroup` ADD CONSTRAINT `fk_sys_securitygroup_usergroup_objid` 
   FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
;

ALTER TABLE `sys_usergroup_admin` ADD CONSTRAINT `fk_sys_usergroup_admin_user_objid` 
   FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`)
;
ALTER TABLE `sys_usergroup_admin` ADD CONSTRAINT `fk_sys_usergroup_admin_usergroupid` 
   FOREIGN KEY (`usergroupid`) REFERENCES `sys_usergroup` (`objid`)
;

ALTER TABLE `sys_usergroup_member` ADD CONSTRAINT `fk_sys_usergroup_member_org_objid` 
   FOREIGN KEY (`org_objid`) REFERENCES `sys_org` (`objid`)
;
ALTER TABLE `sys_usergroup_member` ADD CONSTRAINT `fk_sys_usergroup_member_securitygroup_objid` 
   FOREIGN KEY (`securitygroup_objid`) REFERENCES `sys_securitygroup` (`objid`)
;
ALTER TABLE `sys_usergroup_member` ADD CONSTRAINT `fk_sys_usergroup_member_user_objid` 
   FOREIGN KEY (`user_objid`) REFERENCES `sys_user` (`objid`)
;
ALTER TABLE `sys_usergroup_member` ADD CONSTRAINT `fk_sys_usergroup_member_usergroup_objid` 
   FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
;

ALTER TABLE `sys_usergroup_permission` ADD CONSTRAINT `fk_sys_usergroup_permission_usergroup_objid` 
   FOREIGN KEY (`usergroup_objid`) REFERENCES `sys_usergroup` (`objid`)
;

ALTER TABLE `sys_wf_subtask` ADD CONSTRAINT `fk_sys_wf_subtask_taskid` 
   FOREIGN KEY (`taskid`) REFERENCES `sys_wf_task` (`objid`)
;

ALTER TABLE `sys_wf_transition` ADD CONSTRAINT `fk_sys_wf_transition_parentid_processname` 
   FOREIGN KEY (`parentid`,`processname`) REFERENCES `sys_wf_node` (`name`,`processname`)
;

ALTER TABLE `sys_wf_workitemtype` ADD CONSTRAINT `fk_sys_wf_workitemtype_state_processname` 
   FOREIGN KEY (`state`,`processname`) REFERENCES `sys_wf_node` (`name`,`processname`)
;

set foreign_key_checks=1
;
