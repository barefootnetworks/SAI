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

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| buffer.1 | Verify Buffer Pool Statistics GET SAI_BUFFER_POOL_STAT_CURR_OCCUPANCY_BYTES. | saibuffer.BufferStatistics |
| buffer.2 | Verify Buffer Pool Statistics GET SAI_BUFFER_POOL_STAT_WATERMARK_BYTES. | saibuffer.BufferStatistics |
| buffer.3 | Verify Buffer Pool Statistics CLEAR SAI_BUFFER_POOL_STAT_WATERMARK_BYTES. | saibuffer.BufferStatistics |
| buffer.4 | Verify Ingresss Buffer Pool Creation Count = SAI_SWITCH_ATTR_INGRESS_BUFFER_POOL_NUM. Verify Pools creation with traffic and stats. | saibuffer.BufferPoolNumber |
| buffer.5 | Verify Egress Buffer Pool Creation Count = SAI_SWITCH_ATTR_EGRESS_BUFFER_POOL_NUM. Verify Pools creation with traffic and stats. | saibuffer.BufferPoolNumber |
| buffer.6 | Verify ingress_priority_group creation and corresponding gets for SAI_PORT_ATTR_NUMBER_OF_INGRESS_PRIORITY_GROUPS. | saiqosmap.QosTcToPriorityGroupTest |
| buffer.7 | Verify ingress_priority_group creation and corresponding gets for SAI_PORT_ATTR_INGRESS_PRIORITY_GROUP_LIST. | saiqosmap.QosTcToPriorityGroupTest |
| buffer.8 | Verify Traffic forwarding for created ingress_priority_groups with no buffer profile. | saibuffer.Forwarding |
| buffer.9 | Verify Traffic forwarding for created ingress_priority_groups with Buffer Profile 1. | saibuffer.Forwarding |
| buffer.10 | Verify Traffic forwarding for created ingress_priority_groups with Buffer Profile 2 (Buffer profile update case). | saibuffer.Forwarding |
| buffer.11 | Verify Traffic forwarding for created ingress_priority_groups again with no Buffer Profile. | saibuffer.Forwarding |
| buffer.12 | Verify ingress_priority_group stats GET SAI_INGRESS_PRIORITY_GROUP_STAT_PACKETS. | saibuffer.BufferStatistics |
| buffer.13 | Verify ingress_priority_group stats GET SAI_INGRESS_PRIORITY_GROUP_STAT_BYTES. | saibuffer.BufferStatistics |
| buffer.14 | Verify ingress_priority_group stats GET SAI_INGRESS_PRIORITY_GROUP_STAT_CURR_OCCUPANCY_BYTES. | saibuffer.BufferStatistics |
| buffer.15 | Verify ingress_priority_group stats GET SAI_INGRESS_PRIORITY_GROUP_STAT_WATERMARK_BYTES. | saibuffer.BufferStatistics |
| buffer.16 | Verify ingress_priority_group stats GET SAI_INGRESS_PRIORITY_GROUP_STAT_SHARED_CURR_OCCUPANCY_BYTES. | saibuffer.BufferStatistics |
| buffer.17 | Verify ingress_priority_group stats GET SAI_INGRESS_PRIORITY_GROUP_STAT_DROPPED_PACKETS. | saibuffer.BufferStatistics |
| buffer.18 | Verify ingress_priority_group stats CLEAR SAI_INGRESS_PRIORITY_GROUP_STAT_PACKETS. | saibuffer.BufferStatistics |
| buffer.19 | Verify ingress_priority_group stats CLEAR SAI_INGRESS_PRIORITY_GROUP_STAT_BYTES. | saibuffer.BufferStatistics |
| buffer.20 | Verify ingress_priority_group stats CLEAR SAI_INGRESS_PRIORITY_GROUP_STAT_WATERMARK_BYTES. | saibuffer.BufferStatistics |
| buffer.21 | Verify ingress_priority_group stats CLEAR SAI_INGRESS_PRIORITY_GROUP_STAT_DROPPED_PACKETS. | saibuffer.BufferStatistics |
| buffer.22 | For ingress ppg verify SAI_BUFFER_PROFILE_ATTR_RESERVED_BUFFER_SIZE with traffic. | saibuffer.BufferStatistics |
| buffer.23 | For ingress queue verify SAI_BUFFER_PROFILE_ATTR_RESERVED_BUFFER_SIZE with traffic. | saibuffer.BufferStatistics |
| buffer.24 | For egress ppg verify SAI_BUFFER_PROFILE_ATTR_RESERVED_BUFFER_SIZE with traffic. | saibuffer.BufferStatistics |
| buffer.25 | For egress queue verify SAI_BUFFER_PROFILE_ATTR_RESERVED_BUFFER_SIZE with traffic. | saibuffer.BufferStatistics |

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
| neighbor.3  | Verify packet DMAC is correct if neihgbor created after nexthop for L3 IFF | sairif.L3InterfaceTest |
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

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| nexthop.1  | Verify traffic with route pointing to nexthop with RIF as SAI_ROUTER_INTERFACE_TYPE_PORT and nexthop type as SAI_NEXT_HOP_TYPE_IP | sairif.L3InterfaceTest |
| nexthop.2  | Verify traffic with route pointing to nexthop with RIF as SAI_ROUTER_INTERFACE_TYPE_VLAN and nexthop type as SAI_NEXT_HOP_TYPE_IP | sairif.L3SVITest |
| nexthop.3  | Verify traffic with route pointing to nexthop with RIF as SAI_ROUTER_INTERFACE_TYPE_SUB_PORT and nexthop type as SAI_NEXT_HOP_TYPE_IP | sairif.L3SubPortTest |
| nexthop.4  | Repeat nexthop.1 to nexthop.3 tests for nexthop type as SAI_NEXT_HOP_TYPE_TUNNEL_ENCAP | sainhop.NhopTunnelEncapDecapTest |
| nexthop.5  | Verify traffic after overriding tunnel VNI of tunnel mapper using nexthop atribute SAI_NEXT_HOP_ATTR_TUNNEL_VNI | sainhop.NhopTunnelVniTest |
| nexthop.6  | Add multiple routes pointing to nexthop and delete the nexthop, check for failures | sainhop.L3NexthopTest.removeNexthopTest |
| nexthop.7  | Verify traffic for nexthop with LAG RIF when LAG members are deleted, packets rehash and forwarded | sailag.LagL3Nhop |
| nexthop.8  | Verify traffic for nexthop with LAG RIF when LAG members are added, packets rehash and forwarded | sailag.LagL3Nhop |
| nexthop.9  | Verify no traffic for v4 route pointing to nexthop when RIF V4 is disabled | sairif.L3InterfaceTest.ipv4DisableTest |
| nexthop.10 | Verify no traffic for v6 route pointing to nexthop when RIF V6 is disabled | sairif.ipv6DisabledTest |
| nexthop.11 | Verify correct traffic with host route pointing to CPU interface as SAI_ROUTE_ENTRY_ATTR_NEXT_HOP_ID | sainhop.L3NexthopTest.cpuNexthopTest |
| nexthop.12 | Verify correct traffic with LPM route pointing to CPU interface as SAI_ROUTE_ENTRY_ATTR_NEXT_HOP_ID | sainhop.L3NexthopTest.cpuNexthopTest |
| nexthop.13 | Verify nexthop.11 and nexthop.12 for both V4 and V6 routes  | sainhop.L3NexthopTest.cpuNexthopTest |
| nexthop.14 | Route pointing to nexthop with neighbor deleted, post route flood | sairif.L3SVITest.sviIv4HostPortRoutedFloodTest, sairif.L3SVITest.sviIpv6HostPortRoutedFloodTest |
| nexthop.15 | Verify traffic for SVI nexthop with static MAC move to different interface | sairif.L3SVITest.sviIpv4HostStaticMacMoveTest, sairif.L3SVITest.sviipv6HostStaticMacMoveTest |
| nexthop.16 | Verify traffic for SVI nexthop with dynamic MAC move to different interface | sairif.L3SVITest.sviIpv4RouteDynamicMacMoveTest, sairif.L3SVITest.sviIpv6DynamicMacMoveTest |
| nexthop.17 | Verify traffic for nexthop resolution with ARP move         | sairif.L3SVITest.sviIpv4ArpMoveTest, sairif.L3SVITest.sviIpv6IcmpMoveTest |
| nexthop.18 | Verify traffic when nexthop with static MAC moves to LAG    | sairif.L3SVITest.sviIpv4LagHostStaticMacMoveTest, sairif.L3SVITest.sviIpv6LagHostStaticMacMoveTest |
| nexthop.19 | Verify traffic when nexthop with dynamic MAC moves to LAG   | sairif.L3SVITest.sviIpv4LagHostDynamicMacMoveTest, sairif.L3SVITest.sviIpv6LagHostDynamicMacMoveTest |
| nexthop.20 | Verify traffic for nexthop to RIF with MTU less than packet size | sairif.L3nterface.ipv4MtuTest, sairif.L3Interface.ipv6MtuTest |
| nexthop.21 | Verify traffic for nexthop to LAG RIF with MTU less than packet size | sairif.L3Interface.ipv4MtuTest, sairif.L3Interface.ipv6MtuTest |
| nexthop.22 | Verify nexthop.14 to nexthop.21 fot both V4 and V6 routes  | nexthop.14 - nexthop.21 test names |

## Nexthop Group

## Policer

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| policer.1  | Verify policer creation for various meter types. | saipolicer.policerCreate |
| policer.2  | Verfiy policer creation for various supported color sources. | saipolicer.policerCreate |
| policer.3  | Verify policer creation for various modes. | saipolicer.policerCreate |
| policer.4  | Verify policer bind to hostif_trap_group with existing policer. | saipolicer.policerOverwriteTrapGroup |
| policer.5  | Verify policer bind to hostif_trap_group with no existing policer. | saipolicer.noPolicerTrapGroup |
| policer.6  | Verify policer can be bound to >1 hostif_trap_group. | saipolicer.Overflow1Policer2TrapGroups, saipolicer.Underflow1Policer2TrapGroups |
| policer.7  | Verify policer is being applied for all hostif_trap object if bound to >1 hostif_trap_group. | saipolicer.Overflow1Policer2TrapGroups, saipolicer.Underflow1Policer2TrapGroups |
| policer.8  | Verify policer unbind from one hostif_trap_group does not affect other. | saipolicer.Overflow1Policer2TrapGroups, saipolicer.Underflow1Policer2TrapGroups |
| policer.9  | Verify policer bind to ACL entry. | saipolicer.BindPolicerToAclEntry |
| policer.10 | Verify policer bind to ingress mirror session object. | saimirror.ingressMirrorPolicingTest |
| policer.11 | Verify policer bind to egress mirror session object. | saimirror.egressMirrorPolicingTest |
| policer.12 | Verify policer bind to port. | saipolicer.BindPolicerToPort |
| policer.13 | Verify policer works for SAI_PORT_ATTR_BROADCAST_STORM_CONTROL_POLICER_ID. | saipolicer.StormControlTests |
| policer.14 | Verify policer works for SAI_PORT_ATTR_MULTICAST_STORM_CONTROL_POLICER_ID. | saipolicer.StormControlTests |
| policer.15 | Verify policer works for SAI_PORT_ATTR_FLOOD_STORM_CONTROL_POLICER_ID. | saipolicer.StormControlTests |
| policer.16 | Verify counters per color. | saipolicer.VerifyColors |

## Port

## QoS Map

## Queue

| queue.1 | Query queue handles for the port. Query for SAI_QUEUE_ATTR_PORT and SAI_QUEUE_ATTR_INDEX attributes and validate. | saiqueue.portQueueQueryTest |
| queue.2 | Configure DSCP-->TC and TC-->Queue map table. Modify the queue index in the map table to reflect the correct queue. | saiqosmap.L3IPv4QosMapMultipleDscpToSingleTcMappingTest |
| queue.3 | Configure PCP-->TC and TC-->Queue map table. Modify the queue index in the map table to reflect the correct queue. | saiqosmap.L2QosMapOneToOnePCPToTcMappingTest |
| queue.4 | Configure PFC priority to Queue map table. Modify the queue index in the map table to reflect the correct queue. | saiqueue.pfcPriorityQueueTest |
| queue.5 | Query SAI_QUEUE_ATTR_PARENT_SCHEDULER_NODE attribute. | saiqueue.portQueueQueryTest |
| queue.6 | Assign queue WRED profile and validate WRED functionality. | saiqueue.wredQueueTest |
| queue.7 | Assign queue buffer profile and validate the buffer profile parameters. | saiqueue.bufferQueueTest |
| queue.8 | Remove queue buffer profile and the queue should be assigned to the default buffer profile. | saiqueue.bufferQueueTest |
| queue.9 | Attach Scheduler profile to the queue and validate Queue priority, Weight, min/max rate. | saiqueue.schedulerQueueTest |
| queue.10 | Modify the attached scheduler profile parameters and validate those parameters. | saiqueue.schedulerQueueTest |
| queue.11 | Try above tests on CPU port queue object. | saiqueue.cpuPortQueueObjectTest |
| queue.12 | Verify a queue creation. | saiqueue.queueCreateTest |

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

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| | L3 Interface | |
| rif.1  | Verify IPv4 packets are dropped when admin_v4_state is False | sairif.L3Interface.ipv4DisableTest |
| rif.2  | Verify IPv6 packets are dropped when admin_v6_state is False | sairif.L3Interface.ipv6DisableTest |
| rif.3  | Verify packet forwarded correctly after MAC address update | sairif.L3Interface.macUpdateTest |
| rif.4  | Verify packet dropped for old MAC address after update | sairif.L3Interface.macUpdateTest |
| rif.5  | Verify basic forwarding for IPv4 host | sairif.L3Interface.ipv4FibTest |
| rif.6  | Verify basic forwarding for IPv6 host | sairif.L3Interface.ipv6FibTest |
| rif.7  | Verify basic forwarding for IPv4 LPM | sairif.L3Interface.ipv4FibLPMTest |
| rif.8  | Verify basic forwarding for IPv6 LPM | sairif.L3Interface.ipv6FibLPMTest |
| rif.9  | Verify IPv4 packet forwarded with packet size less than MTU | sairif.L3Interface.ipv4MtuTest |
| rif.10 | Verify IPv4 packet forwarded with packet size equal to MTU | sairif.L3Interface.ipv4MtuTest |
| rif.11 | Verify IPv4 packet dropped with packet size greated than MTU | sairif.L3Interface.ipv4MtuTest |
| rif.12 | Verify IPv4 packet with packet size greater than MTU punted to CPU if trap present | sairif.L3MtuTrapTest.ipv4MtuTest |
| rif.13 | Verify IPv6 packet forwarded with packet size less than MTU | sairif.L3Interface.ipv6MtuTest |
| rif.14 | Verify IPV6 packet forwarded with packet size equal to MTU | sairif.L3Interface.ipv6MtuTest |
| rif.15 | Verify IPv6 packet dropped with packet size greated than MTU | sairif.L3Interface.ipv6MtuTest |
| rif.16 | Verify IPv6 packet with packet size greater than MTU punted to CPU if trap present | sairif.L3MtuTrapTest.ipv6MtuTest |
| rif.17 | Verify packet forward after MTU change for IPv4 | sairif.L3Interface.ipv4MtuTest |
| rif.18 | Verify packet forward after MTU change for IPv6 | sairif.L3Interface.ipv6MtuTest |
| rif.19 | Verify same MTU value shared between RIF | sairif.L3Interface.rifSharedMtuTest |
| rif.20 | Verify MTU check works after deleting another RIF with the same MTU value | sairif.L3Interface.rifSharedMtuTest |
| rif.21 | Verify MTU value works after adding another RIF with the same MTU value | sairif.L3Interface.rifSharedMtuTest |
| rif.22 | Verify basic forwarding on RIF using LAG IPv4 | sairif.L3Interface.ipv4FibLagTest |
| rif.23 | Verify basic forwarding on RIF using LAG with new lag member IPv4 | sairif.L3Interface.ipv4FibLagTest |
| rif.24 | Verify packet dropped on ingress port after being removed from LAG IPv4 | sairif.L3Interface.ipv4FibLagTest |
| rif.25 | Verify basic forwarding on RIF using LAG IPv6 | sairif.L3Interface.ipv6FibLagTest |
| rif.26 | Verify basic forwarding on RIF using LAG with new lag member IPv6 | sairif.L3Interface.ipv6FibLagTest |
| rif.27 | Verify packet dropped on ingress port after being removed from LAG IPv6 | sairif.L3Interface.ipv6FibLagTest |
| rif.28 | Verify create fails when TYPE is PORT and port_id is 0 | sairif.L3Interface.negativeRifTest |
| rif.29 | Verify ingress ACL table bind to RIF | sairif.L3Interface.ipv4IngressAclTest |
| rif.30 | Verify egress ACL table bind to RIF | sairif.L3Interface.ipv4EgressAclTest |
| rif.31 | Verify ingress ACL group bind to RIF | sairif.L3Interface.ipv4IngressAclTest |
| rif.32 | Verify egress ACL group bind to RIF | sairif.L3Interface.ipv6EgressAclTest |
| rif.33 | Verify IPv4 multicast packets are dropped when V4_MCAST_ENABLE is False | sairif.L3Interface.mcastDisableTest |
| rif.34 | Verify Ipv6 multicast packets are dropped when V6_MCAST_ENABLE is False | sairif.L3Interface.mcastDisableTest |
| rif.35 | Verify multiple loopback RIF on same VRF is allowed | sairif.L3Interface.loopbackRifTest |
| rif.36 | Verify Ingress RIF stats for unicast packets | sairif.L3Interface.rifStatsTest |
| rif.37 | Verify Ingress RIF stats for multicast packets | sairif.L3Interface.rifStatsTest |
| rif.38 | Verify Egress RIF stats for unicast packets | sairif.L3Interdface.rifStatsTest |
| rif.39 | Verify Egress RIF stats for multicast packets | sairif.L3Interface.rifStatsTest |
| rif.40 | Verify MYIP works for subnet routes | sairif.L3Interface.rifMyIPTest |
| rif.41 | Verify duplicate L3 RIF creation fails | sairif.L3Interface.duplicatePortRifCreationTest |
| rif.42 | Verify RIF can be created or updated with custom rmac | sarif.L3Interface.rifCreateOrUpdateRmacTest |
| | Sub-port Interface | |
| rif.43  | Verify packet routed with valid vlan on sub-port | sairif.L3SubPortTest.rifToSubPortTest |
| rif.44  | Verify packet dropped when invalid vlan tag on port | sairif.L3SubPortTest.pvMissTest |
| rif.45  | Verify up to 256 sub-ports can be created per port or LAG | sairif.L3SubPortTest.subPortNoTest |
| rif.46  | Verify multiple sub-ports with same vlan ID and different ports | sairif.L3SubPortTest.setUp |
| rif.47  | Verify packet not flooded on tagged VLAN when no route hit | sairif.L3SubPortTest.noFloodTest |
| rif.48  | Verify routing between sub-ports | sairif.L3SubPortTest.subPortToSubPortTest |
| rif.49  | Verify routing between sub-ports on the same physical port or LAG | sairif.L3SubPortTest.subPortToSubPortTest |
| rif.50  | Verify routing between SVI and sub-port | sairif.L3SubPortTest.subPortToRifTest |
| rif.51  | Verify routing between L3 RIF and sub-port | sairif.L3SubPortTest.rifToSubPortTest |
| rif.52  | Verify load-balancing when sub-port is part of ECMP | sairif.L3SubPortTest.subPortECMPTest |
| rif.53  | Verify tunnel encap-decap over sub-port| sairif.TunnelL3SubPortTest.subPortTunnelTest |
| rif.54  | Verify IP2ME is working for sub-port | sairif.L3SubPortTest.subPortMyIPTest |
| rif.55  | Verify admin atatus DOWN disabled packet forwarding on ingress | sairif.L3SubPortTest.subPortAdminV*StatusTest |
| rif.56  | Verify hostif creation with CPU rx/tx | saihostif multiple tests |
| rif.57  | Create a VLAN RIF and sub-port RIF with the same vlan number and make sure two separete RIFs are created. Now delete VLAN and make sure sub-port RIF is not impacted. Repeat but this time delete the sub-port RIF.| sairif.L3SubPortTest.vlanConflictTest |
| rif.58  | Verify ingress ACL table is bound correctly to sub-port | sairif.L3SubPortTest.subPortIngressAclTest |
| rif.59  | Verify egress ACL table is bound correctly to sub-port | sairif.L3SubPortTest.subPortEgressAclTest |
| rif.60  | Verify ingress ACL group is bound correctly to sub-port | sairif.L3SubPortTest.subPortIngressAclTest |
| rif.61  | Verify egress ACL group is bound correctly to sub-port | sairif.L3SubPortTest.subPortEgressAclTest |
| rif.62  | Verify QoS group setting inherited from parent port or LAG | sairif.L3SubPortTest.subPortQosGroupTest |
| rif.63  | Verify IPv4 packets are dropped when admin_v4_state is False | sairif.L3SubPortTest.subPortAdminV4StatusTest |
| rif.64  | Verify IPv6 packets are dropped when admin_v6_state is False| sairif.L3SubPortTest.subPortAdminV6StatusTest |
| rif.65  | Verify IPv4 packet forwarded with packet size less than MTU | sairif.L3SubPortTest.subPotyV4MtuTest |
| rif.66  | Verify IPv4 packet forwarded with packet size equal to MTU | sairif.L3SubPortTest.subPortV4MtuTest |
| rif.67  | Verify IPv4 packet dropped with packet size greater than MTU | sairif.L3SubPortTest.subPortV4MtuTest |
| rif.68  | Verify IPv4 packet with packet size greater than MTU punted to CPU if trap present | sairif.L3MtuTrapTest.subPortIpv4MtuTrapTest |
| rif.69  | Verify IPv6 packet forwarded with packet size less than MTU | sairif.L3SubPortTest.subPortV6MtuTest |
| rif.70  | Verify IPv6 packet forwarded with packet size equal to MTU | sairif.L3SubPortTest.subPortV6MtuTest |
| rif.71  | Verify IPv6 packet dropped with packet size greated than MTU | sairif.L3SubPortTest.subPortV6MtuTest |
| rif.72  | Verify IPv6 packet with packet size greater than MTU punted to CPU if trap present | sairif.L3MtuTrapTest.subPortIpv6MtuTrapTest |
| rif.73  | Verify packet forwarded after MTU change for IPv4 | sairif.L3SubPortTest.subPortV4MtuTest |
| rif.74  | Verify packet forwarded after MTU change for IPv6 | sairif.L3SubPortTest.subPortV6MtuTest |
| rif.75  | Verify ingress sub-port stats for unicast packets | sairif.L3SubPortTest.subPortStatsTest |
| rif.76  | Verify egress sub-port stats for unicast packets | sairif.L3SubPortTest.subPortStatsTest |
| rif.77  | Verify MYIP works for subnet routes | sairif.L3SubPortTest.subPortMyIPTest |
| | VLAN Interface | |
| rif.78  | Verify IPv4 packets are dropped when admin_v4_state is False | sairif.L3SviTest.sviRifIpv4DisableTest |
| rif.79  | Verify IPv6 packets are dropped when admin_v6_state is False | sairif.L3SviTest.sviRifIpv6DisableTest |
| rif.80  | Verify L2 bridging on SVI port for rmac miss | sairif.L3SviTest.sviBridgingTest |
| rif.81  | Verify L2 flooding on SVI for broadcast packet| sairif.L3SviTest.sviBridgingTest |
| rif.82  | Verify routing between SVIs | sairif.L3SviTest.sviToSviRoutingTest |
| rif.83  | Verify routing after NHOP resolved via static MAC entry | sairif.L3SviTest.sviHostTest.sviHostTest |
| rif.84  | Verify routing after NHOP resolved via static MAC entry on tagged member | sairif.L3SviTest.sviHostVlanTaggingTest |
| rif.85  | Verify port routed flood when static MAC entry is missing | sairif.L3SviTest.svIPv4HostPostRoutedFloodTest, sairif.L3SviTest.sviIPv6HostPostRoutedFloodTest |
| rif.86  | Verify routing after NHOP resolved via static MAC move | sairif.L3SviTest.sviIPv4HostStaticMacMoveTest, sairif.L3SviTest.sviIPv6HostStaticMacMoveTest |
| rif.87  | Verify routing after NHOP resolved via dynamically learnt MAC entry | sairif.L3SviTest.sviRouteDynamicMacTest |
| rif.88  | Verify routing after NHOP resolved when dynamically learnt MAC entry is moved | sairif.L3SviTest.sviRouteDynamicMacMoveTest |
| rif.89  | Verify routing after NHOP resolved via dynamically after neighbor is moved | sairif.L3SviTest.sviIPv4ArpMoveTest, sairif.L3SviTest.sviIPv6IcmpMoveTest |
| rif.90  | Verify routing after NHOP resolved via static MAC entry on LAG | sairif.L3SviTest.sviLagHostTest |
| rif.91  | Verify routing after NHOP resolved via static MAC move for LAG | sairif.L3SviTest.sviIPv4LagHostStaticMacMoveTest, sairif.L3SviTest.sviIPv6LagHostStaticMacMoveTest |
| rif.92  | Verify routing after NHOP resolved via dynamically learnt MAC entry for LAG | sairif.L3SviTest.sviLagHostDynamicMacTest |
| rif.93  | Verify routing after NHOP resolved when dynamically learnt MAC entry is moved for LAG| sairif.L3SviTest.sviIPv4LagHostDynamicMacMoveTest, sairif.L3SviTest.sviIPv6LagHostDynamicMacMoveTest |
| rif.94  | Verify IPv4 packet forwarded with packet size less than MTU | sairif.L3SviTest.sviIPv4MtuTest |
| rif.95  | Verify IPv4 packet forwarded wth packet size equal to MTU | sairif.L3SviTest.sviIPv4MtuTest |
| rif.96  | Verify IPv4 packet dropped with packet size greater than MTU | sairif.L3SviTest.sviIPv4MtuTest |
| rif.97  | Verify IPv4 packet with packet size greater than MTU punted to CPU if trap present| sairif.L3MtuTrapTest.sviIpv4MtuTrapTest |
| rif.98  | Verify IPv6 packet forwarded with packet size less than MTU | sairif.L3SviTest.sviIPv6MtuTest |
| rif.99  | Verify Ipv6 packet forwarded with packet size equal to MTU | sairif.L3SviTest.sviIPv6MtuTest |
| rif.100 | Verify IPv6 packet dropped with packet size greater than MTU | sairif.L3SviTest.sviIPv6MtuTest |
| rif.101 | Verify IPv6 packet with packet size greater than MTU punted to CPU if trap present | sairif.L3MtuTrapTest.svi.Ipv6MtuTrapTest |
| rif.102 | Verify packet forward after MTU change for IPv4 | sairif.L3SviTest.sviIPv4MtuTest |
| rif.103 | Verify packet forward after MTU change for IPv6 | sairif.L3SviTest.sviIPv6MtuTest |
| rif.104 | Verify ingress sub-port stats for unicast packets | sairif.L3SviTest.sviStatsTest |
| rif.105 | Verify egress sub-port stats for unicast packets | sairif.L3SviTest.sviStatsTest |
| rif.106 | Verify ingress sub-port stats for broadcast packets | sairif.L3SviTest.sviStatsTest |
| rif.107 | Verify egress sub-port stats for broadcast packets | sairif.L3SviTest.sviStatsTest |
| rif.108 | Verify packet not routed if tagged packet ingresses on untagged SVI | sairif.L3SviTest.sviTaggingTest |
| rif.109 | Verify packet dropped if unknown vlan tagged packet on tagged SVI | sairif.L3SviTest.sviTaggingTest |
| rif.110 | Verify IP2ME on untagged RIF port | sairif.L3SviTest.sviMyIPTest |
| rif.111 | Verify IP2ME on tagged RIF port | sairif.L3SviTest.sviMyIPTest |
| rif.112 | Verify ARP reply from linux interface on untagged RIF | sairif.L3SviTest.sviArpReplyTest |
| rif.113 | Verify ARP reply from linux interface on tagged RIF | sairif.L3SviTest.?????????????? |
| rif.114 | Verify MYIP works for subnet routes | sairif.L3SviTest.sviMyIPTest |
| rif.115 | Verify create fails when TYPE is VLAN and vlan_id is 0 | sairif.L3SviTest.incorrectVlanIdTest |
| rif.116 | Verify duplicate VLAN interface creation fails | sairif.L3SviTest.duplicateVlanRifCreationTest |
| | Common tests | |
| rif.117 | Verify MTU trap packet statistics | sairif.L3MtuTrapTest.mtuPacketStatsTest |
| rif.119 | Verify get of non existent RIF fails | sairif.L3Interface.negativeRifTest |
| rif.120 | Verify removal of non existent RIF fails | sairif.L3Interface.negativeRifTest |
| rif.121 | Verify set of non existent RIF fails | sairif.L3Interface.negativeRifTest |
| rif.122 | Verify create fails with invalid vrf_id | sairif.L3Interface.negativeRifTest |

## Scheduler

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| scheduler.1 | Create scheduler with SAI_SCHEDULING_TYPE_DWRR and attach to queue. Set and verify SAI_SCHEDULER_ATTR_SCHEDULING_WEIGHT. Attach scheduler to a Queue by SAI queue attribute SAI_QUEUE_ATTR_SCHEDULER_PROFILE_ID | saischeduler.SchedulerParamsTest.schedulerWeightTest |
| scheduler.2 | Create scheduler with SAI_SCHEDULING_TYPE_STRICT and attach to queue | saischeduler.SchedulerParamsTest.schedulerStrictPriorityTest |
| scheduler.3 | Create scheduler with SAI_SCHEDULER_ATTR_MIN_BANDWIDTH_RATE and attach to queue | saischeduler.SchedulerParamsTest.schedulerMinBwidthRateTest |
| scheduler.4 | Create scheduler with SAI_SCHEDULER_ATTR_MAX_BANDWIDTH_RATE and attach to queue | saischeduler.SchedulerParamsTest.schedulerMaxBwidthRateTest |
| scheduler.5 | Create scheduler with SAI_SCHEDULER_ATTR_MIN_BANDWIDTH_BURST_RATE and attach to queue | saischeduler.SchedulerParamsTest.schedulerMinBwidthBurstRateTest |
| scheduler.6 | Create scheduler with SAI_SCHEDULER_ATTR_MAX_BANDWIDTH_BURST_RATE and attach to queue  | saischeduler.SchedulerParamsTest.schedulerMaxBwidthBurstRateTest |
| scheduler.7 | Modify different scheduler parameters and validate. | saischeduler.SchedulerParamsTest |
| scheduler.8 | Verify attaching scheduler with SAI_SCHEDULING_TYPE_DWRR to a scheduler group | saischeduler.SchedulerGroupAttachTest.schedulerWeightGroupAttachTest |
| scheduler.9 | Verify attaching scheduler with SAI_SCHEDULING_TYPE_STRICT to a scheduler group | saischeduler.SchedulerGroupAttachTest.schedulerStrictPriorityGroupAttachTest |
| scheduler.10 | Verify attaching scheduler with SAI_SCHEDULER_ATTR_MIN_BANDWIDTH_RATE to a scheduler group | saischeduler.SchedulerGroupAttachTest.schedulerMinBwidthRateGroupAttachTest |
| scheduler.11 | Verify attaching scheduler with SAI_SCHEDULER_ATTR_MAX_BANDWIDTH_RATE to a scheduler group | saischeduler.SchedulerGroupAttachTest.schedulerMaxBwidthRateGroupAttachTest |
| scheduler.12 | Verify attaching scheduler with SAI_SCHEDULER_ATTR_MIN_BANDWIDTH_BURST_RATE to a scheduler group | saischeduler.SchedulerGroupAttachTest.schedulerMinBwidthBurstRateGroupAttachTest |
| scheduler.13 | Verify attaching scheduler with SAI_SCHEDULER_ATTR_MAX_BANDWIDTH_BURST_RATE to a scheduler group | saischeduler.SchedulerGroupAttachTest.schedulerMaxBwidthBurstRateGroupAttachTest |
| scheduler.14 | Attach scheduler with SAI_SCHEDULER_ATTR_MAX_BANDWIDTH_RATE to a port using SAI port attribute - SAI_PORT_ATTR_QOS_SCHEDULER_PROFILE_ID | saischeduler.SchedulerPortAttachTest.schedulerMaxBwidthRatePortAttachTest |
| scheduler.15 | Attach scheduler with SAI_SCHEDULER_ATTR_MAX_BANDWIDTH_BURST_RATE to a port using SAI port attribute - SAI_PORT_ATTR_QOS_SCHEDULER_PROFILE_ID | saischeduler.SchedulerPortAttachTest.schedulerMaxBwidthBurstRatePortAttachTest |

## Scheduler Group

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| schedulergroup.1 | Query and verify the number of scheduler groups per port using PORT attribute - SAI_PORT_ATTR_QOS_NUMBER_OF_SCHEDULER_GROUPS | saischedulergroup.SchGroupParamsTest |
| schedulergroup.2 | Query and verify the list of scheduler groups per port using PORT Attribute - SAI_PORT_ATTR_QOS_SCHEDULER_GROUP_LIST | saischedulergroup.SchGroupParamsTest |
| schedulergroup.3 | Query and verify the SAI_SCHEDULER_GROUP_ATTR_PORT_ID of scheduler group and match with the port object. | saischedulergroup.SchGroupParamsTest |
| schedulergroup.4 | Query and verify the scheduler profile attached to this scheduler group using attribute - SAI_SCHEDULER_GROUP_ATTR_CHILD_LIST | saischedulergroup.SchGroupParamsTest |
| schedulergroup.5 | Query and verify the queue count associated with this scheduler group - SAI_SCHEDULER_GROUP_ATTR_CHILD_COUNT | saischedulergroup.SchGroupParamsTest |
| schedulergroup.6 | Attach the scheduler profile to scheduler group using - SAI_SCHEDULER_GROUP_ATTR_SCHEDULER_PROFILE_ID | saischedulergroup.SchGroupParamsTest |
| schedulergroup.7 | Modify the parameters of the scheduler profile and verify if those attributes are updated per port or queue associated to the scheduler group. | saischedulergroup.SchGroupParamsTest |
| schedulergroup.8 | Verify if scheduler group creation fails without mandatory parameters | saischedulergroup.SchGroupCreateFailTest |

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

| Test case id | Description | Test name |
| ------------ | ----------- | --------- |
| vlan.1  | Verify forwarding from untagged to untagged port                       | saivlan.L2VlanTest.forwardingTest |
| vlan.2  | Verify forwarding from untagged to tagged port                         | saivlan.L2VlanTest.forwardingTest |
| vlan.3  | Verify forwarding from tagged to tagged port                           | saivlan.L2VlanTest.forwardingTest |
| vlan.4  | Verify forwarding from tagged to untagged port                         | saivlan.L2VlanTest.forwardingTest |
| vlan.5  | Verify forwarding of native vlan on tagged port                        | saivlan.L2VlanTest.nativeVlanTest |
| vlan.6  | Verify forwarding of native vlan on tagged LAG                         | saivlan.L2VlanTest.nativeVlanTest |
| vlan.7  | Verify forwarding of priority tagged packets on port                   | saivlan.L2VlanTest.priorityTaggingTest |
| vlan.8  | Verify forwarding of priority tagged packets on LAG                    | saivlan.L2VlanTest.priorityTaggingTest |
| vlan.9  | Verify drops for invalid port-vlan packet on untagged port             | saivlan.L2VlanTest.pvDropTest |
| vlan.10 | Verify drops for invalid port-vlan packet on untagged LAG all members  | saivlan.L2VlanTest.lagPvMissTest |
| vlan.11 | Verify drops for invalid port-vlan packet on tagged port               | saivlan.L2VlanTest.pvDropTest |
| vlan.12 | Verify drops for invalid port-vlan packet on taggeed LAG all members   | saivlan.L2VlanTest.lagPvMissTest |
| vlan.13 | Verify flooding on tagged ports with correct tagging                   | saivlan.L2VlanTest.vlanFloodTest |
| vlan.14 | Verify flooding on tagged LAGs with correct tagging                    | saivlan.L2VlanTest.vlanFloodTest |
| vlan.15 | Verify flooding on untagged ports with no tagging                      | saivlan.L2VlanTest.vlanFloodTest |
| vlan.16 | Verify flooding on untagged LAGs with no tagging                       | saivlan.L2VlanTest.vlanFloodTest |
| vlan.17 | Verify flooding after add tagged physical port vlan member             | saivlan.L2VlanTest.vlanFloodTest |
| vlan.18 | Verify flooding after add untagged physical port vlan member           | saivlan.L2VlanTest.vlanFloodTest |
| vlan.19 | Verify flooding after add tagged LAG vlan member                       | saivlan.L2VlanTest.vlanFloodTest |
| vlan.20 | Verify flooding after add untagged LAG vlan member                     | saivlan.L2VlanTest.vlanFloodTest |
| vlan.21 | Verify flooding adter add tagged LAG member port                       | saivlan.L2VlanTest.vlanFloodEnhancedTest |
| vlan.22 | Verify flooding after add untagged LAG member port                     | saivlan.L2VlanTest.vlanFloodEnhancedTest |
| vlan.23 | Verify flooding after remove tagged physical port vlan member          | saivlan.L2VlanTest.vlanFloodTest |
| vlan.24 | Verify flooding after remove untagged physical port vlan member        | saivlan.L2VlanTest.vlanFloodTest |
| vlan.25 | Verify flooding after remove tagged LAG vlan member                    | saivlan.L2VlanTest.vlanFloodTest |
| vlan.26 | Verify flooding after remove untagged LAG vlan member                  | saivlan.L2VlanTest.vlanFloodTest |
| vlan.27 | Verify flooding after remove tagged LAG member port                    | saivlan.L2VlanTest.vlanFloodEnhancedTest |
| vlan.28 | Verify flooding after remove untagged LAG member port                  | saivlan.L2VlanTest.vlanFloodEnhancedTest |
| vlan.29 | Verify ingress port pruning on ports when flooding                     | saivlan.L2VlanTest.vlanFloodPruneTest |
| vlan.30 | Verify ingress port pruning on LAG when flooding                       | saivlan.L2VlanTest.vlanFloodPruneTest |
| vlan.31 | Verify ingress Unicast/Multicast/Broadcast statistics for VLAN         | saivlan.L2VlanTest.vlanStatsTest |
| vlan.32 | Verify egress Unicast/Multicast/Broadcast statistics for VLAN          | saivlan.L2VlanTest.vlanStatsTest |
| vlan.33 | Verify clear statistics for VLAN                                       | saivlan.L2VlanTest.vlanStatsTest.countersClearTest |
| vlan.34 | Verify learning disabled attribute for VLAN                            | saivlan.L2VlanTest.vlanLearningTest |
| vlan.35 | Verify VLAN member list using SAI_VLAN_ATTR_MEMBER_LIST                | saivlan.L2VlanTest.vlanMemberList |
| vlan.36 | Verify flooding for the VLAN which contains ports and LAGs             | saivlan.L2VlanTest.vlanFloodEnhancedTest |
| vlan.37 | Verify duplicate VLAN creation fails                                   | saivlan.L2VlanTest.vlanNegativeTest |
| vlan.38 | Verify non-existent VLAN get fails                                     | saivlan.L2VlanTest.vlanNegativeTest |
| vlan.39 | Verify non-existent VLAN remove fails                                  | saivlan.L2VlanTest.vlanNegativeTest |
| vlan.40 | Verify non-existent VLAN set fails                                     | saivlan.L2VlanTest.vlanNegativeTest |
| vlan.41 | Verify vlan member add fails with invalid vlan ID                      | saivlan.L2VlanTest.vlanNegativeTest |
| vlan.42 | Verify vlan member add fails with invalid port ID                      | saivlan.L2VlanTest.vlanNegatieTest |
| vlan.43 | Verify packet is dropped when ingress on single vlan member (no flood and pruned) | saivlan.L2VlanTest.singleVlanMemberTest |
| vlan.44 | Verify flood control attributes for VLAN ('all' and 'none')            | saivlan.L2VlanTest.vlanFloodDisableTest |
| vlan.45 | Verify binding VLAN to egress acl table                                | saivlan.L2VlanTest.vlanEgressAcl |
| vlan.46 | Verify binding VLAN to ingress acl table                               | saivlan.L2VlanTest.vlanIngressAcl |
| vlan.47 | Verify disable learn on vlan if mac entries in fdb table equals or more than MaxLearnedAddresses attrbute | saivlan.L2VlanTest.vlanMacLearnedAddressesTest |

## WRED
