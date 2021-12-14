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
