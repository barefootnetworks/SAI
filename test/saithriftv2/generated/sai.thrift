/*******************************************************************************
 * BAREFOOT NETWORKS CONFIDENTIAL & PROPRIETARY
 *
 * Copyright (c) 2015-2019 Barefoot Networks, Inc.

 * All Rights Reserved.
 *
 * NOTICE: All information contained herein is, and remains the property of
 * Barefoot Networks, Inc. and its suppliers, if any. The intellectual and
 * technical concepts contained herein are proprietary to Barefoot Networks,
 * Inc.
 * and its suppliers and may be covered by U.S. and Foreign Patents, patents in
 * process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material is
 * strictly forbidden unless prior written permission is obtained from
 * Barefoot Networks, Inc.
 *
 * No warranty, explicit or implicit is provided, unless granted under a
 * written agreement with Barefoot Networks, Inc.
 *
 * $Id: $
 *
 ******************************************************************************/

/*
Copyright 2013-present Barefoot Networks, Inc.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

namespace py sai
namespace cpp sai


// common types
typedef i32 sai_thrift_int;

typedef i32 sai_thrift_api_t;
typedef i32 sai_thrift_log_level_t;
typedef i32 sai_thrift_attr_value_type_t;
typedef i32 sai_thrift_attr_flags_t;
typedef i32 sai_thrift_default_value_type_t;
typedef i32 sai_thrift_attr_condition_type_t;
typedef i32 sai_thrift_status_t;
typedef i32 sai_thrift_switch_profile_id_t;
typedef i16 sai_thrift_vlan_id_t;
typedef i32 sai_thrift_attr_id_t;
typedef i8 sai_thrift_cos_t;
typedef i8 sai_thrift_queue_index_t;
typedef string sai_thrift_mac_t;
typedef string sai_thrift_ip4_t;
typedef string sai_thrift_ip6_t;
typedef i32 sai_thrift_switch_hash_seed_t;
typedef i32 sai_thrift_label_id_t;
typedef i32 sai_thrift_stat_id_t;
typedef i8 sai_thrift_macsec_sak_t;
typedef i8 sai_thrift_macsec_auth_key_t;
typedef i8 sai_thrift_macsec_salt_t;
typedef i64 sai_thrift_uint64_t;
typedef i64 sai_thrift_int64_t;
typedef i32 sai_thrift_uint32_t;
typedef i32 sai_thrift_int32_t;
typedef i16 sai_thrift_uint16_t;
typedef i16 sai_thrift_int16_t;
typedef i8 sai_thrift_uint8_t;
typedef i8 sai_thrift_int8_t;
typedef i64 sai_thrift_size_t;
typedef i64 sai_thrift_object_id_t;
typedef i64 sai_thrift_pointer_t;
typedef i32 sai_thrift_common_api_t;
typedef i32 sai_thrift_object_type_t;
typedef i32 sai_thrift_ip_addr_family_t;
typedef i32 sai_thrift_port_prbs_rx_status_t;
typedef i32 sai_thrift_packet_color_t;
typedef i32 sai_thrift_acl_stage_t;
typedef i32 sai_thrift_acl_bind_point_type_t;
typedef i32 sai_thrift_tam_bind_point_type_t;
typedef i32 sai_thrift_tlv_type_t;
typedef i32 sai_thrift_outseg_type_t;
typedef i32 sai_thrift_outseg_ttl_mode_t;
typedef i32 sai_thrift_outseg_exp_mode_t;
typedef i32 sai_thrift_port_err_status_t;
typedef i32 sai_thrift_bulk_op_error_mode_t;
typedef i32 sai_thrift_stats_mode_t;

// acl API types
typedef sai_thrift_int32_t sai_thrift_acl_ip_type_t;
typedef sai_thrift_int32_t sai_thrift_acl_ip_frag_t;
typedef sai_thrift_int32_t sai_thrift_acl_dtel_flow_op_t;
typedef sai_thrift_int32_t sai_thrift_acl_action_type_t;
typedef sai_thrift_int32_t sai_thrift_acl_table_group_type_t;
typedef sai_thrift_int32_t sai_thrift_acl_table_group_attr_t;
typedef sai_thrift_int32_t sai_thrift_acl_table_group_member_attr_t;
typedef sai_thrift_int32_t sai_thrift_acl_table_attr_t;
typedef sai_thrift_int32_t sai_thrift_acl_entry_attr_t;
typedef sai_thrift_int32_t sai_thrift_acl_counter_attr_t;
typedef sai_thrift_int32_t sai_thrift_acl_range_type_t;
typedef sai_thrift_int32_t sai_thrift_acl_range_attr_t;

// bfd API types
typedef sai_thrift_int32_t sai_thrift_bfd_session_type_t;
typedef sai_thrift_int32_t sai_thrift_bfd_session_offload_type_t;
typedef sai_thrift_int32_t sai_thrift_bfd_encapsulation_type_t;
typedef sai_thrift_int32_t sai_thrift_bfd_session_state_t;
typedef sai_thrift_int32_t sai_thrift_bfd_session_attr_t;
typedef sai_thrift_int32_t sai_thrift_bfd_session_stat_t;

// bridge API types
typedef sai_thrift_int32_t sai_thrift_bridge_port_fdb_learning_mode_t;
typedef sai_thrift_int32_t sai_thrift_bridge_port_type_t;
typedef sai_thrift_int32_t sai_thrift_bridge_port_tagging_mode_t;
typedef sai_thrift_int32_t sai_thrift_bridge_port_attr_t;
typedef sai_thrift_int32_t sai_thrift_bridge_port_stat_t;
typedef sai_thrift_int32_t sai_thrift_bridge_type_t;
typedef sai_thrift_int32_t sai_thrift_bridge_flood_control_type_t;
typedef sai_thrift_int32_t sai_thrift_bridge_attr_t;
typedef sai_thrift_int32_t sai_thrift_bridge_stat_t;

// buffer API types
typedef sai_thrift_int32_t sai_thrift_ingress_priority_group_attr_t;
typedef sai_thrift_int32_t sai_thrift_ingress_priority_group_stat_t;
typedef sai_thrift_int32_t sai_thrift_buffer_pool_type_t;
typedef sai_thrift_int32_t sai_thrift_buffer_pool_threshold_mode_t;
typedef sai_thrift_int32_t sai_thrift_buffer_pool_attr_t;
typedef sai_thrift_int32_t sai_thrift_buffer_pool_stat_t;
typedef sai_thrift_int32_t sai_thrift_buffer_profile_threshold_mode_t;
typedef sai_thrift_int32_t sai_thrift_buffer_profile_attr_t;

// counter API types
typedef sai_thrift_int32_t sai_thrift_counter_type_t;
typedef sai_thrift_int32_t sai_thrift_counter_attr_t;
typedef sai_thrift_int32_t sai_thrift_counter_stat_t;

// debug_counter API types
typedef sai_thrift_int32_t sai_thrift_debug_counter_type_t;
typedef sai_thrift_int32_t sai_thrift_debug_counter_bind_method_t;
typedef sai_thrift_int32_t sai_thrift_in_drop_reason_t;
typedef sai_thrift_int32_t sai_thrift_out_drop_reason_t;
typedef sai_thrift_int32_t sai_thrift_debug_counter_attr_t;

// dtel API types
typedef sai_thrift_int32_t sai_thrift_dtel_attr_t;
typedef sai_thrift_int32_t sai_thrift_dtel_queue_report_attr_t;
typedef sai_thrift_int32_t sai_thrift_dtel_int_session_attr_t;
typedef sai_thrift_int32_t sai_thrift_dtel_report_session_attr_t;
typedef sai_thrift_int32_t sai_thrift_dtel_event_type_t;
typedef sai_thrift_int32_t sai_thrift_dtel_event_attr_t;

// fdb API types
typedef sai_thrift_int32_t sai_thrift_fdb_entry_type_t;
typedef sai_thrift_int32_t sai_thrift_fdb_event_t;
typedef sai_thrift_int32_t sai_thrift_fdb_entry_attr_t;
typedef sai_thrift_int32_t sai_thrift_fdb_flush_entry_type_t;
typedef sai_thrift_int32_t sai_thrift_fdb_flush_attr_t;

// hash API types
typedef sai_thrift_int32_t sai_thrift_native_hash_field_t;
typedef sai_thrift_int32_t sai_thrift_fine_grained_hash_field_attr_t;
typedef sai_thrift_int32_t sai_thrift_hash_attr_t;

// hostif API types
typedef sai_thrift_int32_t sai_thrift_hostif_trap_group_attr_t;
typedef sai_thrift_int32_t sai_thrift_hostif_trap_type_t;
typedef sai_thrift_int32_t sai_thrift_hostif_trap_attr_t;
typedef sai_thrift_int32_t sai_thrift_hostif_user_defined_trap_type_t;
typedef sai_thrift_int32_t sai_thrift_hostif_user_defined_trap_attr_t;
typedef sai_thrift_int32_t sai_thrift_hostif_type_t;
typedef sai_thrift_int32_t sai_thrift_hostif_vlan_tag_t;
typedef sai_thrift_int32_t sai_thrift_hostif_attr_t;
typedef sai_thrift_int32_t sai_thrift_hostif_table_entry_type_t;
typedef sai_thrift_int32_t sai_thrift_hostif_table_entry_channel_type_t;
typedef sai_thrift_int32_t sai_thrift_hostif_table_entry_attr_t;
typedef sai_thrift_int32_t sai_thrift_hostif_tx_type_t;
typedef sai_thrift_int32_t sai_thrift_hostif_packet_attr_t;

// ipmc API types
typedef sai_thrift_int32_t sai_thrift_ipmc_entry_type_t;
typedef sai_thrift_int32_t sai_thrift_ipmc_entry_attr_t;

// ipmc_group API types
typedef sai_thrift_int32_t sai_thrift_ipmc_group_attr_t;
typedef sai_thrift_int32_t sai_thrift_ipmc_group_member_attr_t;

// isolation_group API types
typedef sai_thrift_int32_t sai_thrift_isolation_group_type_t;
typedef sai_thrift_int32_t sai_thrift_isolation_group_attr_t;
typedef sai_thrift_int32_t sai_thrift_isolation_group_member_attr_t;

// l2mc API types
typedef sai_thrift_int32_t sai_thrift_l2mc_entry_type_t;
typedef sai_thrift_int32_t sai_thrift_l2mc_entry_attr_t;

// l2mc_group API types
typedef sai_thrift_int32_t sai_thrift_l2mc_group_attr_t;
typedef sai_thrift_int32_t sai_thrift_l2mc_group_member_attr_t;

// lag API types
typedef sai_thrift_int32_t sai_thrift_lag_attr_t;
typedef sai_thrift_int32_t sai_thrift_lag_member_attr_t;

// macsec API types
typedef sai_thrift_int32_t sai_thrift_macsec_direction_t;
typedef sai_thrift_int32_t sai_thrift_macsec_cipher_suite_t;
typedef sai_thrift_int32_t sai_thrift_macsec_attr_t;
typedef sai_thrift_int32_t sai_thrift_macsec_port_attr_t;
typedef sai_thrift_int32_t sai_thrift_macsec_port_stat_t;
typedef sai_thrift_int32_t sai_thrift_macsec_flow_attr_t;
typedef sai_thrift_int32_t sai_thrift_macsec_flow_stat_t;
typedef sai_thrift_int32_t sai_thrift_macsec_sc_attr_t;
typedef sai_thrift_int32_t sai_thrift_macsec_sc_stat_t;
typedef sai_thrift_int32_t sai_thrift_macsec_sa_attr_t;
typedef sai_thrift_int32_t sai_thrift_macsec_sa_stat_t;

// mcast_fdb API types
typedef sai_thrift_int32_t sai_thrift_mcast_fdb_entry_attr_t;

// mirror API types
typedef sai_thrift_int32_t sai_thrift_mirror_session_type_t;
typedef sai_thrift_int32_t sai_thrift_erspan_encapsulation_type_t;
typedef sai_thrift_int32_t sai_thrift_mirror_session_congestion_mode_t;
typedef sai_thrift_int32_t sai_thrift_mirror_session_attr_t;

// mpls API types
typedef sai_thrift_int32_t sai_thrift_inseg_entry_psc_type_t;
typedef sai_thrift_int32_t sai_thrift_inseg_entry_pop_ttl_mode_t;
typedef sai_thrift_int32_t sai_thrift_inseg_entry_pop_qos_mode_t;
typedef sai_thrift_int32_t sai_thrift_inseg_entry_attr_t;

// nat API types
typedef sai_thrift_int32_t sai_thrift_nat_type_t;
typedef sai_thrift_int32_t sai_thrift_nat_entry_attr_t;
typedef sai_thrift_int32_t sai_thrift_nat_zone_counter_attr_t;

// neighbor API types
typedef sai_thrift_int32_t sai_thrift_neighbor_entry_attr_t;

// next_hop API types
typedef sai_thrift_int32_t sai_thrift_next_hop_type_t;
typedef sai_thrift_int32_t sai_thrift_next_hop_endpoint_type_t;
typedef sai_thrift_int32_t sai_thrift_next_hop_endpoint_pop_type_t;
typedef sai_thrift_int32_t sai_thrift_next_hop_attr_t;

// next_hop_group API types
typedef sai_thrift_int32_t sai_thrift_next_hop_group_type_t;
typedef sai_thrift_int32_t sai_thrift_next_hop_group_member_configured_role_t;
typedef sai_thrift_int32_t sai_thrift_next_hop_group_member_observed_role_t;
typedef sai_thrift_int32_t sai_thrift_next_hop_group_attr_t;
typedef sai_thrift_int32_t sai_thrift_next_hop_group_member_attr_t;

// policer API types
typedef sai_thrift_int32_t sai_thrift_meter_type_t;
typedef sai_thrift_int32_t sai_thrift_policer_mode_t;
typedef sai_thrift_int32_t sai_thrift_policer_color_source_t;
typedef sai_thrift_int32_t sai_thrift_policer_attr_t;
typedef sai_thrift_int32_t sai_thrift_policer_stat_t;

// port API types
typedef sai_thrift_int32_t sai_thrift_port_type_t;
typedef sai_thrift_int32_t sai_thrift_port_oper_status_t;
typedef sai_thrift_int32_t sai_thrift_port_flow_control_mode_t;
typedef sai_thrift_int32_t sai_thrift_port_internal_loopback_mode_t;
typedef sai_thrift_int32_t sai_thrift_port_media_type_t;
typedef sai_thrift_int32_t sai_thrift_port_breakout_mode_type_t;
typedef sai_thrift_int32_t sai_thrift_port_fec_mode_t;
typedef sai_thrift_int32_t sai_thrift_port_priority_flow_control_mode_t;
typedef sai_thrift_int32_t sai_thrift_port_ptp_mode_t;
typedef sai_thrift_int32_t sai_thrift_port_interface_type_t;
typedef sai_thrift_int32_t sai_thrift_port_link_training_failure_status_t;
typedef sai_thrift_int32_t sai_thrift_port_link_training_rx_status_t;
typedef sai_thrift_int32_t sai_thrift_port_prbs_config_t;
typedef sai_thrift_int32_t sai_thrift_port_connector_failover_mode_t;
typedef sai_thrift_int32_t sai_thrift_port_attr_t;
typedef sai_thrift_int32_t sai_thrift_port_stat_t;
typedef sai_thrift_int32_t sai_thrift_port_pool_attr_t;
typedef sai_thrift_int32_t sai_thrift_port_pool_stat_t;
typedef sai_thrift_int32_t sai_thrift_port_serdes_attr_t;
typedef sai_thrift_int32_t sai_thrift_port_connector_attr_t;

// qos_map API types
typedef sai_thrift_int32_t sai_thrift_qos_map_type_t;
typedef sai_thrift_int32_t sai_thrift_qos_map_attr_t;

// queue API types
typedef sai_thrift_int32_t sai_thrift_queue_type_t;
typedef sai_thrift_int32_t sai_thrift_queue_attr_t;
typedef sai_thrift_int32_t sai_thrift_queue_stat_t;
typedef sai_thrift_int32_t sai_thrift_queue_pfc_deadlock_event_type_t;

// route API types
typedef sai_thrift_int32_t sai_thrift_route_entry_attr_t;

// router_interface API types
typedef sai_thrift_int32_t sai_thrift_router_interface_type_t;
typedef sai_thrift_int32_t sai_thrift_router_interface_attr_t;
typedef sai_thrift_int32_t sai_thrift_router_interface_stat_t;

// rpf_group API types
typedef sai_thrift_int32_t sai_thrift_rpf_group_attr_t;
typedef sai_thrift_int32_t sai_thrift_rpf_group_member_attr_t;

// samplepacket API types
typedef sai_thrift_int32_t sai_thrift_samplepacket_type_t;
typedef sai_thrift_int32_t sai_thrift_samplepacket_mode_t;
typedef sai_thrift_int32_t sai_thrift_samplepacket_attr_t;

// scheduler API types
typedef sai_thrift_int32_t sai_thrift_scheduling_type_t;
typedef sai_thrift_int32_t sai_thrift_scheduler_attr_t;

// scheduler_group API types
typedef sai_thrift_int32_t sai_thrift_scheduler_group_attr_t;

// segmentroute API types
typedef sai_thrift_int32_t sai_thrift_segmentroute_sidlist_type_t;
typedef sai_thrift_int32_t sai_thrift_segmentroute_sidlist_attr_t;

// stp API types
typedef sai_thrift_int32_t sai_thrift_stp_port_state_t;
typedef sai_thrift_int32_t sai_thrift_stp_attr_t;
typedef sai_thrift_int32_t sai_thrift_stp_port_attr_t;

// switch API types
typedef sai_thrift_int32_t sai_thrift_switch_oper_status_t;
typedef sai_thrift_int32_t sai_thrift_packet_action_t;
typedef sai_thrift_int32_t sai_thrift_packet_vlan_t;
typedef sai_thrift_int32_t sai_thrift_switch_switching_mode_t;
typedef sai_thrift_int32_t sai_thrift_hash_algorithm_t;
typedef sai_thrift_int32_t sai_thrift_switch_restart_type_t;
typedef sai_thrift_int32_t sai_thrift_switch_mcast_snooping_capability_t;
typedef sai_thrift_int32_t sai_thrift_switch_hardware_access_bus_t;
typedef sai_thrift_int32_t sai_thrift_switch_firmware_load_method_t;
typedef sai_thrift_int32_t sai_thrift_switch_firmware_load_type_t;
typedef sai_thrift_int32_t sai_thrift_switch_type_t;
typedef sai_thrift_int32_t sai_thrift_switch_failover_config_mode_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_type_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_vxlan_udp_sport_mode_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_encap_ecn_mode_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_decap_ecn_mode_t;
typedef sai_thrift_int32_t sai_thrift_switch_tunnel_attr_t;
typedef sai_thrift_int32_t sai_thrift_switch_attr_t;
typedef sai_thrift_int32_t sai_thrift_switch_stat_t;

// system_port API types
typedef sai_thrift_int32_t sai_thrift_system_port_type_t;
typedef sai_thrift_int32_t sai_thrift_system_port_attr_t;

// tam API types
typedef sai_thrift_int32_t sai_thrift_tam_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_tel_math_func_type_t;
typedef sai_thrift_int32_t sai_thrift_tam_math_func_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_event_threshold_unit_t;
typedef sai_thrift_int32_t sai_thrift_tam_event_threshold_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_int_type_t;
typedef sai_thrift_int32_t sai_thrift_tam_int_presence_type_t;
typedef sai_thrift_int32_t sai_thrift_tam_int_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_telemetry_type_t;
typedef sai_thrift_int32_t sai_thrift_tam_tel_type_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_report_type_t;
typedef sai_thrift_int32_t sai_thrift_tam_report_mode_t;
typedef sai_thrift_int32_t sai_thrift_tam_report_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_reporting_unit_t;
typedef sai_thrift_int32_t sai_thrift_tam_telemetry_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_transport_type_t;
typedef sai_thrift_int32_t sai_thrift_tam_transport_auth_type_t;
typedef sai_thrift_int32_t sai_thrift_tam_transport_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_collector_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_event_type_t;
typedef sai_thrift_int32_t sai_thrift_tam_event_action_attr_t;
typedef sai_thrift_int32_t sai_thrift_tam_event_attr_t;

// tunnel API types
typedef sai_thrift_int32_t sai_thrift_tunnel_map_type_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_map_entry_attr_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_map_attr_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_ttl_mode_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_dscp_mode_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_peer_mode_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_attr_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_stat_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_term_table_entry_type_t;
typedef sai_thrift_int32_t sai_thrift_tunnel_term_table_entry_attr_t;

// udf API types
typedef sai_thrift_int32_t sai_thrift_udf_base_t;
typedef sai_thrift_int32_t sai_thrift_udf_attr_t;
typedef sai_thrift_int32_t sai_thrift_udf_match_attr_t;
typedef sai_thrift_int32_t sai_thrift_udf_group_type_t;
typedef sai_thrift_int32_t sai_thrift_udf_group_attr_t;

// virtual_router API types
typedef sai_thrift_int32_t sai_thrift_virtual_router_attr_t;

// vlan API types
typedef sai_thrift_int32_t sai_thrift_vlan_tagging_mode_t;
typedef sai_thrift_int32_t sai_thrift_vlan_mcast_lookup_key_type_t;
typedef sai_thrift_int32_t sai_thrift_vlan_flood_control_type_t;
typedef sai_thrift_int32_t sai_thrift_vlan_attr_t;
typedef sai_thrift_int32_t sai_thrift_vlan_member_attr_t;
typedef sai_thrift_int32_t sai_thrift_vlan_stat_t;

// wred API types
typedef sai_thrift_int32_t sai_thrift_ecn_mark_mode_t;
typedef sai_thrift_int32_t sai_thrift_wred_attr_t;


// object API structures
// warning: this struct is invalid and  manually defined - do not use
struct sai_thrift_object_key_entry_t {
    1: i64 object_id;
    2: i64 fdb_entry;
    3: i64 neighbor_entry;
    4: i64 route_entry;
    5: i64 mcast_fdb_entry;
    6: i64 l2mc_entry;
    7: i64 ipmc_entry;
    8: i64 inseg_entry;
    9: i64 nat_entry;
}

struct sai_thrift_object_key_t {
    1: sai_thrift_object_key_entry_t key;
}

struct sai_thrift_attr_capability_t {
    1: bool create_implemented;
    2: bool boolset_implemented;
    3: bool get_implemented;
}


// common types
struct sai_thrift_service_method_table_t {
    1: sai_thrift_pointer_t profile_get_value;
    2: sai_thrift_pointer_t profile_get_next_value;
}

struct sai_thrift_object_meta_key_t {
    1: sai_thrift_object_type_t objecttype;
    2: sai_thrift_object_key_t objectkey;
}

struct sai_thrift_attr_condition_t {
    1: sai_thrift_attr_id_t attrid;
    2: i64 condition;
}

struct sai_thrift_enum_metadata_t {
    1: string name;
    2: sai_thrift_size_t valuescount;
    3: list<sai_thrift_int> values;
    4: string valuesnames;
    5: string valuesshortnames;
    6: bool containsflags;
    7: list<sai_thrift_int> ignorevalues;
    8: string ignorevaluesnames;
}

struct sai_thrift_attr_capability_metadata_t {
    1: sai_thrift_uint64_t vendorid;
    2: sai_thrift_attr_capability_t operationcapability;
    3: sai_thrift_size_t enumvaluescount;
    4: list<sai_thrift_int> enumvalues;
}

struct sai_thrift_attr_metadata_t {
    1: sai_thrift_object_type_t objecttype;
    2: sai_thrift_attr_id_t attrid;
    3: string attridname;
    4: string brief;
    5: sai_thrift_attr_value_type_t attrvaluetype;
    6: sai_thrift_attr_flags_t flags;
    7: list<sai_thrift_object_type_t> allowedobjecttypes;
    8: sai_thrift_size_t allowedobjecttypeslength;
    9: bool allowrepetitiononlist;
    10: bool allowmixedobjecttypes;
    11: bool allowemptylist;
    12: bool allownullobjectid;
    13: bool isoidattribute;
    14: sai_thrift_default_value_type_t defaultvaluetype;
    15: list<sai_thrift_attribute_value_t> defaultvalue;
    16: sai_thrift_object_type_t defaultvalueobjecttype;
    17: sai_thrift_attr_id_t defaultvalueattrid;
    18: bool storedefaultvalue;
    19: bool isenum;
    20: bool isenumlist;
    21: list<sai_thrift_enum_metadata_t> enummetadata;
    22: sai_thrift_attr_condition_type_t conditiontype;
    23: list<sai_thrift_attr_condition_t> conditions;
    24: sai_thrift_size_t conditionslength;
    25: bool isconditional;
    26: sai_thrift_attr_condition_type_t validonlytype;
    27: list<sai_thrift_attr_condition_t> validonly;
    28: sai_thrift_size_t validonlylength;
    29: bool isvalidonly;
    30: bool getsave;
    31: bool isvlan;
    32: bool isaclfield;
    33: bool isaclaction;
    34: bool ismandatoryoncreate;
    35: bool iscreateonly;
    36: bool iscreateandset;
    37: bool isreadonly;
    38: bool iskey;
    39: bool isprimitive;
    40: sai_thrift_int notificationtype;
    41: bool iscallback;
    42: sai_thrift_int pointertype;
    43: list<sai_thrift_attr_capability_metadata_t> capability;
    44: sai_thrift_size_t capabilitylength;
    45: bool isextensionattr;
    46: bool isresourcetype;
    47: bool isdeprecated;
}

struct sai_thrift_struct_member_info_t {
    1: sai_thrift_attr_value_type_t membervaluetype;
    2: string membername;
    3: bool isvlan;
    4: list<sai_thrift_object_type_t> allowedobjecttypes;
    5: sai_thrift_size_t allowedobjecttypeslength;
    6: bool isenum;
    7: list<sai_thrift_enum_metadata_t> enummetadata;
    8: sai_thrift_pointer_t getoid;
    9: sai_thrift_pointer_t setoid;
    10: sai_thrift_size_t offset;
    11: sai_thrift_size_t size;
}

struct sai_thrift_rev_graph_member_t {
    1: sai_thrift_object_type_t objecttype;
    2: sai_thrift_object_type_t depobjecttype;
    3: list<sai_thrift_attr_metadata_t> attrmetadata;
    4: list<sai_thrift_struct_member_info_t> structmember;
}

struct sai_thrift_object_type_info_t {
    1: sai_thrift_object_type_t objecttype;
    2: string objecttypename;
    3: sai_thrift_attr_id_t attridstart;
    4: sai_thrift_attr_id_t attridend;
    5: list<sai_thrift_enum_metadata_t> enummetadata;
    6: list<sai_thrift_attr_metadata_t> attrmetadata;
    7: sai_thrift_size_t attrmetadatalength;
    8: bool isnonobjectid;
    9: bool isobjectid;
    10: list<sai_thrift_struct_member_info_t> structmembers;
    11: sai_thrift_size_t structmemberscount;
    12: list<sai_thrift_rev_graph_member_t> revgraphmembers;
    13: sai_thrift_size_t revgraphmemberscount;
    14: sai_thrift_pointer_t create;
    15: sai_thrift_pointer_t remove;
    16: sai_thrift_pointer_t fnset;
    17: sai_thrift_pointer_t fnget;
    18: sai_thrift_pointer_t getstats;
    19: sai_thrift_pointer_t getstatsext;
    20: sai_thrift_pointer_t clearstats;
    21: bool isexperimental;
    22: list<sai_thrift_enum_metadata_t> statenum;
}

struct sai_thrift_timespec_t {
    1: sai_thrift_uint64_t tv_sec;
    2: sai_thrift_uint32_t tv_nsec;
}

struct sai_thrift_object_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_object_id_t> idlist;
}

struct sai_thrift_u8_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_uint8_t> uint8list;
}

struct sai_thrift_s8_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_int8_t> int8list;
}

struct sai_thrift_u16_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_uint16_t> uint16list;
}

struct sai_thrift_s16_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_int16_t> int16list;
}

struct sai_thrift_u32_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_uint32_t> uint32list;
}

struct sai_thrift_s32_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_int32_t> int32list;
}

struct sai_thrift_u32_range_t {
    1: sai_thrift_uint32_t min;
    2: sai_thrift_uint32_t max;
}

struct sai_thrift_s32_range_t {
    1: sai_thrift_int32_t min;
    2: sai_thrift_int32_t max;
}

struct sai_thrift_vlan_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_vlan_id_t> idlist;
}

struct sai_thrift_ip_addr_t {
    1: sai_thrift_ip4_t ip4;
    2: sai_thrift_ip6_t ip6;
}

struct sai_thrift_ip_address_t {
    1: sai_thrift_ip_addr_family_t addr_family;
    2: sai_thrift_ip_addr_t addr;
}

struct sai_thrift_ip_address_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_ip_address_t> addresslist;
}

struct sai_thrift_ip_prefix_t {
    1: sai_thrift_ip_addr_family_t addr_family;
    2: sai_thrift_ip_addr_t addr;
    3: sai_thrift_ip_addr_t mask;
}

struct sai_thrift_prbs_rx_state_t {
    1: sai_thrift_port_prbs_rx_status_t rx_status;
    2: sai_thrift_uint32_t error_count;
}

struct sai_thrift_acl_field_data_mask_t {
    1: sai_thrift_uint8_t u8;
    2: sai_thrift_int8_t s8;
    3: sai_thrift_uint16_t u16;
    4: sai_thrift_int16_t s16;
    5: sai_thrift_uint32_t u32;
    6: sai_thrift_int32_t s32;
    7: sai_thrift_uint64_t u64;
    8: sai_thrift_mac_t mac;
    9: sai_thrift_ip4_t ip4;
    10: sai_thrift_ip6_t ip6;
    11: sai_thrift_u8_list_t u8list;
}

struct sai_thrift_acl_field_data_data_t {
    1: bool booldata;
    2: sai_thrift_uint8_t u8;
    3: sai_thrift_int8_t s8;
    4: sai_thrift_uint16_t u16;
    5: sai_thrift_int16_t s16;
    6: sai_thrift_uint32_t u32;
    7: sai_thrift_int32_t s32;
    8: sai_thrift_uint64_t u64;
    9: sai_thrift_mac_t mac;
    10: sai_thrift_ip4_t ip4;
    11: sai_thrift_ip6_t ip6;
    12: sai_thrift_object_id_t oid;
    13: sai_thrift_object_list_t objlist;
    14: sai_thrift_u8_list_t u8list;
}

struct sai_thrift_acl_field_data_t {
    1: bool enable;
    2: sai_thrift_acl_field_data_mask_t mask;
    3: sai_thrift_acl_field_data_data_t data;
}

struct sai_thrift_acl_action_parameter_t {
    1: bool booldata;
    2: sai_thrift_uint8_t u8;
    3: sai_thrift_int8_t s8;
    4: sai_thrift_uint16_t u16;
    5: sai_thrift_int16_t s16;
    6: sai_thrift_uint32_t u32;
    7: sai_thrift_int32_t s32;
    8: sai_thrift_mac_t mac;
    9: sai_thrift_ip4_t ip4;
    10: sai_thrift_ip6_t ip6;
    11: sai_thrift_object_id_t oid;
    12: sai_thrift_object_list_t objlist;
    13: sai_thrift_ip_address_t ipaddr;
}

struct sai_thrift_acl_action_data_t {
    1: bool enable;
    2: sai_thrift_acl_action_parameter_t parameter;
}

struct sai_thrift_qos_map_params_t {
    1: sai_thrift_cos_t tc;
    2: sai_thrift_uint8_t dscp;
    3: sai_thrift_uint8_t dot1p;
    4: sai_thrift_uint8_t prio;
    5: sai_thrift_uint8_t pg;
    6: sai_thrift_queue_index_t queue_index;
    7: sai_thrift_packet_color_t color;
    8: sai_thrift_uint8_t mpls_exp;
}

struct sai_thrift_qos_map_t {
    1: sai_thrift_qos_map_params_t key;
    2: sai_thrift_qos_map_params_t value;
}

struct sai_thrift_qos_map_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_qos_map_t> maplist;
}

struct sai_thrift_map_t {
    1: sai_thrift_uint32_t key;
    2: sai_thrift_int32_t value;
}

struct sai_thrift_map_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_map_t> maplist;
}

struct sai_thrift_acl_capability_t {
    1: bool is_action_list_mandatory;
    2: sai_thrift_s32_list_t action_list;
}

struct sai_thrift_acl_resource_t {
    1: sai_thrift_acl_stage_t stage;
    2: sai_thrift_acl_bind_point_type_t bind_point;
    3: sai_thrift_uint32_t avail_num;
}

struct sai_thrift_acl_resource_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_acl_resource_t> resourcelist;
}

struct sai_thrift_hmac_t {
    1: sai_thrift_uint32_t key_id;
    2: list<sai_thrift_uint32_t> hmac;
}

struct sai_thrift_tlv_entry_t {
    1: sai_thrift_ip6_t ingress_node;
    2: sai_thrift_ip6_t egress_node;
    3: list<sai_thrift_uint32_t> opaque_container;
    4: sai_thrift_hmac_t hmac;
}

struct sai_thrift_tlv_t {
    1: sai_thrift_tlv_type_t tlv_type;
    2: sai_thrift_tlv_entry_t entry;
}

struct sai_thrift_tlv_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_tlv_t> tlvlist;
}

struct sai_thrift_segment_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_ip6_t> ip6list;
}

struct sai_thrift_port_lane_eye_values_t {
    1: sai_thrift_uint32_t lane;
    2: sai_thrift_int32_t left;
    3: sai_thrift_int32_t right;
    4: sai_thrift_int32_t up;
    5: sai_thrift_int32_t down;
}

struct sai_thrift_port_eye_values_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_port_lane_eye_values_t> valueslist;
}

struct sai_thrift_system_port_config_t {
    1: sai_thrift_uint32_t port_id;
    2: sai_thrift_uint32_t attached_switch_id;
    3: sai_thrift_uint32_t attached_core_index;
    4: sai_thrift_uint32_t attached_core_port_index;
    5: sai_thrift_uint32_t speed;
    6: sai_thrift_uint32_t num_voq;
}

struct sai_thrift_system_port_config_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_system_port_config_t> configlist;
}

struct sai_thrift_fabric_port_reachability_t {
    1: sai_thrift_uint32_t switch_id;
    2: bool reachable;
}

struct sai_thrift_port_err_status_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_port_err_status_t> statuslist;
}

struct sai_thrift_attribute_value_t {
    1: bool booldata;
    2: string chardata;
    3: sai_thrift_uint8_t u8;
    4: sai_thrift_int8_t s8;
    5: sai_thrift_uint16_t u16;
    6: sai_thrift_int16_t s16;
    7: sai_thrift_uint32_t u32;
    8: sai_thrift_int32_t s32;
    9: sai_thrift_uint64_t u64;
    10: sai_thrift_int64_t s64;
    11: sai_thrift_pointer_t ptr;
    12: sai_thrift_mac_t mac;
    13: sai_thrift_ip4_t ip4;
    14: sai_thrift_ip6_t ip6;
    15: sai_thrift_ip_address_t ipaddr;
    16: sai_thrift_ip_prefix_t ipprefix;
    17: sai_thrift_prbs_rx_state_t rx_state;
    18: sai_thrift_object_id_t oid;
    19: sai_thrift_object_list_t objlist;
    20: sai_thrift_u8_list_t u8list;
    21: sai_thrift_s8_list_t s8list;
    22: sai_thrift_u16_list_t u16list;
    23: sai_thrift_s16_list_t s16list;
    24: sai_thrift_u32_list_t u32list;
    25: sai_thrift_s32_list_t s32list;
    26: sai_thrift_u32_range_t u32range;
    27: sai_thrift_s32_range_t s32range;
    28: sai_thrift_vlan_list_t vlanlist;
    29: sai_thrift_qos_map_list_t qosmap;
    30: sai_thrift_map_list_t maplist;
    31: sai_thrift_acl_field_data_t aclfield;
    32: sai_thrift_acl_action_data_t aclaction;
    33: sai_thrift_acl_capability_t aclcapability;
    34: sai_thrift_acl_resource_list_t aclresource;
    35: sai_thrift_tlv_list_t tlvlist;
    36: sai_thrift_segment_list_t segmentlist;
    37: sai_thrift_ip_address_list_t ipaddrlist;
    38: sai_thrift_port_eye_values_list_t porteyevalues;
    39: sai_thrift_timespec_t timespec;
    40: sai_thrift_macsec_sak_t macsecsak;
    41: sai_thrift_macsec_auth_key_t macsecauthkey;
    42: sai_thrift_macsec_salt_t macsecsalt;
    43: sai_thrift_system_port_config_t sysportconfig;
    44: sai_thrift_system_port_config_list_t sysportconfiglist;
    45: sai_thrift_fabric_port_reachability_t reachability;
    46: sai_thrift_port_err_status_list_t porterror;
}

struct sai_thrift_attribute_t {
    1: sai_thrift_attr_id_t id;
    2: sai_thrift_attribute_value_t value;
}

struct sai_thrift_stat_capability_t {
    1: sai_thrift_stat_id_t stat_enum;
    2: sai_thrift_uint32_t stat_modes;
}

struct sai_thrift_stat_capability_list_t {
    1: sai_thrift_uint32_t count;
    2: list<sai_thrift_stat_capability_t> capabilitylist;
}


// bfd API structures
struct sai_thrift_bfd_session_state_notification_t {
    1: sai_thrift_object_id_t bfd_session_id;
    2: sai_thrift_bfd_session_state_t session_state;
}


// fdb API structures
struct sai_thrift_fdb_entry_t {
    1: sai_thrift_object_id_t switch_id;
    2: sai_thrift_mac_t mac_address;
    3: sai_thrift_object_id_t bv_id;
}

struct sai_thrift_fdb_event_notification_data_t {
    1: sai_thrift_fdb_event_t event_type;
    2: sai_thrift_fdb_entry_t fdb_entry;
    3: sai_thrift_uint32_t attr_count;
    4: list<sai_thrift_attribute_t> attr;
}


// ipmc API structures
struct sai_thrift_ipmc_entry_t {
    1: sai_thrift_object_id_t switch_id;
    2: sai_thrift_object_id_t vr_id;
    3: sai_thrift_ipmc_entry_type_t type;
    4: sai_thrift_ip_address_t destination;
    5: sai_thrift_ip_address_t source;
}


// l2mc API structures
struct sai_thrift_l2mc_entry_t {
    1: sai_thrift_object_id_t switch_id;
    2: sai_thrift_object_id_t bv_id;
    3: sai_thrift_l2mc_entry_type_t type;
    4: sai_thrift_ip_address_t destination;
    5: sai_thrift_ip_address_t source;
}


// mcast_fdb API structures
struct sai_thrift_mcast_fdb_entry_t {
    1: sai_thrift_object_id_t switch_id;
    2: sai_thrift_mac_t mac_address;
    3: sai_thrift_object_id_t bv_id;
}


// mpls API structures
struct sai_thrift_inseg_entry_t {
    1: sai_thrift_object_id_t switch_id;
    2: sai_thrift_label_id_t label;
}


// nat API structures
struct sai_thrift_nat_entry_key_t {
    1: sai_thrift_ip4_t src_ip;
    2: sai_thrift_ip4_t dst_ip;
    3: sai_thrift_uint8_t proto;
    4: sai_thrift_uint16_t l4_src_port;
    5: sai_thrift_uint16_t l4_dst_port;
}

struct sai_thrift_nat_entry_mask_t {
    1: sai_thrift_ip4_t src_ip;
    2: sai_thrift_ip4_t dst_ip;
    3: sai_thrift_uint8_t proto;
    4: sai_thrift_uint16_t l4_src_port;
    5: sai_thrift_uint16_t l4_dst_port;
}

struct sai_thrift_nat_entry_data_t {
    1: sai_thrift_nat_entry_key_t key;
    2: sai_thrift_nat_entry_mask_t mask;
}

struct sai_thrift_nat_entry_t {
    1: sai_thrift_object_id_t switch_id;
    2: sai_thrift_object_id_t vr_id;
    3: sai_thrift_nat_type_t nat_type;
    4: sai_thrift_nat_entry_data_t data;
}


// neighbor API structures
struct sai_thrift_neighbor_entry_t {
    1: sai_thrift_object_id_t switch_id;
    2: sai_thrift_object_id_t rif_id;
    3: sai_thrift_ip_address_t ip_address;
}


// port API structures
struct sai_thrift_port_oper_status_notification_t {
    1: sai_thrift_object_id_t port_id;
    2: sai_thrift_port_oper_status_t port_state;
}


// queue API structures
struct sai_thrift_queue_deadlock_notification_data_t {
    1: sai_thrift_object_id_t queue_id;
    2: sai_thrift_queue_pfc_deadlock_event_type_t event;
    3: bool app_managed_recovery;
}


// route API structures
struct sai_thrift_route_entry_t {
    1: sai_thrift_object_id_t switch_id;
    2: sai_thrift_object_id_t vr_id;
    3: sai_thrift_ip_prefix_t destination;
}



// common attribute list
struct sai_thrift_attribute_list_t {
    1: list<sai_thrift_attribute_t> attr_list;
    2: sai_thrift_int32_t attr_count;
}



// error handling
exception sai_thrift_exception {
    1: sai_thrift_status_t status;
}


service sai_rpc {

    // acl API
    sai_thrift_object_id_t sai_thrift_create_acl_table(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_acl_table(1: sai_thrift_object_id_t acl_table_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_acl_table_attribute(1: sai_thrift_object_id_t acl_table_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_acl_table_attribute(1: sai_thrift_object_id_t acl_table_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_acl_entry(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_acl_entry(1: sai_thrift_object_id_t acl_entry_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_acl_entry_attribute(1: sai_thrift_object_id_t acl_entry_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_acl_entry_attribute(1: sai_thrift_object_id_t acl_entry_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_acl_counter(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_acl_counter(1: sai_thrift_object_id_t acl_counter_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_acl_counter_attribute(1: sai_thrift_object_id_t acl_counter_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_acl_counter_attribute(1: sai_thrift_object_id_t acl_counter_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_acl_range(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_acl_range(1: sai_thrift_object_id_t acl_range_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_acl_range_attribute(1: sai_thrift_object_id_t acl_range_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_acl_range_attribute(1: sai_thrift_object_id_t acl_range_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_acl_table_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_acl_table_group(1: sai_thrift_object_id_t acl_table_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_acl_table_group_attribute(1: sai_thrift_object_id_t acl_table_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_acl_table_group_attribute(1: sai_thrift_object_id_t acl_table_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_acl_table_group_member(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_acl_table_group_member(1: sai_thrift_object_id_t acl_table_group_member_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_acl_table_group_member_attribute(1: sai_thrift_object_id_t acl_table_group_member_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_acl_table_group_member_attribute(1: sai_thrift_object_id_t acl_table_group_member_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // bfd API
    sai_thrift_object_id_t sai_thrift_create_bfd_session(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_bfd_session(1: sai_thrift_object_id_t bfd_session_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_bfd_session_attribute(1: sai_thrift_object_id_t bfd_session_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_bfd_session_attribute(1: sai_thrift_object_id_t bfd_session_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_bfd_session_stats(1: sai_thrift_object_id_t bfd_session_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_bfd_session_stats_ext(1: sai_thrift_object_id_t bfd_session_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_bfd_session_stats(1: sai_thrift_object_id_t bfd_session_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);

    // bridge API
    sai_thrift_object_id_t sai_thrift_create_bridge_port(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_bridge_port(1: sai_thrift_object_id_t bridge_port_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_bridge_port_attribute(1: sai_thrift_object_id_t bridge_port_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_bridge_port_attribute(1: sai_thrift_object_id_t bridge_port_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_bridge_port_stats(1: sai_thrift_object_id_t bridge_port_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_bridge_port_stats_ext(1: sai_thrift_object_id_t bridge_port_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_bridge_port_stats(1: sai_thrift_object_id_t bridge_port_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_bridge(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_bridge(1: sai_thrift_object_id_t bridge_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_bridge_attribute(1: sai_thrift_object_id_t bridge_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_bridge_attribute(1: sai_thrift_object_id_t bridge_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_bridge_stats(1: sai_thrift_object_id_t bridge_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_bridge_stats_ext(1: sai_thrift_object_id_t bridge_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_bridge_stats(1: sai_thrift_object_id_t bridge_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);

    // buffer API
    sai_thrift_object_id_t sai_thrift_create_ingress_priority_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_ingress_priority_group(1: sai_thrift_object_id_t ingress_priority_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_ingress_priority_group_attribute(1: sai_thrift_object_id_t ingress_priority_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_ingress_priority_group_attribute(1: sai_thrift_object_id_t ingress_priority_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_ingress_priority_group_stats(1: sai_thrift_object_id_t ingress_priority_group_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_ingress_priority_group_stats_ext(1: sai_thrift_object_id_t ingress_priority_group_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_ingress_priority_group_stats(1: sai_thrift_object_id_t ingress_priority_group_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_buffer_pool(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_buffer_pool(1: sai_thrift_object_id_t buffer_pool_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_buffer_pool_attribute(1: sai_thrift_object_id_t buffer_pool_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_buffer_pool_attribute(1: sai_thrift_object_id_t buffer_pool_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_buffer_pool_stats(1: sai_thrift_object_id_t buffer_pool_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_buffer_pool_stats_ext(1: sai_thrift_object_id_t buffer_pool_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_buffer_pool_stats(1: sai_thrift_object_id_t buffer_pool_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_buffer_profile(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_buffer_profile(1: sai_thrift_object_id_t buffer_profile_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_buffer_profile_attribute(1: sai_thrift_object_id_t buffer_profile_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_buffer_profile_attribute(1: sai_thrift_object_id_t buffer_profile_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // counter API
    sai_thrift_object_id_t sai_thrift_create_counter(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_counter(1: sai_thrift_object_id_t counter_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_counter_attribute(1: sai_thrift_object_id_t counter_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_counter_attribute(1: sai_thrift_object_id_t counter_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_counter_stats(1: sai_thrift_object_id_t counter_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_counter_stats_ext(1: sai_thrift_object_id_t counter_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_counter_stats(1: sai_thrift_object_id_t counter_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);

    // debug_counter API
    sai_thrift_object_id_t sai_thrift_create_debug_counter(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_debug_counter(1: sai_thrift_object_id_t debug_counter_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_debug_counter_attribute(1: sai_thrift_object_id_t debug_counter_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_debug_counter_attribute(1: sai_thrift_object_id_t debug_counter_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // dtel API
    sai_thrift_object_id_t sai_thrift_create_dtel(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_dtel(1: sai_thrift_object_id_t dtel_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_dtel_attribute(1: sai_thrift_object_id_t dtel_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_dtel_attribute(1: sai_thrift_object_id_t dtel_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_dtel_queue_report(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_dtel_queue_report(1: sai_thrift_object_id_t dtel_queue_report_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_dtel_queue_report_attribute(1: sai_thrift_object_id_t dtel_queue_report_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_dtel_queue_report_attribute(1: sai_thrift_object_id_t dtel_queue_report_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_dtel_int_session(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_dtel_int_session(1: sai_thrift_object_id_t dtel_int_session_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_dtel_int_session_attribute(1: sai_thrift_object_id_t dtel_int_session_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_dtel_int_session_attribute(1: sai_thrift_object_id_t dtel_int_session_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_dtel_report_session(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_dtel_report_session(1: sai_thrift_object_id_t dtel_report_session_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_dtel_report_session_attribute(1: sai_thrift_object_id_t dtel_report_session_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_dtel_report_session_attribute(1: sai_thrift_object_id_t dtel_report_session_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_dtel_event(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_dtel_event(1: sai_thrift_object_id_t dtel_event_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_dtel_event_attribute(1: sai_thrift_object_id_t dtel_event_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_dtel_event_attribute(1: sai_thrift_object_id_t dtel_event_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // fdb API
    void sai_thrift_create_fdb_entry(1: sai_thrift_fdb_entry_t fdb_entry, 2: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_fdb_entry(1: sai_thrift_fdb_entry_t fdb_entry) throws (1: sai_thrift_exception e);
    void sai_thrift_set_fdb_entry_attribute(1: sai_thrift_fdb_entry_t fdb_entry, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_fdb_entry_attribute(1: sai_thrift_fdb_entry_t fdb_entry, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_flush_fdb_entries(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_create_fdb_entry(1: list<sai_thrift_fdb_entry_t> fdb_entry, 2: list<sai_thrift_uint32_t> attr_count, 3: list<sai_thrift_attribute_t> attr_list, 4: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_remove_fdb_entry(1: list<sai_thrift_fdb_entry_t> fdb_entry, 2: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_set_fdb_entry_attribute(1: list<sai_thrift_fdb_entry_t> fdb_entry, 2: list<sai_thrift_attribute_t> attr_list, 3: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_bulk_get_fdb_entry_attribute(1: list<sai_thrift_fdb_entry_t> fdb_entry, 2: list<sai_thrift_uint32_t> attr_count, 3: sai_thrift_attribute_list_t attr_list, 4: sai_thrift_bulk_op_error_mode_t mode, 5: list<sai_thrift_status_t> object_statuses) throws (1: sai_thrift_exception e);

    // hash API
    sai_thrift_object_id_t sai_thrift_create_fine_grained_hash_field(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_fine_grained_hash_field(1: sai_thrift_object_id_t fine_grained_hash_field_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_fine_grained_hash_field_attribute(1: sai_thrift_object_id_t fine_grained_hash_field_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_fine_grained_hash_field_attribute(1: sai_thrift_object_id_t fine_grained_hash_field_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_hash(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_hash(1: sai_thrift_object_id_t hash_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_hash_attribute(1: sai_thrift_object_id_t hash_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_hash_attribute(1: sai_thrift_object_id_t hash_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // hostif API
    sai_thrift_object_id_t sai_thrift_create_hostif_trap_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_hostif_trap_group(1: sai_thrift_object_id_t hostif_trap_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_hostif_trap_group_attribute(1: sai_thrift_object_id_t hostif_trap_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_hostif_trap_group_attribute(1: sai_thrift_object_id_t hostif_trap_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_hostif_trap(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_hostif_trap(1: sai_thrift_object_id_t hostif_trap_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_hostif_trap_attribute(1: sai_thrift_object_id_t hostif_trap_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_hostif_trap_attribute(1: sai_thrift_object_id_t hostif_trap_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_hostif_user_defined_trap(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_hostif_user_defined_trap(1: sai_thrift_object_id_t hostif_user_defined_trap_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_hostif_user_defined_trap_attribute(1: sai_thrift_object_id_t hostif_user_defined_trap_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_hostif_user_defined_trap_attribute(1: sai_thrift_object_id_t hostif_user_defined_trap_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_hostif(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_hostif(1: sai_thrift_object_id_t hostif_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_hostif_attribute(1: sai_thrift_object_id_t hostif_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_hostif_attribute(1: sai_thrift_object_id_t hostif_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_hostif_table_entry(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_hostif_table_entry(1: sai_thrift_object_id_t hostif_table_entry_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_hostif_table_entry_attribute(1: sai_thrift_object_id_t hostif_table_entry_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_hostif_table_entry_attribute(1: sai_thrift_object_id_t hostif_table_entry_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_size_t sai_thrift_recv_hostif_packet(1: sai_thrift_object_id_t hostif_oid, 2: sai_thrift_size_t buffer_size, 3: string buffer, 4: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_send_hostif_packet(1: sai_thrift_object_id_t hostif_oid, 2: sai_thrift_size_t buffer_size, 3: string buffer, 4: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    string sai_thrift_allocate_hostif_packet(1: sai_thrift_object_id_t hostif_oid, 2: sai_thrift_size_t buffer_size, 3: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    string sai_thrift_free_hostif_packet(1: sai_thrift_object_id_t hostif_oid, 2: string buffer) throws (1: sai_thrift_exception e);

    // ipmc API
    void sai_thrift_create_ipmc_entry(1: sai_thrift_ipmc_entry_t ipmc_entry, 2: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_ipmc_entry(1: sai_thrift_ipmc_entry_t ipmc_entry) throws (1: sai_thrift_exception e);
    void sai_thrift_set_ipmc_entry_attribute(1: sai_thrift_ipmc_entry_t ipmc_entry, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_ipmc_entry_attribute(1: sai_thrift_ipmc_entry_t ipmc_entry, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // ipmc_group API
    sai_thrift_object_id_t sai_thrift_create_ipmc_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_ipmc_group(1: sai_thrift_object_id_t ipmc_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_ipmc_group_attribute(1: sai_thrift_object_id_t ipmc_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_ipmc_group_attribute(1: sai_thrift_object_id_t ipmc_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_ipmc_group_member(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_ipmc_group_member(1: sai_thrift_object_id_t ipmc_group_member_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_ipmc_group_member_attribute(1: sai_thrift_object_id_t ipmc_group_member_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_ipmc_group_member_attribute(1: sai_thrift_object_id_t ipmc_group_member_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // isolation_group API
    sai_thrift_object_id_t sai_thrift_create_isolation_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_isolation_group(1: sai_thrift_object_id_t isolation_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_isolation_group_attribute(1: sai_thrift_object_id_t isolation_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_isolation_group_attribute(1: sai_thrift_object_id_t isolation_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_isolation_group_member(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_isolation_group_member(1: sai_thrift_object_id_t isolation_group_member_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_isolation_group_member_attribute(1: sai_thrift_object_id_t isolation_group_member_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_isolation_group_member_attribute(1: sai_thrift_object_id_t isolation_group_member_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // l2mc API
    void sai_thrift_create_l2mc_entry(1: sai_thrift_l2mc_entry_t l2mc_entry, 2: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_l2mc_entry(1: sai_thrift_l2mc_entry_t l2mc_entry) throws (1: sai_thrift_exception e);
    void sai_thrift_set_l2mc_entry_attribute(1: sai_thrift_l2mc_entry_t l2mc_entry, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_l2mc_entry_attribute(1: sai_thrift_l2mc_entry_t l2mc_entry, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // l2mc_group API
    sai_thrift_object_id_t sai_thrift_create_l2mc_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_l2mc_group(1: sai_thrift_object_id_t l2mc_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_l2mc_group_attribute(1: sai_thrift_object_id_t l2mc_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_l2mc_group_attribute(1: sai_thrift_object_id_t l2mc_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_l2mc_group_member(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_l2mc_group_member(1: sai_thrift_object_id_t l2mc_group_member_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_l2mc_group_member_attribute(1: sai_thrift_object_id_t l2mc_group_member_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_l2mc_group_member_attribute(1: sai_thrift_object_id_t l2mc_group_member_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // lag API
    sai_thrift_object_id_t sai_thrift_create_lag(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_lag(1: sai_thrift_object_id_t lag_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_lag_attribute(1: sai_thrift_object_id_t lag_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_lag_attribute(1: sai_thrift_object_id_t lag_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_lag_member(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_lag_member(1: sai_thrift_object_id_t lag_member_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_lag_member_attribute(1: sai_thrift_object_id_t lag_member_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_lag_member_attribute(1: sai_thrift_object_id_t lag_member_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // macsec API
    sai_thrift_object_id_t sai_thrift_create_macsec(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_macsec(1: sai_thrift_object_id_t macsec_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_macsec_attribute(1: sai_thrift_object_id_t macsec_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_macsec_attribute(1: sai_thrift_object_id_t macsec_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_macsec_port(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_macsec_port(1: sai_thrift_object_id_t macsec_port_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_macsec_port_attribute(1: sai_thrift_object_id_t macsec_port_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_macsec_port_attribute(1: sai_thrift_object_id_t macsec_port_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_macsec_port_stats(1: sai_thrift_object_id_t macsec_port_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_macsec_port_stats_ext(1: sai_thrift_object_id_t macsec_port_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_macsec_port_stats(1: sai_thrift_object_id_t macsec_port_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_macsec_flow(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_macsec_flow(1: sai_thrift_object_id_t macsec_flow_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_macsec_flow_attribute(1: sai_thrift_object_id_t macsec_flow_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_macsec_flow_attribute(1: sai_thrift_object_id_t macsec_flow_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_macsec_flow_stats(1: sai_thrift_object_id_t macsec_flow_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_macsec_flow_stats_ext(1: sai_thrift_object_id_t macsec_flow_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_macsec_flow_stats(1: sai_thrift_object_id_t macsec_flow_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_macsec_sc(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_macsec_sc(1: sai_thrift_object_id_t macsec_sc_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_macsec_sc_attribute(1: sai_thrift_object_id_t macsec_sc_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_macsec_sc_attribute(1: sai_thrift_object_id_t macsec_sc_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_macsec_sc_stats(1: sai_thrift_object_id_t macsec_sc_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_macsec_sc_stats_ext(1: sai_thrift_object_id_t macsec_sc_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_macsec_sc_stats(1: sai_thrift_object_id_t macsec_sc_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_macsec_sa(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_macsec_sa(1: sai_thrift_object_id_t macsec_sa_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_macsec_sa_attribute(1: sai_thrift_object_id_t macsec_sa_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_macsec_sa_attribute(1: sai_thrift_object_id_t macsec_sa_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_macsec_sa_stats(1: sai_thrift_object_id_t macsec_sa_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_macsec_sa_stats_ext(1: sai_thrift_object_id_t macsec_sa_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_macsec_sa_stats(1: sai_thrift_object_id_t macsec_sa_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);

    // mcast_fdb API
    void sai_thrift_create_mcast_fdb_entry(1: sai_thrift_mcast_fdb_entry_t mcast_fdb_entry, 2: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_mcast_fdb_entry(1: sai_thrift_mcast_fdb_entry_t mcast_fdb_entry) throws (1: sai_thrift_exception e);
    void sai_thrift_set_mcast_fdb_entry_attribute(1: sai_thrift_mcast_fdb_entry_t mcast_fdb_entry, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_mcast_fdb_entry_attribute(1: sai_thrift_mcast_fdb_entry_t mcast_fdb_entry, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // mirror API
    sai_thrift_object_id_t sai_thrift_create_mirror_session(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_mirror_session(1: sai_thrift_object_id_t mirror_session_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_mirror_session_attribute(1: sai_thrift_object_id_t mirror_session_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_mirror_session_attribute(1: sai_thrift_object_id_t mirror_session_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // mpls API
    void sai_thrift_create_inseg_entry(1: sai_thrift_inseg_entry_t inseg_entry, 2: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_inseg_entry(1: sai_thrift_inseg_entry_t inseg_entry) throws (1: sai_thrift_exception e);
    void sai_thrift_set_inseg_entry_attribute(1: sai_thrift_inseg_entry_t inseg_entry, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_inseg_entry_attribute(1: sai_thrift_inseg_entry_t inseg_entry, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_create_inseg_entry(1: list<sai_thrift_inseg_entry_t> inseg_entry, 2: list<sai_thrift_uint32_t> attr_count, 3: list<sai_thrift_attribute_t> attr_list, 4: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_remove_inseg_entry(1: list<sai_thrift_inseg_entry_t> inseg_entry, 2: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_set_inseg_entry_attribute(1: list<sai_thrift_inseg_entry_t> inseg_entry, 2: list<sai_thrift_attribute_t> attr_list, 3: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_bulk_get_inseg_entry_attribute(1: list<sai_thrift_inseg_entry_t> inseg_entry, 2: list<sai_thrift_uint32_t> attr_count, 3: sai_thrift_attribute_list_t attr_list, 4: sai_thrift_bulk_op_error_mode_t mode, 5: list<sai_thrift_status_t> object_statuses) throws (1: sai_thrift_exception e);

    // nat API
    void sai_thrift_create_nat_entry(1: sai_thrift_nat_entry_t nat_entry, 2: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_nat_entry(1: sai_thrift_nat_entry_t nat_entry) throws (1: sai_thrift_exception e);
    void sai_thrift_set_nat_entry_attribute(1: sai_thrift_nat_entry_t nat_entry, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_nat_entry_attribute(1: sai_thrift_nat_entry_t nat_entry, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_create_nat_entry(1: list<sai_thrift_nat_entry_t> nat_entry, 2: list<sai_thrift_uint32_t> attr_count, 3: list<sai_thrift_attribute_t> attr_list, 4: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_remove_nat_entry(1: list<sai_thrift_nat_entry_t> nat_entry, 2: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_set_nat_entry_attribute(1: list<sai_thrift_nat_entry_t> nat_entry, 2: list<sai_thrift_attribute_t> attr_list, 3: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_bulk_get_nat_entry_attribute(1: list<sai_thrift_nat_entry_t> nat_entry, 2: list<sai_thrift_uint32_t> attr_count, 3: sai_thrift_attribute_list_t attr_list, 4: sai_thrift_bulk_op_error_mode_t mode, 5: list<sai_thrift_status_t> object_statuses) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_nat_zone_counter(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_nat_zone_counter(1: sai_thrift_object_id_t nat_zone_counter_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_nat_zone_counter_attribute(1: sai_thrift_object_id_t nat_zone_counter_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_nat_zone_counter_attribute(1: sai_thrift_object_id_t nat_zone_counter_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // neighbor API
    void sai_thrift_create_neighbor_entry(1: sai_thrift_neighbor_entry_t neighbor_entry, 2: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_neighbor_entry(1: sai_thrift_neighbor_entry_t neighbor_entry) throws (1: sai_thrift_exception e);
    void sai_thrift_set_neighbor_entry_attribute(1: sai_thrift_neighbor_entry_t neighbor_entry, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_neighbor_entry_attribute(1: sai_thrift_neighbor_entry_t neighbor_entry, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_all_neighbor_entries() throws (1: sai_thrift_exception e);

    // next_hop API
    sai_thrift_object_id_t sai_thrift_create_next_hop(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_next_hop(1: sai_thrift_object_id_t next_hop_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_next_hop_attribute(1: sai_thrift_object_id_t next_hop_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_next_hop_attribute(1: sai_thrift_object_id_t next_hop_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // next_hop_group API
    sai_thrift_object_id_t sai_thrift_create_next_hop_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_next_hop_group(1: sai_thrift_object_id_t next_hop_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_next_hop_group_attribute(1: sai_thrift_object_id_t next_hop_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_next_hop_group_attribute(1: sai_thrift_object_id_t next_hop_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_next_hop_group_member(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_next_hop_group_member(1: sai_thrift_object_id_t next_hop_group_member_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_next_hop_group_member_attribute(1: sai_thrift_object_id_t next_hop_group_member_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_next_hop_group_member_attribute(1: sai_thrift_object_id_t next_hop_group_member_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // policer API
    sai_thrift_object_id_t sai_thrift_create_policer(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_policer(1: sai_thrift_object_id_t policer_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_policer_attribute(1: sai_thrift_object_id_t policer_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_policer_attribute(1: sai_thrift_object_id_t policer_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_policer_stats(1: sai_thrift_object_id_t policer_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_policer_stats_ext(1: sai_thrift_object_id_t policer_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_policer_stats(1: sai_thrift_object_id_t policer_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);

    // port API
    sai_thrift_object_id_t sai_thrift_create_port(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_port(1: sai_thrift_object_id_t port_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_port_attribute(1: sai_thrift_object_id_t port_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_port_attribute(1: sai_thrift_object_id_t port_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_port_stats(1: sai_thrift_object_id_t port_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_port_stats_ext(1: sai_thrift_object_id_t port_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_port_stats(1: sai_thrift_object_id_t port_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_port_all_stats(1: sai_thrift_object_id_t port_oid) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_port_pool(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_port_pool(1: sai_thrift_object_id_t port_pool_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_port_pool_attribute(1: sai_thrift_object_id_t port_pool_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_port_pool_attribute(1: sai_thrift_object_id_t port_pool_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_port_pool_stats(1: sai_thrift_object_id_t port_pool_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_port_pool_stats_ext(1: sai_thrift_object_id_t port_pool_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_port_pool_stats(1: sai_thrift_object_id_t port_pool_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_port_serdes(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_port_serdes(1: sai_thrift_object_id_t port_serdes_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_port_serdes_attribute(1: sai_thrift_object_id_t port_serdes_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_port_serdes_attribute(1: sai_thrift_object_id_t port_serdes_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_port_connector(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_port_connector(1: sai_thrift_object_id_t port_connector_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_port_connector_attribute(1: sai_thrift_object_id_t port_connector_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_port_connector_attribute(1: sai_thrift_object_id_t port_connector_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // qos_map API
    sai_thrift_object_id_t sai_thrift_create_qos_map(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_qos_map(1: sai_thrift_object_id_t qos_map_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_qos_map_attribute(1: sai_thrift_object_id_t qos_map_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_qos_map_attribute(1: sai_thrift_object_id_t qos_map_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // queue API
    sai_thrift_object_id_t sai_thrift_create_queue(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_queue(1: sai_thrift_object_id_t queue_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_queue_attribute(1: sai_thrift_object_id_t queue_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_queue_attribute(1: sai_thrift_object_id_t queue_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_queue_stats(1: sai_thrift_object_id_t queue_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_queue_stats_ext(1: sai_thrift_object_id_t queue_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_queue_stats(1: sai_thrift_object_id_t queue_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);

    // route API
    void sai_thrift_create_route_entry(1: sai_thrift_route_entry_t route_entry, 2: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_route_entry(1: sai_thrift_route_entry_t route_entry) throws (1: sai_thrift_exception e);
    void sai_thrift_set_route_entry_attribute(1: sai_thrift_route_entry_t route_entry, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_route_entry_attribute(1: sai_thrift_route_entry_t route_entry, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_create_route_entry(1: list<sai_thrift_route_entry_t> route_entry, 2: list<sai_thrift_uint32_t> attr_count, 3: list<sai_thrift_attribute_t> attr_list, 4: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_remove_route_entry(1: list<sai_thrift_route_entry_t> route_entry, 2: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    list<sai_thrift_status_t> sai_thrift_bulk_set_route_entry_attribute(1: list<sai_thrift_route_entry_t> route_entry, 2: list<sai_thrift_attribute_t> attr_list, 3: sai_thrift_bulk_op_error_mode_t mode) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_bulk_get_route_entry_attribute(1: list<sai_thrift_route_entry_t> route_entry, 2: list<sai_thrift_uint32_t> attr_count, 3: sai_thrift_attribute_list_t attr_list, 4: sai_thrift_bulk_op_error_mode_t mode, 5: list<sai_thrift_status_t> object_statuses) throws (1: sai_thrift_exception e);

    // router_interface API
    sai_thrift_object_id_t sai_thrift_create_router_interface(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_router_interface(1: sai_thrift_object_id_t router_interface_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_router_interface_attribute(1: sai_thrift_object_id_t router_interface_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_router_interface_attribute(1: sai_thrift_object_id_t router_interface_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_router_interface_stats(1: sai_thrift_object_id_t router_interface_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_router_interface_stats_ext(1: sai_thrift_object_id_t router_interface_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_router_interface_stats(1: sai_thrift_object_id_t router_interface_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);

    // rpf_group API
    sai_thrift_object_id_t sai_thrift_create_rpf_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_rpf_group(1: sai_thrift_object_id_t rpf_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_rpf_group_attribute(1: sai_thrift_object_id_t rpf_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_rpf_group_attribute(1: sai_thrift_object_id_t rpf_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_rpf_group_member(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_rpf_group_member(1: sai_thrift_object_id_t rpf_group_member_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_rpf_group_member_attribute(1: sai_thrift_object_id_t rpf_group_member_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_rpf_group_member_attribute(1: sai_thrift_object_id_t rpf_group_member_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // samplepacket API
    sai_thrift_object_id_t sai_thrift_create_samplepacket(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_samplepacket(1: sai_thrift_object_id_t samplepacket_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_samplepacket_attribute(1: sai_thrift_object_id_t samplepacket_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_samplepacket_attribute(1: sai_thrift_object_id_t samplepacket_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // scheduler API
    sai_thrift_object_id_t sai_thrift_create_scheduler(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_scheduler(1: sai_thrift_object_id_t scheduler_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_scheduler_attribute(1: sai_thrift_object_id_t scheduler_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_scheduler_attribute(1: sai_thrift_object_id_t scheduler_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // scheduler_group API
    sai_thrift_object_id_t sai_thrift_create_scheduler_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_scheduler_group(1: sai_thrift_object_id_t scheduler_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_scheduler_group_attribute(1: sai_thrift_object_id_t scheduler_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_scheduler_group_attribute(1: sai_thrift_object_id_t scheduler_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // segmentroute API
    sai_thrift_object_id_t sai_thrift_create_segmentroute_sidlist(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_segmentroute_sidlist(1: sai_thrift_object_id_t segmentroute_sidlist_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_segmentroute_sidlist_attribute(1: sai_thrift_object_id_t segmentroute_sidlist_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_segmentroute_sidlist_attribute(1: sai_thrift_object_id_t segmentroute_sidlist_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // stp API
    sai_thrift_object_id_t sai_thrift_create_stp(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_stp(1: sai_thrift_object_id_t stp_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_stp_attribute(1: sai_thrift_object_id_t stp_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_stp_attribute(1: sai_thrift_object_id_t stp_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_stp_port(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_stp_port(1: sai_thrift_object_id_t stp_port_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_stp_port_attribute(1: sai_thrift_object_id_t stp_port_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_stp_port_attribute(1: sai_thrift_object_id_t stp_port_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // switch API
    list<sai_thrift_uint32_t> sai_thrift_switch_register_read(1: sai_thrift_uint64_t platform_context, 2: sai_thrift_uint32_t device_addr, 3: sai_thrift_uint32_t start_reg_addr) throws (1: sai_thrift_exception e);
    void sai_thrift_switch_register_write(1: sai_thrift_uint64_t platform_context, 2: sai_thrift_uint32_t device_addr, 3: sai_thrift_uint32_t start_reg_addr, 4: list<sai_thrift_uint32_t> reg_val) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint32_t> sai_thrift_switch_mdio_read(1: sai_thrift_uint32_t device_addr, 2: sai_thrift_uint32_t start_reg_addr) throws (1: sai_thrift_exception e);
    void sai_thrift_switch_mdio_write(1: sai_thrift_uint32_t device_addr, 2: sai_thrift_uint32_t start_reg_addr, 3: list<sai_thrift_uint32_t> reg_val) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_switch(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_switch() throws (1: sai_thrift_exception e);
    void sai_thrift_set_switch_attribute(1: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_switch_attribute(1: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_switch_stats(1: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_switch_stats_ext(1: list<sai_thrift_stat_id_t> counter_ids, 2: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_switch_stats(1: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_switch_tunnel(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_switch_tunnel(1: sai_thrift_object_id_t switch_tunnel_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_switch_tunnel_attribute(1: sai_thrift_object_id_t switch_tunnel_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_switch_tunnel_attribute(1: sai_thrift_object_id_t switch_tunnel_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // system_port API
    sai_thrift_object_id_t sai_thrift_create_system_port(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_system_port(1: sai_thrift_object_id_t system_port_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_system_port_attribute(1: sai_thrift_object_id_t system_port_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_system_port_attribute(1: sai_thrift_object_id_t system_port_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // tam API
    sai_thrift_object_id_t sai_thrift_create_tam(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam(1: sai_thrift_object_id_t tam_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_attribute(1: sai_thrift_object_id_t tam_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_attribute(1: sai_thrift_object_id_t tam_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_math_func(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_math_func(1: sai_thrift_object_id_t tam_math_func_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_math_func_attribute(1: sai_thrift_object_id_t tam_math_func_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_math_func_attribute(1: sai_thrift_object_id_t tam_math_func_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_event_threshold(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_event_threshold(1: sai_thrift_object_id_t tam_event_threshold_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_event_threshold_attribute(1: sai_thrift_object_id_t tam_event_threshold_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_event_threshold_attribute(1: sai_thrift_object_id_t tam_event_threshold_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_int(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_int(1: sai_thrift_object_id_t tam_int_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_int_attribute(1: sai_thrift_object_id_t tam_int_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_int_attribute(1: sai_thrift_object_id_t tam_int_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_tel_type(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_tel_type(1: sai_thrift_object_id_t tam_tel_type_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_tel_type_attribute(1: sai_thrift_object_id_t tam_tel_type_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_tel_type_attribute(1: sai_thrift_object_id_t tam_tel_type_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_report(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_report(1: sai_thrift_object_id_t tam_report_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_report_attribute(1: sai_thrift_object_id_t tam_report_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_report_attribute(1: sai_thrift_object_id_t tam_report_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_telemetry(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_telemetry(1: sai_thrift_object_id_t tam_telemetry_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_telemetry_attribute(1: sai_thrift_object_id_t tam_telemetry_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_telemetry_attribute(1: sai_thrift_object_id_t tam_telemetry_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_transport(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_transport(1: sai_thrift_object_id_t tam_transport_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_transport_attribute(1: sai_thrift_object_id_t tam_transport_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_transport_attribute(1: sai_thrift_object_id_t tam_transport_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_collector(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_collector(1: sai_thrift_object_id_t tam_collector_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_collector_attribute(1: sai_thrift_object_id_t tam_collector_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_collector_attribute(1: sai_thrift_object_id_t tam_collector_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_event_action(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_event_action(1: sai_thrift_object_id_t tam_event_action_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_event_action_attribute(1: sai_thrift_object_id_t tam_event_action_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_event_action_attribute(1: sai_thrift_object_id_t tam_event_action_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tam_event(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tam_event(1: sai_thrift_object_id_t tam_event_oid) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tam_event_attribute(1: sai_thrift_object_id_t tam_event_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tam_event_attribute(1: sai_thrift_object_id_t tam_event_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);

    // tunnel API
    sai_thrift_object_id_t sai_thrift_create_tunnel_map(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tunnel_map(1: sai_thrift_object_id_t tunnel_map_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tunnel_map_attribute(1: sai_thrift_object_id_t tunnel_map_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tunnel_map_attribute(1: sai_thrift_object_id_t tunnel_map_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tunnel(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tunnel(1: sai_thrift_object_id_t tunnel_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tunnel_attribute(1: sai_thrift_object_id_t tunnel_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tunnel_attribute(1: sai_thrift_object_id_t tunnel_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_tunnel_stats(1: sai_thrift_object_id_t tunnel_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_tunnel_stats_ext(1: sai_thrift_object_id_t tunnel_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_tunnel_stats(1: sai_thrift_object_id_t tunnel_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tunnel_term_table_entry(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tunnel_term_table_entry(1: sai_thrift_object_id_t tunnel_term_table_entry_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tunnel_term_table_entry_attribute(1: sai_thrift_object_id_t tunnel_term_table_entry_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tunnel_term_table_entry_attribute(1: sai_thrift_object_id_t tunnel_term_table_entry_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_tunnel_map_entry(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_tunnel_map_entry(1: sai_thrift_object_id_t tunnel_map_entry_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_tunnel_map_entry_attribute(1: sai_thrift_object_id_t tunnel_map_entry_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_tunnel_map_entry_attribute(1: sai_thrift_object_id_t tunnel_map_entry_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // udf API
    sai_thrift_object_id_t sai_thrift_create_udf(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_udf(1: sai_thrift_object_id_t udf_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_udf_attribute(1: sai_thrift_object_id_t udf_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_udf_attribute(1: sai_thrift_object_id_t udf_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_udf_match(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_udf_match(1: sai_thrift_object_id_t udf_match_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_udf_match_attribute(1: sai_thrift_object_id_t udf_match_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_udf_match_attribute(1: sai_thrift_object_id_t udf_match_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_udf_group(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_udf_group(1: sai_thrift_object_id_t udf_group_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_udf_group_attribute(1: sai_thrift_object_id_t udf_group_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_udf_group_attribute(1: sai_thrift_object_id_t udf_group_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // virtual_router API
    sai_thrift_object_id_t sai_thrift_create_virtual_router(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_virtual_router(1: sai_thrift_object_id_t virtual_router_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_virtual_router_attribute(1: sai_thrift_object_id_t virtual_router_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_virtual_router_attribute(1: sai_thrift_object_id_t virtual_router_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // vlan API
    sai_thrift_object_id_t sai_thrift_create_vlan(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_vlan(1: sai_thrift_object_id_t vlan_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_vlan_attribute(1: sai_thrift_object_id_t vlan_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_vlan_attribute(1: sai_thrift_object_id_t vlan_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    sai_thrift_object_id_t sai_thrift_create_vlan_member(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_vlan_member(1: sai_thrift_object_id_t vlan_member_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_vlan_member_attribute(1: sai_thrift_object_id_t vlan_member_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_vlan_member_attribute(1: sai_thrift_object_id_t vlan_member_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_vlan_stats(1: sai_thrift_object_id_t vlan_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);
    list<sai_thrift_uint64_t> sai_thrift_get_vlan_stats_ext(1: sai_thrift_object_id_t vlan_oid, 2: list<sai_thrift_stat_id_t> counter_ids, 3: sai_thrift_stats_mode_t mode) throws (1: sai_thrift_exception e);
    void sai_thrift_clear_vlan_stats(1: sai_thrift_object_id_t vlan_oid, 2: list<sai_thrift_stat_id_t> counter_ids) throws (1: sai_thrift_exception e);

    // wred API
    sai_thrift_object_id_t sai_thrift_create_wred(1: list<sai_thrift_attribute_t> attr_list) throws (1: sai_thrift_exception e);
    void sai_thrift_remove_wred(1: sai_thrift_object_id_t wred_oid) throws (1: sai_thrift_exception e);
    void sai_thrift_set_wred_attribute(1: sai_thrift_object_id_t wred_oid, 2: sai_thrift_attribute_t attr) throws (1: sai_thrift_exception e);
    sai_thrift_attribute_list_t sai_thrift_get_wred_attribute(1: sai_thrift_object_id_t wred_oid, 2: sai_thrift_attribute_list_t attr_list) throws (1: sai_thrift_exception e);

    // SAI utils

    // sai objects API
    list<i32> sai_thrift_query_attribute_enum_values_capability(1: sai_thrift_object_type_t object_type, 2: sai_thrift_attr_id_t attr_id, 3: i32 caps_count);
    i64 sai_thrift_object_type_get_availability(1 : sai_thrift_object_type_t object_type, 2: sai_thrift_attr_id_t attr_id, 3: i32 attr_type);

}

