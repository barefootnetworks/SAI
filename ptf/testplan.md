# SAI PTF TESTPLAN

## ACL

## Bridge

## Buffer

## Debug Counter

## FDB

## Hash

## Hostif

## Lag

## Mirror

## MPLS

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| mpls.1  | Verify hostif trap type MPLS_TTL_ERROR | saihostif.HostifTrapTypesTest.mplsTtlErrorTest |
| mpls.2  | Verify mpls packet is trapped to CPU when packet_action is set to SAI_PACKET_ACTION_TRAP with SWITCH_HOSTIF_TRAP_ATTR_TYPE_MPLS_TRAP reason code | saimpls.MplsDropTrapTest.mplsImplicitNullLabelTrapDrop |
| mpls.3  | Verify hostif trap type MPLS_ROUTER_ALERT | saihostif.HostifTrapTypesTest.mplsRouterAlertTest |
| mpls.4  | Verify if packet with unknown label is dropped and assosiated debug counter is hit | saimpls.MplsDropTrapTest.mplsLabelLookupMissTest |
| mpls.5  | Verify mpls labels are added to packet in ingress LER for IPv4 | saimpls.MplsIpv4Test.mplsIngressLERTest |
| mpls.6  | Verify mpls label is popped in Egress LER and packet is forwarded based in IP lookup for IPv4 | saimpls.MplsIpv4Test.mplsEgressLERTermTest |
| mpls.7  | Verify mpls label is popped in Egress LER and packet is forwarded based on IP lookup after changing VRF on mpls rif for IPv4 | saimpls.MplsIpv4Test.mplsEgressLERTermUpdateMplsRifVrfTest |
| mpls.8  | Verify mpls null label is popped in Egress LER and packet is forwarded based on IP lookup for IPv4 | saimpls.MplsIpv4Test.mplsEgressLERNullTermTest |
| mpls.9  | Verify PHP pops label and forwards packet based on IP lookup for IPv4 | saimpls.MplsIpv4Test.mplsEgressPhpTest |
| mpls.10 | Verify PHP swaps label with explicit null and forwards packet based on IP lookup for IPv4 | saimpls.MplsIpv4Test.mplsEgressPhpSwapNullTest |
| mpls.11 | Verify mpls label is swapped with another label, explicit null, swap only top label in transit switch for IPv4 | saimpls.MplsIpv4Test.mplsTransitSwapTest |
| mpls.12 | Verify ECMP group with mpls transit nhops for IPv4 | saimpls.MplsIpv4Test.mplsTransitSwapEcmpHashTest |
| mpls.13 | Verify MPLS label is pushed on stach in transit LSR for IPv4 | saimpls.MplsIpv4Test.mplsTransitPushTest |
| mpls.14 | Verify mpls labels are added to packet in ingress LER for IPv6 | saimpls.MplsIpv6Test.mplsIngressLERTest |
| mpls.15 | Verify mpls label is popped in Egress LER and packet is forwarded based in IP lookup for IPv6 | saimpls.MplsIpv6Test.mplsEgressLERTermTest |
| mpls.16 | Verify mpls null label is popped in Egress LER and packet is forwarded based on IP lookup for IPv6 | saimpls.MplsIpv6Test.mplsEgressLERNullTermTest |
| mpls.17 | Verify PHP pops label and forwards packet based on IP lookup for IPv6 | saimpls.MplsIpv6Test.mplsEgressPhpTest |
| mpls.18 | Verify PHP swaps label with explicit null and forwards packet based on IP lookup for IPv6 | saimpls.MplsIpv6Test.mplsEgressPhpSwapNullTest |
| mpls.19 | Verify mpls label is swapped with another label, explicit null, swap only top label in transit switch for IPv6 | saimpls.MplsIpv6Test.mplsTransitSwapTest |
| mpls.20 | Verify ECMP group with mpls transit nhops for IPv6 | saimpls.MplsIpv6Test.mplsTransitSwapEcmpHashTest |
| mpls.21 | Verify MPLS label is pushed on stach in transit LSR for IPv6 | saimpls.MplsIpv6Test.mplsTransitPushTest |

## NAT

## Neighbor

## Nexthop

## Nexthop Group

## Policer

## Port

## QoS Map

## Queue

## Route

## RIF

## Scheduler

## Scheduler Group

## Switch

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| switch.1  | Verify get for SAI_SWITCH_ATTR_NUMBER_OF_ACTIVE_PORTS        | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.2  | Verify get for SAI_SWITCH_ATTR_MAX_NUMBER_OF_SUPPORTED_PORTS | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.3  | Verify get for SAI_SWITCH_ATTR_PORT_LIST                     | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.4  | Verify get for SAI_SWITCH_ATTR_PORT_MAX_MTU                  | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.5  | Verify get for SAI_SWITCH_ATTR_CPU_PORT                      | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.6  | Verify get for SAI_SWITCH_ATTR_MAX_VIRTUAL_ROUTES            | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.7  | Verify get for SAI_SWITCH_ATTR_FDB_TABLE_SIZE                | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.8  | Verify get for SAI_SWITCH_ATTR_L3_NEIGHBOR_TABLE_SIZE        | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.9  | Verify get for SAI_SWITCH_ATTR_L3_ROUTE_TABLE_SIZE           | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.10 | Verify get for SAI_SWITCH_ATTR_LAG_MEMBERS                   | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.11 | Verify get for SAI_SWITCH_ATTR_NUMBER_OF_LAGS                | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.12 | Verify get for SAI_SWITCH_ATTR_ECMP_MEMBERS                  | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.13 | Verify get for SAI_SWITCH_ATTR_NUMBER_OF_ECMP_GROUPS         | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.14 | Verify get for SAI_SWITCH_ATTR_NUMBER_OF_UNICAST_QUEUES      | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.15 | Verify get for SAI_SWITCH_ATTR_NUMBER_OF_MULTICAST_QUEUES    | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.16 | Verify get for SAI_SWITCH_ATTR_NUMBER_OF_QUEUES              | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.17 | Verify get for SAI_SWITCH_ATTR_NUMBER_OF_CPU_QUEUES          | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.18 | Verify get for SAI_SWITCH_ATTR_ACL_TABLE_MINIMUM_PRIORITY    | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.19 | Verify get for SAI_SWITCH_ATTR_ACL_TABLE_MAXIMUM_PRIORITY    | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.20 | Verify get for SAI_SWITCH_ATTR_ACL_ENTRY_MINIMUM_PRIORITY    | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.21 | Verify get for SAI_SWITCH_ATTR_ACL_ENTRY_MAXIMUM_PRIORITY    | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.22 | Verify get for SAI_SWITCH_ATTR_DEFAULT_VLAN_ID               | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.23 | Verify get for SAI_SWITCH_ATTR_DEFAULT_STP_INST_ID           | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.24 | Verify get for SAI_SWITCH_ATTR_MAX_STP_INSTANCE              | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.25 | Verify get for SAI_SWITCH_ATTR_DEFAULT_VIRTUAL_ROUTER_ID     | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.26 | Verify get for SAI_SWITCH_ATTR_DEFAULT_1Q_BRIDGE_ID          | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.27 | Verify get for SAI_SWITCH_ATTR_QOS_MAX_NUMBER_OF_TRAFFIC_CLASSES | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.28 | Verify get for SAI_SWITCH_ATTR_QOS_MAX_NUMBER_OF_SCHEDULER_GROUP_HIERARCHY_LEVELS | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.29 | Verify get for SAI_SWITCH_ATTR_QOS_MAX_NUMBER_OF_SCHEDULER_GROUPS_PER_HIERARCHY_LEVEL | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.30 | Verify get for SAI_SWITCH_ATTR_QOS_MAX_NUMBER_OF_CHILDS_PER_SCHEDULER_GROUP | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.31 | Verify get for SAI_SWITCH_ATTR_TOTAL_BUFFER_SIZE             | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.32 | Verify get for SAI_SWITCH_ATTR_INGRESS_BUFFER_POOL_NUM       | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.33 | Verify get for SAI_SWITCH_ATTR_EGRESS_BUFFER_POOL_NUM        | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.34 | Verify get for SAI_SWITCH_ATTR_ECMP_HASH                     | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.35 | Verify get for SAI_SWITCH_ATTR_LAG_HASH                      | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.36 | Verify get for SAI_SWITCH_ATTR_MAX_ACL_ACTION_COUNT          | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.37 | Verify get for SAI_SWITCH_ATTR_MAX_ACL_RANGE_COUNT           | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.38 | Verify get for SAI_SWITCH_ATTR_ACL_CAPABILITY                | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.39 | Verify get for SAI_SWITCH_ATTR_MAX_MIRROR_SESSION            | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.40 | Verify get for SAI_SWITCH_ATTR_DEFAULT_TRAP_GROUP            | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.41 | Verify get for SAI_SWITCH_ATTR_ACL_STAGE_INGRESS             | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.42 | Verify get for SAI_SWITCH_ATTR_ACL_STAGE_EGRESS              | saiswitch.SwitchAttrTest.readOnlyAttributesTest |
| switch.43 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_IPV4_ROUTE_ENTRY | saiswitch.SwitchAttrTest.availableIPv4RouteEntryTest |
| switch.44 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_IPV6_ROUTE_ENTRY | saiswitch.SwitchAttrTest.availableIPv6RouteEntryTest |
| switch.45 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_IPV4_NEXTHOP_ENTRY | saiswitch.SwitchAttrTest.availableIPv4NexthopEntryTest |
| switch.46 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_IPV6_NEXTHOP_ENTRY | saiswitch.SwitchAttrTest.availableIPv6NexthopEntryTest |
| switch.47 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_IPV4_NEIGHBOR_ENTRY | saiswitch.SwitchAttrTest.availableIPv4NeighborEntryTest |
| switch.48 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_IPV6_NEIGHBOR_ENTRY | saiswitch.SwitchAttrTest.availableIPv6NeighborEntryTest |
| switch.49 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_NEXT_HOP_GROUP_ENTRY | saiswitch.SwitchAttrTest.availableNexthopGroupEntryTest |
| switch.50 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_NEXT_HOP_GROUP_MEMBER_ENTRY | saiswitch.SwitchAttrTest.availableNexthopGroupMemberEntryTest |
| switch.51 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_FDB_ENTRY | saiswitch.SwitchAttrTest.availableFdbEntryTest |
| switch.52 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_SNAT_ENTRY | saiswitch.SwitchAttrTest.availableSnatEntryTest |
| switch.53 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_DNAT_ENTRY | saiswitch.SwitchAttrTest.availableDnatEntryTest |
| switch.54 | Verify available is 0 after MAX is reached for SAI_SWITCH_ATTR_AVAILABLE_ACL_ENTRY | saiswitch.SwitchAttrTest.availableAclEntryTest |
| switch.55 | Verify traffic with SAI_SWITCH_ATTR_SRC_MAC_ADDRESS                  | set in sai_base_test, verifyd in sairif (multiple test cases) |
| switch.56 | Verify traffic with SAI_SWITCH_ATTR_FDB_AGING_TIME                   | saifdb.FdbAgeTest |
| switch.57 | Verify traffic with SAI_SWITCH_ATTR_FDB_UNICAST_MISS_PACKET_ACTION   | saifdb.FdbMissTest.unicast*ActionTest |
| switch.58 | Verify traffic with SAI_SWITCH_ATTR_FDB_BROADCAST_MISS_PACKET_ACTION | saifdb.FdbMissTest.broadcast*ActionTest |
| switch.59 | Verify traffic with SAI_SWITCH_ATTR_FDB_MULTICAST_MISS_PACKET_ACTION | saifdb.FdbMissTest.multicast*ActionTest |
| switch.60 | Verify traffic with SAI_SWITCH_ATTR_ECMP_DEFAULT_HASH_SEED           | saihash.L3EcmpIPv4HashSeedTest, saihash.L3EcmpIPv6HashSeedTest |
| switch.61 | Verify traffic with SAI_SWITCH_ATTR_ECMP_HASH_IPV4                   | saihash.EcmpIPv4SrcIPHashTest |
| switch.62 | Verify traffic with SAI_SWITCH_ATTR_ECMP_HASH_IPV6                   | saihash.EcmpIPv6SrcIPHashTest |
| switch.63 | Verify traffic with SAI_SWITCH_ATTR_LAG_DEFAULT_HASH_SEED            | saihash.L3LagIPv4HashSeedTest |
| switch.64 | Verify traffic with SAI_SWITCH_ATTR_LAG_HASH_IPV4                    | saihash.L3LagIPv4HashTest |
| switch.65 | Verify traffic with SAI_SWITCH_ATTR_LAG_HASH_IPV6                    | saihash.L3LagIPv6HashTest |
| switch.66 | Verify traffic with SAI_SWITCH_ATTR_COUNTER_REFRESH_INTERVAL         | saiswitch.SwitchAttrTest.refreshIntervalTest |
| switch.67 | Verify traffic with SAI_SWITCH_ATTR_VXLAN_DEFAULT_ROUTER_MAC         | saiswitch.SwitchVxlanTest |
| switch.68 | Verify traffic with SAI_SWITCH_ATTR_VXLAN_DEAFAULT_PORT              | saiswitch.SwitchVxlanTest |

## Tunnel

## VRF

## VLAN

## WRED
