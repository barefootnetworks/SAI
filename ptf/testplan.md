# SAI PTF TESTPLAN

SAI PTF TESTPLAN contains all test cases coverd in ptf/ directory divided by functionality.

## ACL

## Bridge Port

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| bridgeport.1 | Verify sample bridge port attributes getting and setting | saibridgeport.BridgePortAttributeTest |
| bridgeport.2 | Verify creation of bridge port of type Port | saibridgeport.BridgePortCreationTest.bpTypePortCreationTest |
| bridgeport.3 | Verify packet is dropped on port when no bridge_port is created on that port | saibridgeport.BridgePortCreationTest.noBpDropTest |
| bridgeport.4 | Verify FDB is being flushed on port if bridge port admin_state is being set to DOWN | saibridgeport.BridgePortStateTest.bpStateDownFlushTest |
| bridgeport.5 | Verify MAC address in not being learnt when bridge port admin_state is DOWN | saibridgeport.BridgePortStateTest.bpStateDownNoLearnTest |
| bridgeport.6 | Verify MAC address in not being learnt on port bridge port when FDB_LEARNING_MODE is disabled | saifdb.FdbNoLearnTest.bpPortNoLearnTest |
| bridgeport.7 | Verify MAC address in not being learnt on LAG bridge port when FDB_LEARNING_MODE is disabled | saifdb.FdbNoLearnTest.bpLagNoLearnTest |
| bridgeport.8 | Verify MAC address in not being learnt on a VLAN member if bridge port is not created on that port | saifdb.FdbNoLearnTest.noBpNoLearnTest |
| bridgeport.9 | Verify MAC address in not being learnt on a VLAN member after bridge port is removed on that port | saifdb.FdbNoLearnTest.removedBpNoLearnTest |

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
| mpls.1  | Verify hostif trap type MPLS_TTL_ERROR                          | saihostif.HostifTrapTypesTest.mplsTtlErrorTest |
| mpls.2  | Verify mpls packet is trapped to CPU when packet_action is set to SAI_PACKET_ACTION_TRAP with SWITCH_HOSTIF_TRAP_ATTR_TYPE_MPLS_TRAP reason code | saimpls.MplsDropTrapTest.mplsImplicitNullLabelTrapDrop |
| mpls.3  | Verify hostif trap type MPLS_ROUTER_ALERT                       | saihostif.HostifTrapTypesTest.mplsRouterAlertTest |
| mpls.4  | Verify if packet with unknown label is dropped and assosiated debug counter is hit | saimpls.MplsDropTrapTest.mplsLabelLookupMissTest |
| mpls.5  | Verify mpls labels are added to packet in ingress LER for IPv4  | saimpls.MplsIpv4Test.mplsIngressLERTest |
| mpls.6  | Verify mpls label is popped in Egress LER and packet is forwarded based in IP lookup for IPv4 | saimpls.MplsIpv4Test.mplsEgressLERTermTest |
| mpls.7  | Verify mpls label is popped in Egress LER and packet is forwarded based on IP lookup after changing VRF on mpls rif for IPv4 | saimpls.MplsIpv4Test.mplsEgressLERTermUpdateMplsRifVrfTest |
| mpls.8  | Verify mpls null label is popped in Egress LER and packet is forwarded based on IP lookup for IPv4 | saimpls.MplsIpv4Test.mplsEgressLERNullTermTest |
| mpls.9  | Verify PHP pops label and forwards packet based on IP lookup for IPv4 | saimpls.MplsIpv4Test.mplsEgressPhpTest |
| mpls.10 | Verify PHP swaps label with explicit null and forwards packet based on IP lookup for IPv4 | saimpls.MplsIpv4Test.mplsEgressPhpSwapNullTest |
| mpls.11 | Verify mpls label is swapped with another label, explicit null, swap only top label in transit switch for IPv4 | saimpls.MplsIpv4Test.mplsTransitSwapTest |
| mpls.12 | Verify ECMP group with mpls transit nhops for IPv4              | saimpls.MplsIpv4Test.mplsTransitSwapEcmpHashTest |
| mpls.13 | Verify MPLS label is pushed on stach in transit LSR for IPv4    | saimpls.MplsIpv4Test.mplsTransitPushTest |
| mpls.14 | Verify mpls labels are added to packet in ingress LER for IPv6  | saimpls.MplsIpv6Test.mplsIngressLERTest |
| mpls.15 | Verify mpls label is popped in Egress LER and packet is forwarded based in IP lookup for IPv6 | saimpls.MplsIpv6Test.mplsEgressLERTermTest |
| mpls.16 | Verify mpls null label is popped in Egress LER and packet is forwarded based on IP lookup for IPv6 | saimpls.MplsIpv6Test.mplsEgressLERNullTermTest |
| mpls.17 | Verify PHP pops label and forwards packet based on IP lookup for IPv6 | saimpls.MplsIpv6Test.mplsEgressPhpTest |
| mpls.18 | Verify PHP swaps label with explicit null and forwards packet based on IP lookup for IPv6 | saimpls.MplsIpv6Test.mplsEgressPhpSwapNullTest |
| mpls.19 | Verify mpls label is swapped with another label, explicit null, swap only top label in transit switch for IPv6 | saimpls.MplsIpv6Test.mplsTransitSwapTest |
| mpls.20 | Verify ECMP group with mpls transit nhops for IPv6              | saimpls.MplsIpv6Test.mplsTransitSwapEcmpHashTest |
| mpls.21 | Verify MPLS label is pushed on stach in transit LSR for IPv6    | saimpls.MplsIpv6Test.mplsTransitPushTest |

## NAT

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| nat.1 | Verify that source NAT translation doesn't happen if ACL is configures to disable translation | sainat.NatTranslationTest.srcNatAclTranslationDisableTest |
| nat.2 | Verify that destination NAT translation doesn't happen if ACL is configures to disable translation | sainat.NatTranslationTest.dstNatAclTranslationDisableTest |
| nat.3 | Configure basic source NAT entry and check translation | sainat.NatTest.srcNatTest |
| nat.4 | Configure basic destination NAT entry and check translation | sainat.NatTest.dstNatTest |
| nat.5 | Configure NAT Zones on RIF and verify if SNAT happens for packets from Zone 0 and DNAT happens for packets from Zone 1 | sainat.NatTest |
| nat.6 | Verify SNAT miss packet is forwarded to CPU. | sainat.NatTest.natTrapTest |
| nat.7 | Query and validate Hit Bit of a NAT entry | sainat.NatTest |
| nat.8 | Clear and verify Hit Bit of a NAT entry | sainat.NatTest |
| nat.9 | Query and verify NAT entry statistic | sainat.NatTest |
| nat.10 | Clear and verify NAT entry statistics | sainat.NatTest |

## Neighbor

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| neighbor.1  | Verify packet DMAC updated with neighbor dst MAC for dst IP after routing for L3 RIF | sairif.L3InterfaceTest |
| neighbor.2  | Verify packet DMAC updated with neighbor dst MAC for dst IP after routing for SVI | sairif.L3SVITest |
| neighbor.3  | Verify packet DMAC is correct if neihgbor created after nexthop for L3 RIF | sairif.L3InterfaceTest |
| neighbor.4  | Verify packet DMAC is correct if neihgbor created before nexthop for L3 RIF | sairif.L3InterfaceTest |
| neighbor.5  | Verify packet DMAC is correct if neighbor created after nexthop SVI, MAC already learnt | sairif.L3SVITest |
| neighbor.6  | Verify packet DMAC is correct if neighbor created before nexthop SVI, MAC already learnt | sairif.L3SVITest |
| neighbor.7  | Verify egress port for MAC learnt after neighbor created for SVI | sairif.L3SVITest.sviRouteDynamicMacTest |
| neighbor.8  | Verify egress port for MAC learnt before neighbor created for SVI | sairif.L3SVITest.sviRouteDynamicMacTest |
| neighbor.9  | Verify correct DMAC is set in packet after neighbor dst MAC is updated | sairif.L3SVITest.sviIpv4ArpMoveTest |
| neighbor.10 | Verify egress port after MAC move                           | sairif.L3SVITest.sviRouteDynamicMacMoveTest |
| neighbor.11 | Verify packet flooded on egress VLAN when neighbor present but no MAC learnt | sairif.L3SVITest.sviIPv4HostPortRoutedFloodTest |
| neighbor.12 | Verify host route is not created when no_host_route=True for IPv4 neighbor | saineighbor.noHostRouteIpv4NeighborTest |
| neighbor.13 | Verify host route is created when no_host_route=False for IPv4 neighbor | saineighbor.addHostRouteIpv4NeighborTest |
| neighbor.14 | Verify host route is not created when no_host_route=True for IPv6 neighbor | saineighbor.NeighborAttrTest.noHostRouteIpv6NeighborTest |
| neighbor.15 | Verify host route is created when no_host_route=False for IPv6 neighbor | saineighbor.NeighborAttrTest.addHostRouteIpv6NeighborTest |
| neighbor.16 | Verify host route is not created for IPv6 link local address irrespectively of no_host_route value | saineighbor.NeighborAttrTest.noHostRouteIpv6LinkLocalNeighborTest |

## Nexthop

## Nexthop Group

## Policer

## Port

## QoS Map

## Queue

## Route

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| route.1  | Verify IPv4 host route                                         | sairif.L3Interface.ipv4FibTest |
| route.2  | Verify IPv4 LPM route                                          | sairif.L3Interface.ipv4FibLPMTest |
| route.3  | Verify IPv6 host route                                         | sairif.L3Interface.ipv6FibTest |
| route.4  | Verify IPv6 LPM route                                          | sairif.L3Interface.ipv6FibLPMTest |
| route.5  | Verify multiple routes to the same nexthop                     | sairoute.L3RouteTest.multipleRoutesTest |
| route.6  | Verify CPU route for IP2ME addresses                           | saihostif.HostifTrapTypesTest |
| route.7  | Verify drop route                                              | sairoute.L3RouteTest.dropRouteTest |
| route.8  | Verify route nexthop update to different nexthop               | sairoute.L3RouteTest.routeUpdateTest |
| route.9  | Verify route update from CPU to regular nexthop                | sairoute.L3RouteTest.routeUpdateTest |
| route.10 | Verify route update from regular nexthop to CPU                | sairoute.L3RouteTest.routeUpdateTest |
| route.11 | Verify route update from drop to regular nexthop               | sairoute.L3RouteTest.routeUpdateTest |
| route.12 | Verify route update from regular to nexthop drop               | sairoute.L3RouteTest.routeUpdateTest |
| route.13 | Verify route from ingress L3 intf VRF to RIF on different VRF  | saivrf.VrfForwarding.innerVrfFwdL3NhopTest |
| route.14 | Verify route from ingress SVI intf VRF to RIF on different VRF | saivrf.VrfForwarding.innerVrfFwdSviNhopTest |
| route.15 | Verify route to ECMP                                           | sairif.L3SubPortTest.subPortECMPTest |
| route.16 | Verify packet dropped when route to ingress RIF                | sairoute.L3RouteTest.routeIngressRifTest |
| route.17 | Verify drop when route to empty ECMP group                     | sairoute.L3RouteTest.emptyECMPGroupTest |
| route.18 | Verify if packet is gleaned to CPU when nexthop id is RIF for case without a neighbor | sairoute.L3RouteTest.routeNbrColision |
| route.19 | Verify packet forwarded to RIF when nexthop id is RIF and RIF has a neighbor  | sairoute.L3RouteTest.routeNbrColision |
| route.20 | Verify packet forwarded to CPU when nexthop id is CPU port ID  | sairoute.L3RouteTest.cpuForwardTest |
| route.21 | Verify packet is routed to SVI, flooded if no neighbor found   | sairoute.L3RouteTest.sviNeighborTest |
| route.22 | Verify paclet is routed to SVI, forwarded to correct neighbor  | sairoute.L3RouteTest.sviNeighborTest |
| route.23 | Verify routing between VRFs                                    | saivrf.VrfForwardingTest.interVrfFwdL3NhopTest  |
| route.24 | Verify routing between VRFs with SVI                           | saivrf.VrfForwardingTest.interVrfFwdSviNhopTest |
| route.25 | Verify direct broadcast routing                                | sairif.L3DirBcastRouteTest |

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
| switch.69 | Verfiy packet forwarding with dest_mac = SAI_SWITCH_ATTR_SRC_MAC_ADDRESS | sairif.L3InterfaceTest.macUpdateTest |

## Tunnel

## VRF

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| vrf.1 | Verify IPv4 packets are not forwarded with admin_v4_state = false | saivrf.VrfFrowardingTest.vrfStateTest |
| vrf.2 | Verify IPv6 packets are not forwarded with admin_v4_state = false | saivrf.VrfFrowardingTest.vrfStateTest |
| vrf.3 | Verify IPv4 packets are forwarded with admin_v4_state = true | saivrf.VrfFrowardingTest.vrfStateTest |
| vrf.4 | Verify IPv6 packets are forwarded with admin_v4_state = true | saivrf.VrfFrowardingTest.vrfStateTest |
| vrf.5 | Verify multipfe RIF creation of type PORT, LAG, VLAN (with tagged and untagged members), SUB_PORT and LOOPBACK for more than two differen VRFs, with routes pointing to each RIF type | saivrf.VrfMultipleRifCreationTest.vrfInterfacesTest |
| vrf.6 | Verify inter-VRF forwarding with RIF pointing to regular L3 nexthop | saivrf.VrfForwardingTest.interVrfFwdL3NhopTest |
| vrf.7 | Verify inter-VRF forwarding with RIF pointing to L3 LAG nexthop | saivrf.VrfForwardingTest.interVrfFwdL3LagNhopTest |
| vrf.8 | Verify inter-VRF forwarding with RIF pointing to regular SVI nexthop | saivrf.VrfForwardingTest.interVrfFwdSviNhopTest |
| vrf.9 | Verify inter-VRF forwarding with RIF pointing to regular subport nexthop | saivrf.VrfForwardingTest.interVrfFwdSubportNhopTest |
| vrf.10 | Verify inter-VRF forwarding with RIF pointing to ECMP nexthop | saivrf.VrfForwardingTest.interVrfFwdEcmpNhopTest |
| vrf.11 | Verify inter-VRF isolation with overlapping IPv4 LPM routes | saivrf.VrfIsolationTest.overlappingIPv4LpmTest |
| vrf.12 | Verify inter-VRF isolation with overlapping IPv6 LPM routes | saivrf.VrfIsolationTest.overlappingIPv6LpmTest |
| vrf.13 | Verify inter VRF isolation with overlapping IPv4 host routes | saivrf.VrfIsolationTest.overlappingIPv4HostTest |
| vrf.14 | Verify inter VRF isolation with overlapping IPv6 host routes | saivrf.VrfIsolationTest.overlappingIPv6HostTest |
| vrf.15 | Verfiy ACL redirect to regular L3 nexthop in different VRF | saivrf.VrfAclRedirectTest.aclFwdL3NhopTest |
| vrf.16 | Verfiy ACL redirect to L3 LAG nexthop in different VRF | VrfAclRedirsaivrf.VrfAclRedirectTest.aclFwdL3LagNhopTest |
| vrf.17 | Verfiy ACL redirect to SVI nexthop in different VRF | saivrf.VrfAclRedirectTest.aclFwdSviNhopTest |
| vrf.18 | Verfiy ACL redirect to subport nexthop in different VRF | saivrf.VrfAclRedirectTest.aclFwdSubportNhopTest |
| vrf.19 | Verfiy ACL redirect to ECMP nexthop in different VRF | saivrf.VrfAclRedirectTest.aclFwdEcmpNhopTest |
| vrf.20 | Verify the pissibility to create the numbers of VRFs equal to SAI_SWITCH_ATTR_MAX_VIRTUAL_ROUTERS | saivrf.VrfScaleTest |
| vrf.21 | Verufy maximum number of VRFs with at least one route of each type (IPv4 host, IPv4 LPM, IPv6 host, IPv6 LPM) in each VRF | saivrf.VrfScaleTest |
| vrf.22 | Verify multiple RIF creation of type PORT, LAG, VLAN (with tagged and untagged members), SUB_PORT and LOOPBACK for three different VRFs, with routes pointing to each RIF type | saivrf.VrfMultipleRifCreationTest.vrfInterfacesTest |
| vrf.23 | Verify SMAC configuration on VRF create | saivrf.VrfSMACTest.testSMACCreateSet |
| vrf.24 | Verify SMAC configuration on VRF creted with default mac | saivrf.VrfSMACTest.testSMACSet |

## VLAN

## WRED
