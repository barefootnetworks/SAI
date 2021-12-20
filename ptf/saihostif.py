# Copyright 2020-present Barefoot Networks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""
Thrift SAI interface host interface tests
"""

from __future__ import print_function

from sai_thrift.sai_headers import *

from sai_base_test import *


class HostifCreationTest(SaiHelper):
    '''
    Tests host interface creation and packet RX for hostif type = netdev
    and different host interface object types
    '''
    def runTest(self):
        try:
            self.portNetdevHostifCreationTest()
            self.lagNetdevHostifCreationTest()
            self.vlanSviNetdevHostifCreationTest()
        finally:
            pass

    def tearDown(self):
        sai_thrift_flush_fdb_entries(self.client,
                                     entry_type=SAI_FDB_FLUSH_ENTRY_TYPE_ALL)

        super(HostifCreationTest, self).tearDown()

    def portNetdevHostifCreationTest(self):
        '''
        This verifies the correctness of host interface creation of type netdev
        with object type Port.
        The test verifies also if management packets are passed to ports host
        interfaces after hostif table wildcard entry creation.
        '''
        print("\nportNetdevHostifCreationTest()")

        hostif1_port = self.port24
        hostif1_dev_port = self.dev_port24
        hostif1_name = "hostif1"

        hostif2_port = self.port25
        hostif2_dev_port = self.dev_port25
        hostif2_name = "hostif2"

        lldp_mac = "01:80:c2:00:00:0e"
        lldp_pkt = simple_eth_packet(eth_dst=lldp_mac,
                                     pktlen=100,
                                     eth_type=0x88cc)

        try:
            hostif1 = sai_thrift_create_hostif(self.client,
                                               name=hostif1_name,
                                               obj_id=hostif1_port,
                                               type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(hostif1 != 0)
            hostif2 = sai_thrift_create_hostif(self.client,
                                               name=hostif2_name,
                                               obj_id=hostif2_port,
                                               type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(hostif2 != 0)

            hif1_socket = open_packet_socket(hostif1_name)
            hif2_socket = open_packet_socket(hostif2_name)

            lldp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(lldp_trap != 0)

            channel = SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_NETDEV_PHYSICAL_PORT
            hif_tbl_entry = sai_thrift_create_hostif_table_entry(
                self.client,
                channel_type=channel,
                type=SAI_HOSTIF_TABLE_ENTRY_TYPE_WILDCARD)
            self.assertTrue(hif_tbl_entry != 0)

            pre_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)

            print("Sending LLDP packet on port %d" % hostif1_dev_port)
            send_packet(self, hostif1_dev_port, lldp_pkt)

            print("Verifying LLDP packet on port host interface")
            self.assertTrue(socket_verify_packet(lldp_pkt, hif1_socket))
            print("\tOK")

            print("Sending LLDP packet on port %d" % hostif2_dev_port)
            send_packet(self, hostif2_dev_port, lldp_pkt)

            print("Verifying LLDP packet on port host interface")
            self.assertTrue(socket_verify_packet(lldp_pkt, hif2_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                pre_stats["SAI_QUEUE_STAT_PACKETS"] + 2)
            print("\tOK")

            print("\tVerification complete")

        finally:
            self.dataplane.flush()
            sai_thrift_remove_hostif_table_entry(self.client, hif_tbl_entry)
            sai_thrift_remove_hostif_trap(self.client, lldp_trap)
            sai_thrift_remove_hostif(self.client, hostif1)
            sai_thrift_remove_hostif(self.client, hostif2)

    def lagNetdevHostifCreationTest(self):
        '''
        This verifies the correctness of host interface creation of type netdev
        with object type LAG.
        The test verifies also if management packets are passed to LAG host
        interface after hostif table wildcard entry creation.
        '''
        print("\nlagNetdevHostifCreationTest()")

        lag_ports = [self.port24, self.port25]
        lag_dev_ports = [self.dev_port24, self.dev_port25]
        lag_hostif_name = "lag_hostif"

        lacp_mac = "01:80:c2:00:00:02"
        lacp_pkt = simple_eth_packet(eth_dst=lacp_mac,
                                     pktlen=100,
                                     eth_type=0x8809)/(chr(0x01) + (chr(0x01)))

        try:
            lag10 = sai_thrift_create_lag(self.client)

            lag_hostif = sai_thrift_create_hostif(self.client,
                                                  name=lag_hostif_name,
                                                  obj_id=lag10,
                                                  type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(lag_hostif != 0)

            lag_hif_socket = open_packet_socket(lag_hostif_name)

            lacp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LACP)
            self.assertTrue(lacp_trap != 0)

            channel = SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_NETDEV_LOGICAL_PORT
            hif_tbl_entry = sai_thrift_create_hostif_table_entry(
                self.client,
                channel_type=channel,
                type=SAI_HOSTIF_TABLE_ENTRY_TYPE_WILDCARD)
            self.assertTrue(hif_tbl_entry != 0)

            # create LAG members
            lag10_member1 = sai_thrift_create_lag_member(self.client,
                                                         lag_id=lag10,
                                                         port_id=lag_ports[0])
            lag10_member2 = sai_thrift_create_lag_member(self.client,
                                                         lag_id=lag10,
                                                         port_id=lag_ports[1])

            pre_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)

            for dev_port in lag_dev_ports:
                print("Sending LACP packet on LAG port %d" % dev_port)
                send_packet(self, dev_port, lacp_pkt)

                print("Verifying LACP packet on LAG host interface")
                self.assertTrue(socket_verify_packet(lacp_pkt, lag_hif_socket))
                print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                pre_stats["SAI_QUEUE_STAT_PACKETS"] + len(lag_dev_ports))

            print("Removing LAG member and verifying LACP packet "
                  "is no longer received on LAG host interface")
            lag10_member1 = sai_thrift_remove_lag_member(self.client,
                                                         lag10_member1)
            self.assertTrue(lag10_member1 == 0)

            print("Sending LACP packet on port %d (removed from LAG)"
                  % lag_dev_ports[0])
            send_packet(self, lag_dev_ports[0], lacp_pkt)
            print("Verifying CPU port queue stats")
            pre_stats = post_stats
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                pre_stats["SAI_QUEUE_STAT_PACKETS"] + 1)

            print("Verifying no LACP packet on LAG host interface")
            self.assertFalse(socket_verify_packet(lacp_pkt, lag_hif_socket))
            print("\tOK")
            print("\tVerification complete")

        finally:
            self.dataplane.flush()
            if lag10_member1:
                sai_thrift_remove_lag_member(self.client, lag10_member1)
            sai_thrift_remove_lag_member(self.client, lag10_member2)
            sai_thrift_remove_hostif_table_entry(self.client, hif_tbl_entry)
            sai_thrift_remove_hostif_trap(self.client, lacp_trap)
            sai_thrift_remove_hostif(self.client, lag_hostif)
            sai_thrift_remove_lag(self.client, lag10)

    def vlanSviNetdevHostifCreationTest(self):
        '''
        This verifies the correctness of host interfaces creation of type
        netdev with object type Port and LAG for VLAN members.
        The test verifies also if management packets are passed to correct host
        interfaces after hostif table wildcard entry creation.
        '''
        print("\nvlanSviNetdevHostifCreationTest()")

        vid = 100
        vlan_ports = [self.port24, self.port25]
        vlan_dev_ports = [self.dev_port24, self.dev_port25]
        vlan_hostif_name = "vlan_hostif"
        hostif1_name = "hostif1"
        hostif2_name = "hostif2"

        lag_ports = [self.port26, self.port27]
        lag_dev_ports = [self.dev_port26, self.dev_port27]
        lag_hostif_name = "lag_hostif"

        arp_pkt = simple_arp_packet(arp_op=1, pktlen=100)
        tag_arp_pkt = simple_arp_packet(arp_op=1, vlan_vid=vid, pktlen=104)

        try:
            lag10 = sai_thrift_create_lag(self.client)

            vlan100 = sai_thrift_create_vlan(self.client, vlan_id=vid)

            vlan_hostif = sai_thrift_create_hostif(self.client,
                                                   name=vlan_hostif_name,
                                                   obj_id=vlan100,
                                                   type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(vlan_hostif != 0)

            arp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_ARP_REQUEST)
            self.assertTrue(arp_trap != 0)

            # create LAG members
            lag10_member1 = sai_thrift_create_lag_member(self.client,
                                                         lag_id=lag10,
                                                         port_id=lag_ports[0])
            lag10_member2 = sai_thrift_create_lag_member(self.client,
                                                         lag_id=lag10,
                                                         port_id=lag_ports[1])

            lag_hostif = sai_thrift_create_hostif(self.client,
                                                  name=lag_hostif_name,
                                                  obj_id=lag10,
                                                  type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(lag_hostif != 0)

            lag_hif_socket = open_packet_socket(lag_hostif_name)

            # create VLAN members
            iport_bp = sai_thrift_create_bridge_port(
                self.client,
                bridge_id=self.default_1q_bridge,
                port_id=vlan_ports[0],
                type=SAI_BRIDGE_PORT_TYPE_PORT,
                admin_state=True)
            self.assertTrue(iport_bp != 0)
            eport_bp = sai_thrift_create_bridge_port(
                self.client,
                bridge_id=self.default_1q_bridge,
                port_id=vlan_ports[1],
                type=SAI_BRIDGE_PORT_TYPE_PORT,
                admin_state=True)
            self.assertTrue(eport_bp != 0)
            lag10_bp = sai_thrift_create_bridge_port(
                self.client,
                bridge_id=self.default_1q_bridge,
                port_id=lag10,
                type=SAI_BRIDGE_PORT_TYPE_PORT,
                admin_state=True)
            self.assertTrue(lag10_bp != 0)

            vlan100_member0 = sai_thrift_create_vlan_member(
                self.client,
                vlan_id=vlan100,
                bridge_port_id=iport_bp,
                vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)
            vlan100_member1 = sai_thrift_create_vlan_member(
                self.client,
                vlan_id=vlan100,
                bridge_port_id=eport_bp,
                vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_TAGGED)
            vlan100_member2 = sai_thrift_create_vlan_member(
                self.client,
                vlan_id=vlan100,
                bridge_port_id=lag10_bp,
                vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)

            sai_thrift_set_port_attribute(self.client, vlan_ports[0],
                                          port_vlan_id=vid)
            sai_thrift_set_lag_attribute(self.client, lag10, port_vlan_id=vid)

            hostif1 = sai_thrift_create_hostif(self.client,
                                               name=hostif1_name,
                                               obj_id=vlan_ports[0],
                                               type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(hostif1 != 0)

            hif1_socket = open_packet_socket(hostif1_name)

            hostif2 = sai_thrift_create_hostif(self.client,
                                               name=hostif2_name,
                                               obj_id=vlan_ports[1],
                                               type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(hostif2 != 0)

            hif2_socket = open_packet_socket(hostif2_name)

            hif_tbl_entry = sai_thrift_create_hostif_table_entry(
                self.client,
                channel_type=SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_NETDEV_L3,
                type=SAI_HOSTIF_TABLE_ENTRY_TYPE_WILDCARD)

            pre_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)

            print("Sending ARP packet on port %d (untagged VLAN member)"
                  % vlan_dev_ports[0])
            send_packet(self, vlan_dev_ports[0], arp_pkt)

            print("Verifying ARP packet on VLAN untagged port host interface")
            self.assertTrue(socket_verify_packet(arp_pkt, hif1_socket))
            print("\tOK")

            print("Sending ARP packet on port %d (tagged VLAN member)"
                  % vlan_dev_ports[1])
            send_packet(self, vlan_dev_ports[1], tag_arp_pkt)

            print("Verifying ARP packet on VLAN tagged port host interface")
            # VLAN tag should be removed on port host interface
            self.assertTrue(socket_verify_packet(arp_pkt, hif2_socket))
            print("\tOK")

            for dev_port in lag_dev_ports:
                print("Sending ARP packet on port %d (in LAG)" % dev_port)
                send_packet(self, dev_port, arp_pkt)

                print("Verifying ARP packet on LAG host interface")
                self.assertTrue(socket_verify_packet(arp_pkt, lag_hif_socket))
                print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                pre_stats["SAI_QUEUE_STAT_PACKETS"] + 4)
            print("\tVerification complete")

        finally:
            self.dataplane.flush()
            sai_thrift_flush_fdb_entries(
                self.client, entry_type=SAI_FDB_FLUSH_ENTRY_TYPE_ALL)

            sai_thrift_remove_hostif_table_entry(self.client, hif_tbl_entry)
            sai_thrift_remove_hostif(self.client, hostif1)
            sai_thrift_remove_hostif(self.client, hostif2)
            sai_thrift_remove_vlan_member(self.client, vlan100_member0)
            sai_thrift_remove_vlan_member(self.client, vlan100_member1)
            sai_thrift_remove_vlan_member(self.client, vlan100_member2)
            sai_thrift_set_port_attribute(
                self.client, vlan_ports[0], port_vlan_id=0)
            sai_thrift_set_lag_attribute(self.client, lag10, port_vlan_id=0)
            sai_thrift_remove_bridge_port(self.client, iport_bp)
            sai_thrift_remove_bridge_port(self.client, eport_bp)
            sai_thrift_remove_bridge_port(self.client, lag10_bp)
            sai_thrift_remove_hostif(self.client, lag_hostif)
            sai_thrift_remove_lag_member(self.client, lag10_member1)
            sai_thrift_remove_lag_member(self.client, lag10_member2)
            sai_thrift_remove_hostif_trap(self.client, arp_trap)
            sai_thrift_remove_hostif(self.client, vlan_hostif)
            sai_thrift_remove_vlan(self.client, vlan100)
            sai_thrift_remove_lag(self.client, lag10)


# setting VLAN tag mode for hostif is not fully implemented
class HostifTaggingTest(SaiHelper):
    '''
    Tests the ways of VLAN tags handling
    '''
    def runTest(self):
        try:
            self.hostifStripTagTest()
            self.hostifKeepTagTest()
            self.hostifOriginalTagTest()
        finally:
            pass

    def tearDown(self):
        sai_thrift_flush_fdb_entries(self.client,
                                     entry_type=SAI_FDB_FLUSH_ENTRY_TYPE_ALL)

        super(HostifTaggingTest, self).tearDown()

    def hostifStripTagTest(self):
        '''
        This verifies VLAN tag stripping on host interface
        '''
        print("\nhostifStripTagTest()")

        # vid = 10
        hostif_port = self.port1
        # hostif_dev_port = self.dev_port1
        hostif_name = "hostif"

        # lldp_mac = "01:80:c2:00:00:0e"
        # tag_pkt = simple_eth_dot1q_packet(eth_dst=lldp_mac,
        #                                   dl_vlan_enable=True,
        #                                   vlan_vid=vid,
        #                                   pktlen=104,
        #                                   eth_type=0x88cc)
        # exp_pkt = simple_eth_dot1q_packet(eth_dst=lldp_mac,
        #                                   dl_vlan_enable=False,
        #                                   pktlen=100,
        #                                   eth_type=0x88cc)

        try:
            hostif = sai_thrift_create_hostif(
                self.client,
                name=hostif_name,
                obj_id=hostif_port,
                type=SAI_HOSTIF_TYPE_NETDEV,
                vlan_tag=SAI_HOSTIF_VLAN_TAG_STRIP)
            self.assertTrue(hostif != 0)

            hif_attr = sai_thrift_get_hostif_attribute(self.client, hostif,
                                                       vlan_tag=True)
            self.assertEqual(hif_attr['vlan_tag'], SAI_HOSTIF_VLAN_TAG_STRIP)

            # hif_socket = open_packet_socket(hostif_name)

            # Uncomment when issue(SWI-3378) with vlan tag strip/add is fixed
            # lldp_trap = sai_thrift_create_hostif_trap(
            #     self.client,
            #     packet_action=SAI_PACKET_ACTION_TRAP,
            #     trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            # self.assertTrue(lldp_trap != 0)

            # print("Sending packet on port %d" % hostif_dev_port)
            # send_packet(self, hostif_dev_port, tag_pkt)

            # print("Verifying if packet on port host interface is untagged")
            # self.assertTrue(socket_verify_packet(exp_pkt, hif_socket))
            print("\tOK")

        finally:
            # sai_thrift_remove_hostif_trap(self.client, self.lldp_trap)
            sai_thrift_remove_hostif(self.client, hostif)

    def hostifKeepTagTest(self):
        '''
        This verifies VLAN tag keeping on host interface
        For tagged packets mode tag should be left unchanged, for untagged it
        should be added.
        '''
        print("\nhostifKeepTagTest()")

        # vid = 10
        hostif_port = self.port1
        # hostif_dev_port = self.dev_port1
        hostif_name = "hostif"

        # lldp_mac = "01:80:c2:00:00:0e"
        # tag_pkt = simple_eth_dot1q_packet(eth_dst=lldp_mac,
        #                                   dl_vlan_enable=True,
        #                                   vlan_vid=vid,
        #                                   pktlen=104,
        #                                   eth_type=0x88cc)
        # pkt = simple_eth_dot1q_packet(eth_dst=lldp_mac,
        #                               dl_vlan_enable=False,
        #                               pktlen=100,
        #                               eth_type=0x88cc)
        # exp_pkt = tag_pkt

        try:
            hostif = sai_thrift_create_hostif(
                self.client,
                name=hostif_name,
                obj_id=hostif_port,
                type=SAI_HOSTIF_TYPE_NETDEV,
                vlan_tag=SAI_HOSTIF_VLAN_TAG_KEEP)

            self.assertTrue(hostif != 0)

            hif_attr = sai_thrift_get_hostif_attribute(self.client, hostif,
                                                       vlan_tag=True)
            self.assertEqual(hif_attr['vlan_tag'], SAI_HOSTIF_VLAN_TAG_KEEP)

            # hif_socket = open_packet_socket(hostif_name)

            # Uncomment when issue(SWI-3378) with vlan tag strip/add is fixed
            # lldp_trap = sai_thrift_create_hostif_trap(
            #     self.client,
            #     packet_action=SAI_PACKET_ACTION_TRAP,
            #     trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            # self.assertTrue(lldp_trap != 0)

            # print("Sending tagged packet on port %d" % hostif_dev_port)
            # send_packet(self, hostif_dev_port, tag_pkt)

            # print("Verifying if packet on port host interface is tagged")
            # self.assertTrue(socket_verify_packet(exp_pkt, hif_socket))
            # print("\tOK")

            # print("Sending untagged packet on port %d" % hostif_dev_port)
            # send_packet(self, hostif_dev_port, pkt)

            # print("Verifying if packet on port host interface is tagged")
            # self.assertTrue(socket_verify_packet(exp_pkt, hif_socket))
            print("\tOK")

        finally:
            sai_thrift_remove_hostif(self.client, hostif)
            # sai_thrift_remove_hostif_trap(self.client, self.lldp_trap)

    def hostifOriginalTagTest(self):
        '''
        This verifies VLAN tag original tagging keeping on host interface
        '''
        print("\nhostifOriginalTagTest()")

        # vid = 10
        hostif_port = self.port1
        # hostif_dev_port = self.dev_port1
        hostif_name = "hostif"

        # lldp_mac = "01:80:c2:00:00:0e"
        # tag_pkt = simple_eth_dot1q_packet(eth_dst=lldp_mac,
        #                                   dl_vlan_enable=True,
        #                                   vlan_vid=vid,
        #                                   pktlen=104,
        #                                   eth_type=0x88cc)
        # pkt = simple_eth_dot1q_packet(eth_dst=lldp_mac,
        #                               dl_vlan_enable=False,
        #                               pktlen=100,
        #                               eth_type=0x88cc)
        # exp_pkt1 = tag_pkt
        # exp_pkt2 = pkt

        try:
            hostif = sai_thrift_create_hostif(
                self.client,
                name=hostif_name,
                obj_id=hostif_port,
                type=SAI_HOSTIF_TYPE_NETDEV,
                vlan_tag=SAI_HOSTIF_VLAN_TAG_ORIGINAL)
            self.assertTrue(hostif != 0)

            hif_attr = sai_thrift_get_hostif_attribute(self.client, hostif,
                                                       vlan_tag=True)
            self.assertEqual(hif_attr['vlan_tag'],
                             SAI_HOSTIF_VLAN_TAG_ORIGINAL)

            #  hif_socket = open_packet_socket(hostif_name)

            # Uncomment when issue(SWI-3378) with vlan tag strip/add is fixed
            # lldp_trap = sai_thrift_create_hostif_trap(
            #     self.client,
            #     packet_action=SAI_PACKET_ACTION_TRAP,
            #     trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            # self.assertTrue(lldp_trap != 0)

            # print("Sending tagged packet on port %d" % hostif_dev_port)
            # send_packet(self, hostif_dev_port, tag_pkt)

            # print("Verifying if packet on port host interface is tagged")
            # self.assertTrue(socket_verify_packet(exp_pkt1, hif_socket))
            # print("\tOK")

            # print("Sending untagged packet on port %d" % hostif_dev_port)
            # send_packet(self, hostif_dev_port, pkt)

            # print("Verifying if packet on port host interface is tagged")
            # self.assertTrue(socket_verify_packet(exp_pkt2, hif_socket))
            print("\tOK")

        finally:
            sai_thrift_remove_hostif(self.client, hostif)
            # sai_thrift_remove_hostif_trap(self.client, self.lldp_trap)


class HostifTrapActionTest(SaiHelper):
    '''
    Tests packets handling for different kinds of trap actions
    '''
    def setUp(self):
        super(HostifTrapActionTest, self).setUp()

        vid = 100
        self.iport = self.port24
        self.iport_dev = self.dev_port24
        self.eport = self.port25
        self.eport_dev = self.dev_port25

        # create VLAN with 2 members
        self.vlan100 = sai_thrift_create_vlan(self.client, vlan_id=vid)

        self.iport_bp = sai_thrift_create_bridge_port(
            self.client,
            bridge_id=self.default_1q_bridge,
            port_id=self.iport,
            type=SAI_BRIDGE_PORT_TYPE_PORT,
            admin_state=True)
        self.eport_bp = sai_thrift_create_bridge_port(
            self.client,
            bridge_id=self.default_1q_bridge,
            port_id=self.eport,
            type=SAI_BRIDGE_PORT_TYPE_PORT,
            admin_state=True)

        self.vlan100_member0 = sai_thrift_create_vlan_member(
            self.client,
            vlan_id=self.vlan100,
            bridge_port_id=self.iport_bp,
            vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)
        self.vlan100_member1 = sai_thrift_create_vlan_member(
            self.client,
            vlan_id=self.vlan100,
            bridge_port_id=self.eport_bp,
            vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)

        sai_thrift_set_port_attribute(self.client,
                                      self.iport,
                                      port_vlan_id=vid)
        sai_thrift_set_port_attribute(self.client,
                                      self.eport,
                                      port_vlan_id=vid)

        lldp_mac = "01:80:c2:00:00:0e"
        self.lldp_pkt = simple_eth_packet(eth_dst=lldp_mac,
                                          pktlen=100,
                                          eth_type=0x88cc)

        self.cpu_queue_state = sai_thrift_get_queue_stats(
            self.client, self.cpu_queue0)["SAI_QUEUE_STAT_PACKETS"]

    def runTest(self):
        try:
            self.dropTrapActionTest()
            self.forwardTrapActionTest()
            self.copyTrapActionTest()
            self.trapTrapActionTest()
            self.logTrapActionTest()
            # self.denyTrapActionTest()
            # self.transitTrapActionTest()
            self.hostifPriorityTest()
        finally:
            pass

    def tearDown(self):
        sai_thrift_flush_fdb_entries(self.client,
                                     entry_type=SAI_FDB_FLUSH_ENTRY_TYPE_ALL)
        sai_thrift_remove_vlan_member(self.client, self.vlan100_member0)
        sai_thrift_remove_vlan_member(self.client, self.vlan100_member1)
        sai_thrift_set_port_attribute(self.client, self.iport, port_vlan_id=0)
        sai_thrift_set_port_attribute(self.client, self.eport, port_vlan_id=0)
        sai_thrift_remove_bridge_port(self.client, self.iport_bp)
        sai_thrift_remove_bridge_port(self.client, self.eport_bp)
        sai_thrift_remove_vlan(self.client, self.vlan100)

        super(HostifTrapActionTest, self).tearDown()

    def dropTrapActionTest(self):
        '''
        This verifies drop trap action
        [Drop Packet in data plane]
        '''
        print("\ndropTrapActionTest()")

        try:
            drop_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_DROP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(drop_trap != 0)

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is dropped")
            verify_no_other_packets(self)
            print("\tOK")

        finally:
            sai_thrift_remove_hostif_trap(self.client, drop_trap)

    def forwardTrapActionTest(self):
        '''
        This verifies forward trap action
        [Forward Packet in data plane]
        '''
        print("\nforwardTrapActionTest()")

        try:
            forward_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_FORWARD,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(forward_trap != 0)

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is forwarded to port %d"
                  % self.eport_dev)
            verify_packet(self, self.lldp_pkt, self.eport_dev)
            verify_no_other_packets(self)
            print("\tOK")

        finally:
            sai_thrift_remove_hostif_trap(self.client, forward_trap)

    def copyTrapActionTest(self):
        '''
        This verifies copy trap action
        [Copy Packet to CPU without interfering the original packet action in
        the pipeline]
        '''
        print("\ncopyTrapActionTest()")

        try:
            copy_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_COPY,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(copy_trap != 0)

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is forwarded to port %d and "
                  "copied to CPU" % self.eport_dev)
            verify_packet(self, self.lldp_pkt, self.eport_dev)

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, copy_trap)

    def trapTrapActionTest(self):
        '''
        This verifies trap trap action
        [This is a combination of SAI packet action COPY and DROP:
        A copy of the original packet is sent to CPU port, the original
        packet is forcefully dropped from the pipeline]
        '''
        print("\ntrapTrapActionTest()")

        try:
            trap_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(trap_trap != 0)

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is trapped by "
                  "checkig CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, trap_trap)

    def logTrapActionTest(self):
        '''
        This verifies log trap action.
        [A copy of the original packet is sent to CPU port, the original
        packet, if it was to be dropped in the original pipeline,
        change the pipeline action to forward (cancel drop)]
        '''
        print("\nlogTrapActionTest()")

        try:
            log_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_LOG,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(log_trap != 0)

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is forwarded to port %d and "
                  "copied to CPU" % self.eport_dev)
            verify_packet(self, self.lldp_pkt, self.eport_dev)

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, log_trap)

    # disabled - trap action DENY not yet implemented
    def denyTrapActionTest(self):
        '''
        This verifies deny trap action
        [This is a combination of SAI packet action COPY_CANCEL and DROP]
        '''
        print("\ndenyTrapActionTest()")

        try:
            deny_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_DENY,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(deny_trap != 0)

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is denied")
            verify_no_other_packets(self)
            print("\tOK")

        finally:
            sai_thrift_remove_hostif_trap(self.client, deny_trap)

    # disabled - trap action TRANSIT not yet implemented
    def transitTrapActionTest(self):
        '''
        This verifies transit trap action
        [This is a combination of SAI packet action COPY_CANCEL and FORWARD]
        '''
        print("\ntransitTrapActionTest()")

        try:
            transit_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_FORWARD,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(transit_trap != 0)

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is forwarded to port %d"
                  % self.eport_dev)
            verify_packet(self, self.lldp_pkt, self.eport_dev)
            verify_no_other_packets(self)
            print("\tOK")

        finally:
            sai_thrift_remove_hostif_trap(self.client, transit_trap)

    def hostifPriorityTest(self):
        '''
        This verifies if packets are handled using hostif trap with higher
        prioriy set
        '''
        print("\nhostifPriorityTest()")

        try:
            print("Create trap with drop action")
            drop_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_DROP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP,
                trap_priority=1)
            self.assertTrue(drop_trap != 0)

            print("Create higher priority trap with forward action")
            forward_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_FORWARD,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP,
                trap_priority=5)
            self.assertTrue(forward_trap != 0)
            self.dataplane.flush()

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is forwarded to port %d"
                  % self.eport_dev)
            verify_packet(self, self.lldp_pkt, self.eport_dev)
            verify_no_other_packets(self)
            print("\tOK")

            print("Changing drop trap priority")
            sai_thrift_set_hostif_trap_attribute(self.client,
                                                 drop_trap,
                                                 trap_priority=10)

            print("Sending LLDP packet on port %d" % self.iport_dev)
            send_packet(self, self.iport_dev, self.lldp_pkt)
            print("Verifying LLDP packet is dropped")
            verify_no_other_packets(self)
            print("\tOK")
        finally:
            sai_thrift_remove_hostif_trap(self.client, forward_trap)
            sai_thrift_remove_hostif_trap(self.client, drop_trap)


@disabled
class HostifTxTest(SaiHelper):
    '''
    Tests hostif TX
    '''
    def runTest(self):
        try:
            self.arpRxTxTest()
            self.portHostifTxTest()
            self.lagHostifTxTest()
        finally:
            pass

    def arpRxTxTest(self):
        '''
        This verifies host interface rx/tx path with ARP packet
        '''
        print("\narpRxTxTest()")

        test_port = self.port24
        test_dev_port = self.dev_port24
        hostif_name = "rif_hostif"

        rif_mac = "00:11:22:33:44:55"
        src_mac = "00:06:07:08:09:0a"
        rif_ip = "10.10.0.10"
        src_ip = "10.10.0.1"

        arp_req_pkt = simple_arp_packet(arp_op=1,
                                        pktlen=100,
                                        eth_src=src_mac,
                                        hw_snd=src_mac,
                                        ip_snd=src_ip,
                                        ip_tgt=rif_ip)

        arp_resp_pkt = simple_arp_packet(arp_op=2,
                                         pktlen=42,
                                         eth_src=rif_mac,
                                         eth_dst=src_mac,
                                         hw_snd=rif_mac,
                                         hw_tgt=src_mac,
                                         ip_snd=rif_ip,
                                         ip_tgt=src_ip)

        try:
            rif = sai_thrift_create_router_interface(
                self.client,
                type=SAI_ROUTER_INTERFACE_TYPE_PORT,
                virtual_router_id=self.default_vrf,
                port_id=test_port,
                src_mac_address=rif_mac)
            self.assertTrue(rif != 0)

            arp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_ARP_REQUEST)
            self.assertTrue(arp_trap != 0)

            hostif = sai_thrift_create_hostif(self.client,
                                              name=hostif_name,
                                              obj_id=rif,
                                              type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(hostif != 0)

            hif_socket = open_packet_socket(hostif_name)

            # set host interface IP address
            os.system("ifconfig %s %s/24" % (hostif_name, rif_ip))
            os.system("ifconfig %s hw ether %s" % (hostif_name, rif_mac))
            os.system("sudo ifconfig %s up" % hostif_name)
            hostif_ip = os.popen("ifconfig %s | grep 'inet addr' | "
                                 "cut -d: -f2 | awk '{print $1}'"
                                 % hostif_name).read()

            self.assertEqual(hostif_ip.rstrip(), rif_ip)

            pre_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)

            print("Sending ARP request on port %d" % test_dev_port)
            send_packet(self, test_dev_port, arp_req_pkt)

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                pre_stats["SAI_QUEUE_STAT_PACKETS"] + 1)

            self.assertTrue(socket_verify_packet(arp_req_pkt, hif_socket))
            print("\tOK")

            print("Verifying ARP response")
            verify_packet(self, arp_resp_pkt, test_dev_port)
            print("\tOK")

        finally:
            self.dataplane.flush()
            sai_thrift_remove_hostif(self.client, hostif)
            sai_thrift_remove_hostif_trap(self.client, arp_trap)
            sai_thrift_remove_router_interface(self.client, rif)

    def portHostifTxTest(self):
        '''
        This verifies port host interface tx
        '''
        print("\nportHostifTxTest()")

        test_port = self.port24
        test_dev_port = self.dev_port24
        hostif_name = "hostif"

        test_ip = "10.10.10.1"

        pkt = simple_udp_packet(ip_dst=test_ip)

        try:
            hostif = sai_thrift_create_hostif(self.client,
                                              name=hostif_name,
                                              obj_id=test_port,
                                              type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(hostif != 0)

            hif_socket = open_packet_socket(hostif_name)

            print("Sending packet via port hostif")
            hif_socket.send(bytes(pkt))
            print("\tOK")

            print("Verifying packet on port")
            verify_packet(self, pkt, test_dev_port)
            print("\tOK")

        finally:
            sai_thrift_remove_hostif(self.client, hostif)

    def lagHostifTxTest(self):
        '''
        This verifies LAG host interface tx
        '''
        print("\nlagHostifTxTest()")

        lag_ports = [self.port24, self.port25]
        lag_dev_ports = [self.dev_port24, self.dev_port25]
        lag_hostif_name = "lag_hostif"

        test_ip = "10.10.10.1"

        pkt = simple_udp_packet(ip_dst=test_ip)

        try:
            lag10 = sai_thrift_create_lag(self.client)

            lag10_member1 = sai_thrift_create_lag_member(self.client,
                                                         lag_id=lag10,
                                                         port_id=lag_ports[0])
            lag10_member2 = sai_thrift_create_lag_member(self.client,
                                                         lag_id=lag10,
                                                         port_id=lag_ports[1])

            lag_hostif = sai_thrift_create_hostif(self.client,
                                                  name=lag_hostif_name,
                                                  obj_id=lag10,
                                                  type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(lag_hostif != 0)

            lag_hif_socket = open_packet_socket(lag_hostif_name)

            print("Sending packet via LAG hostif")
            lag_hif_socket.send(bytes(pkt))
            print("\tOK")

            print("Verifying packet on LAG port")
            verify_packet_any_port(self, pkt, lag_dev_ports)
            print("\tOK")

            print("Removing one lag member")
            lag10_member1 = sai_thrift_remove_lag_member(self.client,
                                                         lag10_member1)

            print("Sending packet via LAG hostif")
            lag_hif_socket.send(bytes(pkt))
            print("\tOK")

            print("Verifying packet on port")
            verify_packet(self, pkt, lag_dev_ports[1])
            print("\tOK")

            print("Removing last lag member")
            lag10_member2 = sai_thrift_remove_lag_member(self.client,
                                                         lag10_member2)

            print("Sending packet via LAG hostif")
            lag_hif_socket.send(bytes(pkt))
            print("\tOK")

            print("Verifying no packets on LAG ports")
            verify_no_packet_any(self, pkt, lag_dev_ports)
            print("\tOK")

        finally:
            sai_thrift_remove_hostif(self.client, lag_hostif)

            if lag10_member1:
                sai_thrift_remove_lag_member(self.client, lag10_member1)
            if lag10_member2:
                sai_thrift_remove_lag_member(self.client, lag10_member2)

            sai_thrift_remove_lag(self.client, lag10)


class HostifTableMatchTest(SaiHelper):
    '''
    Tests hostif interface table match for entry type Wildcard
    and channel type = CB
    '''
    def setUp(self):
        super(HostifTableMatchTest, self).setUp()

        self.vid = 100
        self.iport = self.port24
        self.iport_dev = self.dev_port24
        self.eport = self.port25
        self.eport_dev = self.dev_port25

        # create VLAN with 2 members
        self.vlan100 = sai_thrift_create_vlan(self.client, vlan_id=self.vid)

        self.iport_bp = sai_thrift_create_bridge_port(
            self.client,
            bridge_id=self.default_1q_bridge,
            port_id=self.iport,
            type=SAI_BRIDGE_PORT_TYPE_PORT,
            admin_state=True)
        self.eport_bp = sai_thrift_create_bridge_port(
            self.client,
            bridge_id=self.default_1q_bridge,
            port_id=self.eport,
            type=SAI_BRIDGE_PORT_TYPE_PORT,
            admin_state=True)

        self.vlan100_member0 = sai_thrift_create_vlan_member(
            self.client,
            vlan_id=self.vlan100,
            bridge_port_id=self.iport_bp,
            vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)
        self.vlan100_member1 = sai_thrift_create_vlan_member(
            self.client,
            vlan_id=self.vlan100,
            bridge_port_id=self.eport_bp,
            vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)

        sai_thrift_set_port_attribute(self.client, self.iport,
                                      port_vlan_id=self.vid)
        sai_thrift_set_port_attribute(self.client, self.eport,
                                      port_vlan_id=self.vid)

        self.cpu_queue_state = sai_thrift_get_queue_stats(
            self.client, self.cpu_queue0)["SAI_QUEUE_STAT_PACKETS"]

    def runTest(self):
        try:
            self.wildcardEntryCbChannelLldp()
            self.wildcardEntryCbChannelLacp()
            self.wildcardEntryCbChannelStp()
        finally:
            pass

    def tearDown(self):
        sai_thrift_flush_fdb_entries(self.client,
                                     entry_type=SAI_FDB_FLUSH_ENTRY_TYPE_ALL)
        sai_thrift_remove_vlan_member(self.client, self.vlan100_member0)
        sai_thrift_remove_vlan_member(self.client, self.vlan100_member1)
        sai_thrift_set_port_attribute(self.client, self.iport, port_vlan_id=0)
        sai_thrift_set_port_attribute(self.client, self.eport, port_vlan_id=0)
        sai_thrift_remove_bridge_port(self.client, self.iport_bp)
        sai_thrift_remove_bridge_port(self.client, self.eport_bp)
        sai_thrift_remove_vlan(self.client, self.vlan100)

        super(HostifTableMatchTest, self).tearDown()

    def wildcardEntryCbChannelLldp(self):
        '''
        This tests hostif interface table match for entry type Wildcard and
        channel type = CB with LLDP packet
        '''
        print("\nwildcardEntryCbChannelLldp()")

        hostif_port = self.iport
        hostif_dev_port = self.iport_dev
        hostif_name = "hostif"

        lldp_mac = "01:80:c2:00:00:0e"
        lldp_pkt = simple_eth_packet(eth_dst=lldp_mac,
                                     pktlen=100,
                                     eth_type=0x88cc)

        try:
            hostif = sai_thrift_create_hostif(self.client,
                                              name=hostif_name,
                                              obj_id=hostif_port,
                                              type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(hostif != 0)

            hif_socket = open_packet_socket(hostif_name)

            lldp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_COPY,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(lldp_trap != 0)

            hif_tbl_entry = sai_thrift_create_hostif_table_entry(
                self.client,
                channel_type=SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_CB,
                type=SAI_HOSTIF_TABLE_ENTRY_TYPE_WILDCARD)
            self.assertTrue(hif_tbl_entry != 0)

            print("Sending LLDP packet on port %d" % hostif_dev_port)
            send_packet(self, hostif_dev_port, lldp_pkt)
            print("Verifying LLDP packet on VLAN port")
            verify_packet(self, lldp_pkt, self.eport_dev)
            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

            print("Verifying LLDP packet on port host interface")
            self.assertTrue(socket_verify_packet(lldp_pkt, hif_socket))
            print("\tOK")

        finally:
            sai_thrift_remove_hostif_table_entry(self.client, hif_tbl_entry)
            sai_thrift_remove_hostif_trap(self.client, lldp_trap)
            sai_thrift_remove_hostif(self.client, hostif)

    def wildcardEntryCbChannelLacp(self):
        '''
        This tests hostif interface table match for entry type Wildcard and
        channel type = CB with LACP packet
        '''
        print("\nwildcardEntryCbChannelLacp()")

        lag_ports = [self.iport, self.eport]
        lag_dev_ports = [self.iport_dev, self.eport_dev]
        lag_hostif_name = "lag_hostif"

        lacp_mac = "01:80:c2:00:00:02"
        lacp_pkt = simple_eth_packet(eth_dst=lacp_mac,
                                     pktlen=100,
                                     eth_type=0x8809)/(chr(0x01) + (chr(0x01)))

        try:
            lag10 = sai_thrift_create_lag(self.client)

            lag_hostif = sai_thrift_create_hostif(self.client,
                                                  name=lag_hostif_name,
                                                  obj_id=lag10,
                                                  type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(lag_hostif != 0)

            lag_hif_socket = open_packet_socket(lag_hostif_name)

            lacp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_COPY,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LACP)
            self.assertTrue(lacp_trap != 0)

            hif_tbl_entry = sai_thrift_create_hostif_table_entry(
                self.client,
                channel_type=SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_CB,
                type=SAI_HOSTIF_TABLE_ENTRY_TYPE_WILDCARD)
            self.assertTrue(hif_tbl_entry != 0)

            # create LAG members
            lag10_member1 = sai_thrift_create_lag_member(self.client,
                                                         lag_id=lag10,
                                                         port_id=lag_ports[0])
            lag10_member2 = sai_thrift_create_lag_member(self.client,
                                                         lag_id=lag10,
                                                         port_id=lag_ports[1])

            for dev_port in lag_dev_ports:
                print("Sending LACP packet on port %d (in LAG)" % dev_port)
                send_packet(self, dev_port, lacp_pkt)

                print("Verifying LACP packet on LAG host interface")
                self.assertTrue(socket_verify_packet(lacp_pkt, lag_hif_socket))
                print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + len(lag_dev_ports))
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_lag_member(self.client, lag10_member1)
            sai_thrift_remove_lag_member(self.client, lag10_member2)
            sai_thrift_remove_hostif_table_entry(self.client, hif_tbl_entry)
            sai_thrift_remove_hostif_trap(self.client, lacp_trap)
            sai_thrift_remove_hostif(self.client, lag_hostif)
            sai_thrift_remove_lag(self.client, lag10)

    def wildcardEntryCbChannelStp(self):
        '''
        This tests hostif interface table match for entry type Wildcard and
        channel type = CB with STP packet
        '''
        print("\nwildcardEntryCbChannelStp()")

        vlan_ports = [self.iport, self.eport]
        vlan_dev_ports = [self.iport_dev, self.eport_dev]
        vlan_hostif_name = "vlan_hostif"

        stp_mac = "01:80:C2:00:00:00"
        stp_pkt = simple_eth_raw_packet_with_taglist(
            pktlen=100,
            eth_dst=stp_mac)
        stp_pkt[Ether].type = 0x88cc
        tag_stp_pkt = simple_eth_raw_packet_with_taglist(
            pktlen=104,
            eth_dst=stp_mac,
            dl_taglist_enable=True,
            dl_vlanid_list=[self.vid])
        tag_stp_pkt[Dot1Q].type = 0x88cc

        try:
            vlan_hostif = sai_thrift_create_hostif(self.client,
                                                   name=vlan_hostif_name,
                                                   obj_id=self.vlan100,
                                                   type=SAI_HOSTIF_TYPE_NETDEV)
            self.assertTrue(vlan_hostif != 0)

            vlan_hif_socket = open_packet_socket(vlan_hostif_name)

            stp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_COPY,
                trap_type=SAI_HOSTIF_TRAP_TYPE_STP)
            self.assertTrue(stp_trap != 0)

            hif_tbl_entry = sai_thrift_create_hostif_table_entry(
                self.client,
                channel_type=SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_CB,
                type=SAI_HOSTIF_TABLE_ENTRY_TYPE_WILDCARD)
            self.assertTrue(hif_tbl_entry != 0)

            # change tagging mode for one of test ports
            sai_thrift_remove_vlan_member(self.client, self.vlan100_member1)
            sai_thrift_set_port_attribute(self.client, vlan_ports[1],
                                          port_vlan_id=0)
            self.vlan100_member1 = sai_thrift_create_vlan_member(
                self.client,
                vlan_id=self.vlan100,
                bridge_port_id=self.eport_bp,
                vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_TAGGED)
            sai_thrift_set_port_attribute(self.client,
                                          vlan_ports[1],
                                          port_vlan_id=self.vid)

            print("Sending STP packet on port %d (untagged VLAN member)"
                  % vlan_dev_ports[0])
            send_packet(self, vlan_dev_ports[0], stp_pkt)

            print("Verifying STP packet on tagged VLAN member")
            verify_packet(self, tag_stp_pkt, vlan_dev_ports[1])
            print("\tOK")

            print("Verifying STP packet on VLAN host interface")
            self.assertTrue(socket_verify_packet(stp_pkt, vlan_hif_socket))
            print("\tOK")

            print("Sending STP packet on port %d (tagged VLAN member)"
                  % vlan_dev_ports[1])
            send_packet(self, vlan_dev_ports[1], tag_stp_pkt)

            print("Verifying STP packet on untagged VLAN member")
            verify_packet(self, stp_pkt, vlan_dev_ports[0])
            print("\tOK")

            print("Verifying STP packet on VLAN host interface")
            self.assertTrue(socket_verify_packet(stp_pkt, vlan_hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 2)
            print("\tOK")

        finally:
            # revert tagging mode for changed test port
            sai_thrift_remove_vlan_member(self.client, self.vlan100_member1)
            self.vlan100_member1 = sai_thrift_create_vlan_member(
                self.client,
                vlan_id=self.vlan100,
                bridge_port_id=self.eport_bp,
                vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)
            sai_thrift_set_port_attribute(self.client, vlan_ports[1],
                                          port_vlan_id=self.vid)
            sai_thrift_remove_hostif_table_entry(self.client, hif_tbl_entry)
            sai_thrift_remove_hostif_trap(self.client, stp_trap)
            sai_thrift_remove_hostif(self.client, vlan_hostif)


class HostifTrapTypesTest(SaiHelper):
    '''
    This verifies creation of different types of hostif traps
    If action is TRAP - only iport is in use, if action is COPY
    packet is send on iport and should be forwarded to eport
    '''
    def setUp(self):
        super(HostifTrapTypesTest, self).setUp()

        vid = 100
        self.iport = self.port24
        self.iport_dev = self.dev_port24
        self.iport2 = self.port26
        self.iport_dev2 = self.dev_port26
        self.eport = self.port25
        self.eport_dev = self.dev_port25

        hostif_name = "hostif"

        self.hostif = sai_thrift_create_hostif(self.client,
                                               name=hostif_name,
                                               obj_id=self.iport,
                                               type=SAI_HOSTIF_TYPE_NETDEV)
        self.assertTrue(self.hostif != 0)

        self.hif_socket = open_packet_socket(hostif_name)

        hostif_name2 = "hostif2"

        self.hostif2 = sai_thrift_create_hostif(self.client,
                                                name=hostif_name2,
                                                obj_id=self.iport2,
                                                type=SAI_HOSTIF_TYPE_NETDEV)
        self.assertTrue(self.hostif2 != 0)

        self.hif_socket2 = open_packet_socket(hostif_name2)

        # create VLAN with 2 members
        self.vlan100 = sai_thrift_create_vlan(self.client, vlan_id=vid)

        self.iport_bp = sai_thrift_create_bridge_port(
            self.client,
            bridge_id=self.default_1q_bridge,
            port_id=self.iport,
            type=SAI_BRIDGE_PORT_TYPE_PORT,
            admin_state=True)
        self.iport_bp2 = sai_thrift_create_bridge_port(
            self.client,
            bridge_id=self.default_1q_bridge,
            port_id=self.iport2,
            type=SAI_BRIDGE_PORT_TYPE_PORT,
            admin_state=True)
        self.eport_bp = sai_thrift_create_bridge_port(
            self.client,
            bridge_id=self.default_1q_bridge,
            port_id=self.eport,
            type=SAI_BRIDGE_PORT_TYPE_PORT,
            admin_state=True)

        self.vlan100_member0 = sai_thrift_create_vlan_member(
            self.client,
            vlan_id=self.vlan100,
            bridge_port_id=self.iport_bp,
            vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)
        self.vlan100_member1 = sai_thrift_create_vlan_member(
            self.client,
            vlan_id=self.vlan100,
            bridge_port_id=self.eport_bp,
            vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)
        self.vlan100_member2 = sai_thrift_create_vlan_member(
            self.client,
            vlan_id=self.vlan100,
            bridge_port_id=self.iport_bp2,
            vlan_tagging_mode=SAI_VLAN_TAGGING_MODE_UNTAGGED)

        sai_thrift_set_port_attribute(self.client, self.iport,
                                      port_vlan_id=vid)
        sai_thrift_set_port_attribute(self.client, self.iport2,
                                      port_vlan_id=vid)
        sai_thrift_set_port_attribute(self.client, self.eport,
                                      port_vlan_id=vid)

        # create L3 interfaces
        self.iport_rif = sai_thrift_create_router_interface(
            self.client,
            type=SAI_ROUTER_INTERFACE_TYPE_PORT,
            virtual_router_id=self.default_vrf,
            port_id=self.iport)
        self.eport_rif = sai_thrift_create_router_interface(
            self.client,
            type=SAI_ROUTER_INTERFACE_TYPE_PORT,
            virtual_router_id=self.default_vrf,
            port_id=self.eport)

        self.iport_ip = "10.10.10.1"
        self.iport_ipv6 = "2001:0db8::1:1"
        self.iport_mac = "00:11:11:11:11:11"
        self.eport_ip = "20.20.20.1"
        self.eport_ipv6 = "2001:0db8::2:2"
        self.eport_mac = "00:22:22:22:22:22"

        self.my_ip = "30.30.30.1"
        self.my_ipv6 = "2001:0db8::3:3"

        self.iport_nexthop = sai_thrift_create_next_hop(
            self.client,
            ip=sai_ipaddress(self.iport_ip),
            router_interface_id=self.iport_rif,
            type=SAI_NEXT_HOP_TYPE_IP)
        self.iport_neighbor_entry = sai_thrift_neighbor_entry_t(
            rif_id=self.iport_rif, ip_address=sai_ipaddress(self.iport_ip))
        self.iport_neighbor = sai_thrift_create_neighbor_entry(
            self.client,
            self.iport_neighbor_entry,
            dst_mac_address=self.iport_mac)
        self.iport_route = sai_thrift_route_entry_t(
            vr_id=self.default_vrf,
            destination=sai_ipprefix(self.iport_ip + '/32'))
        sai_thrift_create_route_entry(self.client, self.iport_route,
                                      next_hop_id=self.iport_nexthop)
        self.iport_v6_route = sai_thrift_route_entry_t(
            vr_id=self.default_vrf,
            destination=sai_ipprefix(self.iport_ipv6 + '/128'))
        sai_thrift_create_route_entry(self.client, self.iport_v6_route,
                                      next_hop_id=self.iport_nexthop)

        self.eport_nexthop = sai_thrift_create_next_hop(
            self.client,
            ip=sai_ipaddress(self.eport_ip),
            router_interface_id=self.eport_rif,
            type=SAI_NEXT_HOP_TYPE_IP)
        self.eport_neighbor_entry = sai_thrift_neighbor_entry_t(
            rif_id=self.eport_rif, ip_address=sai_ipaddress(self.eport_ip))
        self.eport_neighbor = sai_thrift_create_neighbor_entry(
            self.client,
            self.eport_neighbor_entry,
            dst_mac_address=self.eport_mac)
        self.eport_route = sai_thrift_route_entry_t(
            vr_id=self.default_vrf,
            destination=sai_ipprefix(self.eport_ip + '/32'))
        sai_thrift_create_route_entry(self.client, self.eport_route,
                                      next_hop_id=self.eport_nexthop)
        self.eport_v6_route = sai_thrift_route_entry_t(
            vr_id=self.default_vrf,
            destination=sai_ipprefix(self.eport_ipv6 + '/128'))
        sai_thrift_create_route_entry(self.client, self.eport_v6_route,
                                      next_hop_id=self.eport_nexthop)

        # Ip2me route
        sw_attr = sai_thrift_get_switch_attribute(self.client,
                                                  cpu_port=True)
        cpu_port = sw_attr['cpu_port']

        self.ip2me_route = sai_thrift_route_entry_t(
            vr_id=self.default_vrf,
            destination=sai_ipprefix(self.my_ip + '/32'))
        sai_thrift_create_route_entry(self.client, self.ip2me_route,
                                      next_hop_id=cpu_port)
        self.ip2me_v6_route = sai_thrift_route_entry_t(
            vr_id=self.default_vrf,
            destination=sai_ipprefix(self.my_ipv6 + '/128'))
        sai_thrift_create_route_entry(self.client, self.ip2me_v6_route,
                                      next_hop_id=cpu_port)

        self.cpu_queue_state = sai_thrift_get_queue_stats(
            self.client, self.cpu_queue0)["SAI_QUEUE_STAT_PACKETS"]

    def runTest(self):
        try:
            self.arpTrapTest()
            self.ttlErrorTrapTest()
            self.bgpTrapTest()
            self.dhcpTrapTest()
            self.ip2meTrapTest()
            self.lldpTrapTest()
            self.ospfTrapTest()
            # self.igmpTrapTest()  # disabled while multicast is disabled
            self.stpTrapTest()
            self.pimTrapTest()
            self.udldTrapTest()
            self.icmpV6TrapTest()
            self.bfdRxTrapTest()
            self.dhcpv6TrapTest()
            self.ptpTrapTest()
        finally:
            pass

    def tearDown(self):
        sai_thrift_flush_fdb_entries(self.client,
                                     entry_type=SAI_FDB_FLUSH_ENTRY_TYPE_ALL)
        sai_thrift_remove_route_entry(self.client, self.ip2me_route)
        sai_thrift_remove_route_entry(self.client, self.ip2me_v6_route)
        sai_thrift_remove_route_entry(self.client, self.eport_route)
        sai_thrift_remove_route_entry(self.client, self.eport_v6_route)
        sai_thrift_remove_next_hop(self.client, self.eport_nexthop)
        sai_thrift_remove_neighbor_entry(self.client,
                                         self.eport_neighbor_entry)
        sai_thrift_remove_route_entry(self.client, self.iport_route)
        sai_thrift_remove_route_entry(self.client, self.iport_v6_route)
        sai_thrift_remove_next_hop(self.client, self.iport_nexthop)
        sai_thrift_remove_neighbor_entry(self.client,
                                         self.iport_neighbor_entry)
        sai_thrift_remove_router_interface(self.client, self.iport_rif)
        sai_thrift_remove_router_interface(self.client, self.eport_rif)
        sai_thrift_remove_vlan_member(self.client, self.vlan100_member0)
        sai_thrift_remove_vlan_member(self.client, self.vlan100_member1)
        sai_thrift_remove_vlan_member(self.client, self.vlan100_member2)
        sai_thrift_set_port_attribute(self.client, self.iport, port_vlan_id=0)
        sai_thrift_set_port_attribute(self.client, self.iport2, port_vlan_id=0)
        sai_thrift_set_port_attribute(self.client, self.eport, port_vlan_id=0)
        sai_thrift_remove_bridge_port(self.client, self.iport_bp)
        sai_thrift_remove_bridge_port(self.client, self.iport_bp2)
        sai_thrift_remove_bridge_port(self.client, self.eport_bp)
        sai_thrift_remove_vlan(self.client, self.vlan100)
        sai_thrift_remove_hostif(self.client, self.hostif)
        sai_thrift_remove_hostif(self.client, self.hostif2)

        super(HostifTrapTypesTest, self).tearDown()

    def arpTrapTest(self):
        '''
        This verifies trap of type ARP
        '''
        print("\narpTrapTest()")

        try:
            arp_req_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_ARP_REQUEST)
            self.assertTrue(arp_req_trap != 0)
            arp_resp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_ARP_RESPONSE)
            self.assertTrue(arp_resp_trap != 0)

            # Broadcast ARP Request
            arp_pkt = simple_arp_packet(arp_op=1, pktlen=100)

            print("Sending broadcast ARP request")
            send_packet(self, self.iport_dev, arp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(arp_pkt, self.hif_socket))
            print("\tOK")
            self.dataplane.flush()

            # Unicast ARP Request
            arp_pkt = simple_arp_packet(arp_op=1,
                                        eth_dst=ROUTER_MAC,
                                        pktlen=100)

            print('Sending unicast ARP request to router MAC')
            send_packet(self, self.iport_dev, arp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(arp_pkt, self.hif_socket))
            print("\tOK")

            # Unicast ARP Request to other MAC address
            arp_pkt = simple_arp_packet(arp_op=1,
                                        eth_dst="00:AA:BB:CC:DD:EE",
                                        pktlen=100)

            print('Sending unicast ARP request to other MAC')
            send_packet(self, self.iport_dev, arp_pkt)
            verify_no_other_packets(self)
            self.assertFalse(socket_verify_packet(arp_pkt, self.hif_socket))
            print("\tOK")

            # Broadcast ARP Response
            arp_pkt = simple_arp_packet(arp_op=2, pktlen=100)

            print("Sending broadcast ARP response")
            send_packet(self, self.iport_dev, arp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(arp_pkt, self.hif_socket))
            print("\tOK")

            # Unicast ARP Response
            arp_pkt = simple_arp_packet(arp_op=2,
                                        eth_dst=ROUTER_MAC,
                                        pktlen=100)

            print('Sending unicast ARP response to router MAC')
            send_packet(self, self.iport_dev, arp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(arp_pkt, self.hif_socket))
            print("\tOK")

            # Unicast ARP Response to other MAC address
            arp_pkt = simple_arp_packet(arp_op=2,
                                        eth_dst="00:AA:BB:CC:DD:EE",
                                        pktlen=100)

            print('Sending unicast ARP response to other MAC')
            send_packet(self, self.iport_dev, arp_pkt)
            verify_no_other_packets(self)
            self.assertFalse(socket_verify_packet(arp_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 4)
            print("OK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, arp_req_trap)
            sai_thrift_remove_hostif_trap(self.client, arp_resp_trap)

    def ttlErrorTrapTest(self):
        '''
        This verifies trap of type TTL
        '''
        print("\nttlErrorTrapTest()")

        try:
            ttl_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_DROP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_TTL_ERROR)
            self.assertTrue(ttl_trap != 0)

            pkt = simple_udp_packet(eth_dst=ROUTER_MAC,
                                    ip_dst=self.eport_ip,
                                    ip_ttl=64)
            exp_pkt = simple_udp_packet(eth_src=ROUTER_MAC,
                                        eth_dst=self.eport_mac,
                                        ip_dst=self.eport_ip,
                                        ip_ttl=63)

            print("Sending packet with TTL 64 - routed")
            send_packet(self, self.iport_dev, pkt)
            verify_packets(self, exp_pkt, [self.eport_dev])
            print("\tOK")

            pkt = simple_udp_packet(eth_dst=ROUTER_MAC,
                                    ip_dst=self.eport_ip,
                                    ip_ttl=0)

            print("Sending packet with TTL 0 - dropped")
            send_packet(self, self.iport_dev, pkt)
            verify_no_other_packets(self)
            print("\tOK")

            pkt = simple_udp_packet(eth_dst=ROUTER_MAC,
                                    ip_dst=self.eport_ip,
                                    ip_ttl=1)

            print("Sending packet with TTL 1 - routed and dropped")
            send_packet(self, self.iport_dev, pkt)
            verify_no_other_packets(self)
            print("\tOK")

        finally:
            sai_thrift_remove_hostif_trap(self.client, ttl_trap)

    def bgpTrapTest(self):
        '''
        This verifies trap of type BGP
        '''
        print("\nbgpTrapTest()")

        bgp_port = 179

        try:
            bgp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_BGP)
            self.assertTrue(bgp_trap != 0)
            bgpv6_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_BGPV6)
            self.assertTrue(bgpv6_trap != 0)

            # BGP v4 - dst BGP port
            bgp_pkt = simple_tcp_packet(eth_dst=ROUTER_MAC,
                                        ip_dst=self.my_ip,
                                        tcp_dport=bgp_port)

            print("Sending BGP v4 packet - dst TCP port %d" % bgp_port)
            send_packet(self, self.iport_dev, bgp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(bgp_pkt, self.hif_socket))
            print("\tOK")

            # BGP v6 - dst BGP port
            bgpv6_pkt = simple_tcpv6_packet(eth_dst=ROUTER_MAC,
                                            ipv6_dst=self.my_ipv6,
                                            tcp_dport=bgp_port)

            print("Sending BGP v6 packet - dst TCP port %d" % bgp_port)
            send_packet(self, self.iport_dev, bgpv6_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(bgpv6_pkt, self.hif_socket))
            print("\tOK")

            # BGP v4 - src BGP port
            bgp_pkt = simple_tcp_packet(eth_dst=ROUTER_MAC,
                                        ip_dst=self.my_ip,
                                        tcp_sport=bgp_port)

            print("Sending BGP v4 packet - src TCP port %d" % bgp_port)
            send_packet(self, self.iport_dev, bgp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(bgp_pkt, self.hif_socket))
            print("\tOK")

            # BGP v6 - dst BGP port
            bgpv6_pkt = simple_tcpv6_packet(eth_dst=ROUTER_MAC,
                                            ipv6_dst=self.my_ipv6,
                                            tcp_sport=bgp_port)

            print("Sending BGP v6 packet - dst TCP port %d" % bgp_port)
            send_packet(self, self.iport_dev, bgpv6_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(bgpv6_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 4)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, bgp_trap)
            sai_thrift_remove_hostif_trap(self.client, bgpv6_trap)

    def dhcpTrapTest(self):
        '''
        This verifies trap of type DHCP
        '''
        print("\ndhcpTrapTest()")

        dhcp_sport = 67
        dhcp_cport = 68
        bcast_ip = "255.255.255.255"
        bcast_mac = "ff:ff:ff:ff:ff:ff"

        try:
            dhcp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_DHCP)
            self.assertTrue(dhcp_trap != 0)

            # DHCP request
            dhcp_pkt = simple_udp_packet(eth_dst=bcast_mac,
                                         ip_dst=bcast_ip,
                                         udp_sport=dhcp_sport,
                                         udp_dport=dhcp_cport)

            print("Sending DHCP request packet")
            send_packet(self, self.iport_dev, dhcp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(dhcp_pkt, self.hif_socket))
            print("\tOK")

            # DHCP ack
            dhcp_pkt = simple_udp_packet(eth_dst=ROUTER_MAC,
                                         ip_dst=self.my_ip,
                                         udp_sport=dhcp_cport,
                                         udp_dport=dhcp_sport)

            print("Sending DHCP ack packet")
            send_packet(self, self.iport_dev, dhcp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(dhcp_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 2)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, dhcp_trap)

    def ip2meTrapTest(self):
        '''
        This verifies trap of type IP2ME
        '''
        print("\nip2meTrapTest()")

        try:
            myip_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_IP2ME)
            self.assertTrue(myip_trap != 0)

            pkt = simple_udp_packet(eth_dst=ROUTER_MAC, ip_dst=self.my_ip)

            print("Sending IP2ME packet")
            send_packet(self, self.iport_dev, pkt)
            self.assertTrue(socket_verify_packet(pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, myip_trap)

    def lacpTrapTest(self):
        '''
        This verifies trap of type LACP
        '''
        print("\nlacpTrapTest()")

        lacp_mac = "01:80:C2:00:00:02"

        try:
            lacp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LACP)
            self.assertTrue(lacp_trap != 0)

            lacp_pkt = simple_eth_packet(eth_dst=lacp_mac, pktlen=100)

            print("Sending LACP packet")
            send_packet(self, self.iport_dev, lacp_pkt)
            self.assertTrue(socket_verify_packet(lacp_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, lacp_trap)

    def lldpTrapTest(self):
        '''
        This verifies trap of type LLDP
        '''
        print("\nlldpTrapTest()")

        lldp_mac1 = "01:80:C2:00:00:0e"
        lldp_mac2 = "01:80:C2:00:00:03"

        try:
            lldp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP)
            self.assertTrue(lldp_trap != 0)

            # LLDP DMAC=01:80:C2:00:00:0e
            lldp_pkt = simple_eth_packet(eth_dst=lldp_mac1,
                                         pktlen=100,
                                         eth_type=0x88cc)

            print("Sending LLDP packet with DMAC %s" % lldp_mac1)
            send_packet(self, self.iport_dev, lldp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(lldp_pkt, self.hif_socket))
            print("\tOK")

            # LLDP DMAC=01:80:C2:00:00:03
            lldp_pkt = simple_eth_packet(eth_dst=lldp_mac2,
                                         pktlen=100,
                                         eth_type=0x88cc)

            print("Sending LLDP packet with DMAC %s" % lldp_mac2)
            send_packet(self, self.iport_dev, lldp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(lldp_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 2)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, lldp_trap)

    def ospfTrapTest(self):
        '''
        This verifies trap of type OSPF
        '''
        print("\nospfTrapTest()")

        ospf_hello_ip = "224.0.0.5"
        ospf_dr_ip = "224.0.0.6"
        proto = 89

        try:
            ospf_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_COPY,
                trap_type=SAI_HOSTIF_TRAP_TYPE_OSPF)
            self.assertTrue(ospf_trap != 0)

            # OSPF Hello
            ospf_pkt = simple_ip_packet(ip_dst=ospf_hello_ip, ip_proto=proto)

            print("Sending OSPF packet destined to %s" % ospf_hello_ip)
            send_packet(self, self.iport_dev, ospf_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(ospf_pkt, self.hif_socket))
            print("\tOK")

            # OSPF Designated Routers
            ospf_pkt = simple_ip_packet(ip_dst=ospf_dr_ip, ip_proto=proto)

            print("Sending OSPF packet destined to %s" % ospf_dr_ip)
            send_packet(self, self.iport_dev, ospf_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(ospf_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 2)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, ospf_trap)

    def igmpTrapTest(self):
        '''
        This verifies trap of different IGMP types
        '''
        print("\nigmTrapTest()")

        trap_info_list = [
            [SAI_HOSTIF_TRAP_TYPE_IGMP_TYPE_QUERY,
             0x11, "Query"],
            [SAI_HOSTIF_TRAP_TYPE_IGMP_TYPE_LEAVE,
             0x17, "Leave"],
            [SAI_HOSTIF_TRAP_TYPE_IGMP_TYPE_V1_REPORT,
             0x12, "V1 Report"],
            [SAI_HOSTIF_TRAP_TYPE_IGMP_TYPE_V2_REPORT,
             0x16, "V2 Report"],
            [SAI_HOSTIF_TRAP_TYPE_IGMP_TYPE_V3_REPORT,
             0x22, "V3 Report"]
        ]

        try:
            # enable VLAN100 igmp snooping
            status = sai_thrift_set_vlan_attribute(
                self.client, self.vlan100, custom_igmp_snooping_enable=True)
            self.assertEqual(status, SAI_STATUS_SUCCESS)

            for trap_info in trap_info_list:
                try:
                    igmp_trap = sai_thrift_create_hostif_trap(
                        self.client,
                        packet_action=SAI_PACKET_ACTION_TRAP,
                        trap_type=trap_info[0])
                    self.assertTrue(igmp_trap != 0)

                    igmp_pkt = simple_igmp_packet(igmp_type=trap_info[1])

                    print("Sending IGMP {} packet".format(trap_info[2]))
                    send_packet(self, self.iport_dev2, igmp_pkt)
                    self.assertTrue(socket_verify_packet(igmp_pkt,
                                                         self.hif_socket2))
                    print("\tOK")

                finally:
                    sai_thrift_remove_hostif_trap(self.client, igmp_trap)

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + len(trap_info_list))
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_set_vlan_attribute(
                self.client, self.vlan100, custom_igmp_snooping_enable=False)

    def stpTrapTest(self):
        '''
        This verifies trap of type STP
        '''
        print("\nstpTrapTest()")

        stp_mac = "01:80:C2:00:00:00"

        try:
            stp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_STP)
            self.assertTrue(stp_trap != 0)

            stp_pkt = simple_eth_packet(eth_dst=stp_mac, pktlen=100)

            print("Sending STP packet")
            send_packet(self, self.iport_dev, stp_pkt)
            self.assertTrue(socket_verify_packet(stp_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, stp_trap)

    def pimTrapTest(self):
        '''
        This verifies trap of type PIM
        '''
        print("\npimTrapTest()")

        proto = 103

        try:
            pim_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_PIM)
            self.assertTrue(pim_trap != 0)

            pim_pkt = simple_ip_packet(ip_proto=proto)

            print("Sending PIM packet")
            send_packet(self, self.iport_dev, pim_pkt)
            self.assertTrue(socket_verify_packet(pim_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, pim_trap)

    def udldTrapTest(self):
        '''
        This verifies trap of type UDLD
        '''
        print("\nudldTrapTest()")

        udld_mac = "01:00:0C:CC:CC:CC"

        try:
            udld_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_UDLD)
            self.assertTrue(udld_trap != 0)

            udld_pkt = simple_eth_packet(eth_dst=udld_mac, pktlen=100)

            print("Sending UDLD packet")
            send_packet(self, self.iport_dev, udld_pkt)
            self.assertTrue(socket_verify_packet(udld_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, udld_trap)

    def icmpV6TrapTest(self):
        '''
        This verifies trap of type ICMPv6
        '''
        print("\nicmpV6TrapTest()")

        try:
            src_ipv6 = "2001:0db8::1111"
            dst_ipv6 = "2001:0db8::2222"

            icmpv6_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_IPV6_NEIGHBOR_DISCOVERY)
            self.assertTrue(icmpv6_trap != 0)

            # IPv6 Router Solicitation
            all_rt_ipv6 = "ff02::2"
            rs_type = 133
            icmpv6_pkt = simple_icmpv6_packet(ipv6_dst=all_rt_ipv6,
                                              ipv6_src=src_ipv6,
                                              icmp_type=rs_type)

            print("Sending IPv6 Router Solicitation packet")
            send_packet(self, self.iport_dev, icmpv6_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(icmpv6_pkt, self.hif_socket))
            print("\tOK")

            # IPv6 Router Advertisement
            all_nodes_ipv6 = "ff02::1"
            ra_type = 134
            icmpv6_pkt = simple_icmpv6_packet(ipv6_dst=all_nodes_ipv6,
                                              ipv6_src=src_ipv6,
                                              icmp_type=ra_type)

            print("Sending IPv6 Router Advertisement packet")
            send_packet(self, self.iport_dev, icmpv6_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(icmpv6_pkt, self.hif_socket))
            print("\tOK")

            # IPv6 Neighbor Solicitation
            ns_ipv6 = "ff02::1:ff11:777F"
            ns_type = 135
            icmpv6_pkt = simple_icmpv6_packet(ipv6_dst=ns_ipv6,
                                              ipv6_src=src_ipv6,
                                              icmp_type=ns_type)

            print("Sending IPv6 Neighbor Solicitation packet")
            send_packet(self, self.iport_dev, icmpv6_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(icmpv6_pkt, self.hif_socket))
            print("\tOK")

            # IPv6 Neighbor Advertisement
            na_type = 136
            icmpv6_pkt = simple_icmpv6_packet(ipv6_dst=dst_ipv6,
                                              ipv6_src=src_ipv6,
                                              icmp_type=na_type)

            print("Sending IPv6 Neighbor Advertisement packet")
            send_packet(self, self.iport_dev, icmpv6_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(icmpv6_pkt, self.hif_socket))
            print("\tOK")

            # IPv6 Redirect Message
            red_type = 137
            icmpv6_pkt = simple_icmpv6_packet(ipv6_dst=dst_ipv6,
                                              ipv6_src=src_ipv6,
                                              icmp_type=red_type)

            print("Sending IPv6 Redirect Message packet")
            send_packet(self, self.iport_dev, icmpv6_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(icmpv6_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 5)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, icmpv6_trap)

    def bfdRxTrapTest(self):
        '''
        This verifies trap of type BFD RX
        '''
        print("\nbfdRxTrapTest()")

        bfd_port = 3784

        try:
            bfd_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_BFD)
            self.assertTrue(bfd_trap != 0)

            bfd_pkt = simple_udp_packet(eth_dst=ROUTER_MAC,
                                        ip_dst=self.iport_ip,
                                        udp_dport=bfd_port)

            print("Sending BFDv4 packet")
            send_packet(self, self.iport_dev, bfd_pkt)
            self.assertTrue(socket_verify_packet(bfd_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 1)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, bfd_trap)

    def dhcpv6TrapTest(self):
        '''
        This verifies trap of type DHCPv6
        '''
        print("\ndhcpv6TrapTest()")

        dhcpv6_client_port = 546
        dhcpv6_srv_port = 547
        dhcpv6_pkt_params_list = [
            ["33:33:00:01:00:02", "FF02::1:2", dhcpv6_client_port,
             dhcpv6_srv_port, "all servers and relay agents"],
            ["33:33:00:01:00:05", "FF05::1:3", dhcpv6_client_port,
             dhcpv6_srv_port, "all servers"],
            [ROUTER_MAC, self.my_ipv6, dhcpv6_client_port,
             dhcpv6_srv_port, "ip-to-me server"],
            [ROUTER_MAC, self.my_ipv6, dhcpv6_srv_port,
             dhcpv6_client_port, "ip-to-me client"]
        ]

        try:
            dhcpv6_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_DHCPV6)
            self.assertTrue(dhcpv6_trap != 0)

            for dhcpv6_pkt_params in dhcpv6_pkt_params_list:
                dhcpv6_pkt = simple_udpv6_packet(
                    eth_dst=dhcpv6_pkt_params[0],
                    ipv6_dst=dhcpv6_pkt_params[1],
                    udp_sport=dhcpv6_pkt_params[2],
                    udp_dport=dhcpv6_pkt_params[3])

                print("Sending DHCPv6 \'{}\' packet".
                      format(dhcpv6_pkt_params[4]))
                send_packet(self, self.iport_dev, dhcpv6_pkt)
                self.assertTrue(socket_verify_packet(dhcpv6_pkt,
                                                     self.hif_socket))
                print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + len(dhcpv6_pkt_params_list))
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, dhcpv6_trap)

    def ptpTrapTest(self):
        '''
        This verifies trap of type PTP
        '''
        print("\nptpTrapTest()")

        ptp_port1 = 319
        ptp_port2 = 320

        try:
            ptp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_PTP)
            self.assertTrue(ptp_trap != 0)

            ptp_pkt = simple_udp_packet(eth_dst=ROUTER_MAC,
                                        ip_dst=self.iport_ip,
                                        udp_dport=ptp_port1)

            print("Sending PTP packet to UDP port %d" % ptp_port1)
            send_packet(self, self.iport_dev, ptp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(ptp_pkt, self.hif_socket))
            print("\tOK")

            ptp_pkt = simple_udp_packet(eth_dst=ROUTER_MAC,
                                        ip_dst=self.iport_ip,
                                        udp_dport=ptp_port2)

            print("Sending PTP packet to UDP port %d" % ptp_port2)
            send_packet(self, self.iport_dev, ptp_pkt)  # CPU queue++
            self.assertTrue(socket_verify_packet(ptp_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                self.cpu_queue_state + 2)
            print("\tOK")

            self.cpu_queue_state = post_stats["SAI_QUEUE_STAT_PACKETS"]

        finally:
            sai_thrift_remove_hostif_trap(self.client, ptp_trap)


@group('mpls')
class HostifMplsTrapTypesTest(SaiHelper):
    '''
    This verifies creation of hostif traps of types related to MPLS
    functionality.
    '''
    def setUp(self):
        super(HostifMplsTrapTypesTest, self).setUp()

        self.iport = self.port24
        self.iport_dev = self.dev_port24

        hostif_name = "hostif"

        self.hostif = sai_thrift_create_hostif(self.client,
                                               name=hostif_name,
                                               obj_id=self.iport,
                                               type=SAI_HOSTIF_TYPE_NETDEV)
        self.assertTrue(self.hostif != 0)

        self.hif_socket = open_packet_socket(hostif_name)

    def runTest(self):
        try:
            self.mplsRouterAlertTrapTest()
            self.mplsTtlErrorTrapTest()
        finally:
            pass

    def tearDown(self):
        sai_thrift_remove_hostif(self.client, self.hostif)

        super(HostifMplsTrapTypesTest, self).tearDown()

    def mplsRouterAlertTrapTest(self):
        '''
        This verifies trap of type MPLS router alert
        '''
        print("\nmplsRouterAlertTrapTest()")

        mpls_tag = {'label': 1, 'ttl': 63, 'tc': 0, 's': 0}
        mpls_tag_2 = {'label': 5555, 'ttl': 63, 'tc': 0, 's': 1}

        try:
            mpls_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_MPLS_ROUTER_ALERT_LABEL)
            self.assertTrue(mpls_trap != 0)

            inner_pkt = simple_udp_packet(eth_dst=ROUTER_MAC)

            mpls_pkt = simple_mpls_packet(eth_dst=ROUTER_MAC,
                                          mpls_tags=[mpls_tag, mpls_tag_2],
                                          inner_frame=inner_pkt[IP])

            pre_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)

            print("Sending MPLS packet with Router Alert Label (1)")
            send_packet(self, self.iport_dev, mpls_pkt)
            self.assertTrue(socket_verify_packet(mpls_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                pre_stats["SAI_QUEUE_STAT_PACKETS"] + 1)

        finally:
            self.dataplane.flush()
            sai_thrift_remove_hostif_trap(self.client, mpls_trap)

    def mplsTtlErrorTrapTest(self):
        '''
        This verifies trap of type MPLS TTL error
        '''
        print("\nmplsTtlErrorTrapTest()")

        mpls_tag = {'label': 1000, 'ttl': 1, 'tc': 0, 's': 0}

        try:
            mpls_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_MPLS_TTL_ERROR)
            self.assertTrue(mpls_trap != 0)

            inner_pkt = simple_udp_packet(eth_dst=ROUTER_MAC)

            mpls_pkt = simple_mpls_packet(eth_dst=ROUTER_MAC,
                                          mpls_tags=[mpls_tag],
                                          inner_frame=inner_pkt[IP])

            pre_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)

            print("Sending MPLS packet with TTL=1")
            send_packet(self, self.iport_dev, mpls_pkt)
            self.assertTrue(socket_verify_packet(mpls_pkt, self.hif_socket))
            print("\tOK")

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                pre_stats["SAI_QUEUE_STAT_PACKETS"] + 1)

        finally:
            self.dataplane.flush()
            sai_thrift_remove_hostif_trap(self.client, mpls_trap)


class HostifUserDefinedTrapTest(SaiHelper):
    '''
    Test hostif user defined traps
    '''
    def setUp(self):
        super(HostifUserDefinedTrapTest, self).setUp()

        hostif1_name = "hostif1"
        hostif2_name = "hostif2"

        port = self.port24
        self.test_dev_port = self.dev_port24

        # create hostifs
        # these hostif will be used for receiving trapped packets
        # hostif1 will receive packets from user trap 1
        # hostif2 will receive packets from user trap 2
        self.hostif1 = sai_thrift_create_hostif(self.client,
                                                name=hostif1_name,
                                                obj_id=port,
                                                type=SAI_HOSTIF_TYPE_NETDEV)

        self.assertTrue(self.hostif1 != 0)

        self.hostif2 = sai_thrift_create_hostif(self.client,
                                                name=hostif2_name,
                                                obj_id=port,
                                                type=SAI_HOSTIF_TYPE_NETDEV)

        self.assertTrue(self.hostif2 != 0)
        time.sleep(6)

        self.hostif1_socket = open_packet_socket(hostif1_name)
        self.hostif2_socket = open_packet_socket(hostif2_name)

        # create user defined traps
        self.udt1 = sai_thrift_create_hostif_user_defined_trap(
            self.client,
            type=SAI_HOSTIF_USER_DEFINED_TRAP_TYPE_ACL)
        self.assertTrue(self.udt1 != 0)

        self.udt2 = sai_thrift_create_hostif_user_defined_trap(
            self.client,
            type=SAI_HOSTIF_USER_DEFINED_TRAP_TYPE_ACL)
        self.assertTrue(self.udt2 != 0)

        # associate user defined trap 1 with hostif 1
        channel = SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_NETDEV_PHYSICAL_PORT
        self.hostif_table_entry_udt1_hif1 = \
            sai_thrift_create_hostif_table_entry(
                self.client,
                channel_type=channel,
                host_if=self.hostif1,
                trap_id=self.udt1,
                type=SAI_HOSTIF_TABLE_ENTRY_TYPE_TRAP_ID)
        self.assertTrue(self.hostif_table_entry_udt1_hif1 != 0)

        # associate user defined trap 2 with hostif 2
        channel = SAI_HOSTIF_TABLE_ENTRY_CHANNEL_TYPE_NETDEV_PHYSICAL_PORT
        self.hostif_table_entry_udt2_hif2 = \
            sai_thrift_create_hostif_table_entry(
                self.client,
                channel_type=channel,
                host_if=self.hostif2,
                trap_id=self.udt2,
                type=SAI_HOSTIF_TABLE_ENTRY_TYPE_TRAP_ID)
        self.assertTrue(self.hostif_table_entry_udt2_hif2 != 0)

        # create ACL table
        table_stage = SAI_ACL_STAGE_INGRESS
        table_bind_points = [SAI_ACL_BIND_POINT_TYPE_SWITCH]
        table_bind_point_type_list = sai_thrift_s32_list_t(
            count=len(table_bind_points), int32list=table_bind_points)
        self.acl_table = sai_thrift_create_acl_table(
            self.client,
            acl_stage=table_stage,
            acl_bind_point_type_list=table_bind_point_type_list,
            field_src_ip=True)
        self.assertTrue(self.acl_table != 0)

        # test will create ACL rules to match these addresses and
        # trap mathing packets
        self.src_ip1 = '10.0.0.1'
        src_ip1_mask = '255.255.255.255'

        self.src_ip2 = '10.0.0.2'
        src_ip2_mask = '255.255.255.255'

        # create ACL table entry and associate it with user defined trap 1
        src_ip_t = sai_thrift_acl_field_data_t(
            data=sai_thrift_acl_field_data_data_t(ip4=self.src_ip1),
            mask=sai_thrift_acl_field_data_mask_t(ip4=src_ip1_mask))

        set_user_trap_id = sai_thrift_acl_action_data_t(
            parameter=sai_thrift_acl_action_parameter_t(oid=self.udt1))

        packet_action = sai_thrift_acl_action_data_t(
            parameter=sai_thrift_acl_action_parameter_t(
                s32=SAI_PACKET_ACTION_TRAP))
        self.acl_entry1 = sai_thrift_create_acl_entry(
            self.client,
            table_id=self.acl_table,
            priority=10,
            field_src_ip=src_ip_t,
            action_set_user_trap_id=set_user_trap_id,
            action_packet_action=packet_action)
        self.assertTrue(self.acl_entry1 != 0)

        # create ACL table entry and associate it with user defined trap 2
        src_ip_t = sai_thrift_acl_field_data_t(
            data=sai_thrift_acl_field_data_data_t(ip4=self.src_ip2),
            mask=sai_thrift_acl_field_data_mask_t(ip4=src_ip2_mask))

        set_user_trap_id = sai_thrift_acl_action_data_t(
            parameter=sai_thrift_acl_action_parameter_t(oid=self.udt2))

        packet_action = sai_thrift_acl_action_data_t(
            parameter=sai_thrift_acl_action_parameter_t(
                s32=SAI_PACKET_ACTION_TRAP))
        self.acl_entry2 = sai_thrift_create_acl_entry(
            self.client,
            table_id=self.acl_table,
            priority=11,
            field_src_ip=src_ip_t,
            action_set_user_trap_id=set_user_trap_id,
            action_packet_action=packet_action)
        self.assertTrue(self.acl_entry2 != 0)

    def runTest(self):
        try:
            self.aclIpSrcNetdevTrapTest()
        finally:
            pass

    def tearDown(self):
        sai_thrift_remove_acl_entry(self.client, self.acl_entry2)
        sai_thrift_remove_acl_entry(self.client, self.acl_entry1)
        sai_thrift_remove_acl_table(self.client, self.acl_table)
        sai_thrift_remove_hostif_table_entry(
            self.client, self.hostif_table_entry_udt2_hif2)
        sai_thrift_remove_hostif_table_entry(
            self.client, self.hostif_table_entry_udt1_hif1)
        sai_thrift_remove_hostif_user_defined_trap(
            self.client, self.udt2)
        sai_thrift_remove_hostif_user_defined_trap(
            self.client, self.udt1)
        sai_thrift_remove_hostif(self.client, self.hostif2)
        sai_thrift_remove_hostif(self.client, self.hostif1)

        super(HostifUserDefinedTrapTest, self).tearDown()

    def aclIpSrcNetdevTrapTest(self):
        '''
        Verify the traffic matching ACL rule associated with user defined trap
        is properly trapped and directed to the relevant host interface
        1. create two host interfaces
        2. create two user defined traps
        3. create hostif table entries to route trap 1 packets
           to host interface 1 and trap 2 packets to host interface 2
        4. create ACL table with ACL enties matching different traffic
           for each user defined trap
        5. send packets matching the ACL entries and verify them arrived to
           expected host interfaces
        '''
        print("\naclIpSrcNetdevTrapTest()")

        # create packet to be trapped by user defined trap 1
        pkt1 = simple_ip_packet(ip_src=self.src_ip1)

        # create packet to be trapped by user defined trap 2
        pkt2 = simple_ip_packet(ip_src=self.src_ip2)

        try:
            pre_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)

            # Send packets and verify they are properly trapped
            print("Sending IP packet 1")
            send_packet(self, self.test_dev_port, pkt1)  # CPU queue++
            print("Verifying IP packet 1 on port host interface 1")
            self.assertTrue(socket_verify_packet(pkt1, self.hostif1_socket))
            print("Verifying no IP packet 1 on port host interface 2")
            self.assertTrue(
                not socket_verify_packet(
                    pkt1, self.hostif2_socket, timeout=2))

            print("Sending IP packet 2")
            send_packet(self, self.test_dev_port, pkt2)  # CPU queue++
            print("Verifying no IP packet 2 on port host interface 1")
            self.assertTrue(
                not socket_verify_packet(
                    pkt2, self.hostif1_socket, timeout=2))
            print("Verifying IP packet 2 on port host interface 2")
            self.assertTrue(socket_verify_packet(pkt2, self.hostif2_socket))

            print("Verifying CPU port queue stats")
            time.sleep(4)
            post_stats = sai_thrift_get_queue_stats(
                self.client, self.cpu_queue0)
            self.assertEqual(
                post_stats["SAI_QUEUE_STAT_PACKETS"],
                pre_stats["SAI_QUEUE_STAT_PACKETS"] + 2)
            print("\tOK")

        finally:
            self.dataplane.flush()


class HostifTrapAttributeGetterTest(SaiHelperBase):
    '''
    Performs testing of saihostif.cpp sai_get_hostif_trap_attribute
    '''
    def runTest(self):
        self.trapPriorityTest()
        self.trapTypeTest()
        self.trapGroupTest()
        self.trapActionTest()

    def trapPriorityTest(self):
        '''
        tests sai_get_hostif_trap_attribute with priority attribute
        '''
        try:
            custom_priotiy_1 = 11
            lldp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP,
                trap_priority=custom_priotiy_1,
            )
            self.assertGreater(lldp_trap, 0)

            attrs = sai_thrift_get_hostif_trap_attribute(
                self.client,
                lldp_trap,
                trap_priority=True,
            )
            self.assertEqual(attrs["trap_priority"], custom_priotiy_1)

            custom_priotiy_2 = 5

            dhcp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_DHCP,
                trap_priority=custom_priotiy_2,
            )
            self.assertGreater(dhcp_trap, 0)

            attrs = sai_thrift_get_hostif_trap_attribute(
                self.client,
                dhcp_trap,
                trap_priority=True,
            )
            self.assertEqual(attrs["trap_priority"], custom_priotiy_2)

        finally:
            sai_thrift_remove_hostif_trap(self.client, dhcp_trap)
            sai_thrift_remove_hostif_trap(self.client, lldp_trap)

    def trapTypeTest(self):
        '''
        tests sai_get_hostif_trap_attribute with trap type attribute
        '''
        try:
            lldp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_LLDP,
            )
            self.assertGreater(lldp_trap, 0)

            attrs = sai_thrift_get_hostif_trap_attribute(
                self.client,
                lldp_trap,
                trap_type=True,
            )
            self.assertEqual(attrs["trap_type"], SAI_HOSTIF_TRAP_TYPE_LLDP)

            dhcp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_DHCP,
            )
            self.assertGreater(dhcp_trap, 0)

            attrs = sai_thrift_get_hostif_trap_attribute(
                self.client,
                dhcp_trap,
                trap_type=True,
            )
            self.assertEqual(attrs["trap_type"], SAI_HOSTIF_TRAP_TYPE_DHCP)

        finally:
            sai_thrift_remove_hostif_trap(self.client, lldp_trap)
            sai_thrift_remove_hostif_trap(self.client, dhcp_trap)

    def trapGroupTest(self):
        '''
        tests sai_get_hostif_trap_attribute with trap group attribute
        '''
        try:
            custom_trap_group = sai_thrift_create_hostif_trap_group(
                self.client,
                admin_state=True,
            )
            self.assertGreater(custom_trap_group, 0)

            ip2me_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_IP2ME,
            )
            self.assertGreater(ip2me_trap, 0)

            attrs = sai_thrift_get_hostif_trap_attribute(
                self.client,
                ip2me_trap,
                trap_group=True,
            )
            self.assertNotEqual(attrs["trap_group"], custom_trap_group)

            dhcp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_DHCP,
                trap_group=custom_trap_group,
            )
            attrs = sai_thrift_get_hostif_trap_attribute(
                self.client,
                dhcp_trap,
                trap_group=True,
            )

            self.assertEqual(attrs["trap_group"], custom_trap_group)

        finally:
            sai_thrift_remove_hostif_trap(self.client, ip2me_trap)
            sai_thrift_remove_hostif_trap(self.client, dhcp_trap)
            sai_thrift_remove_hostif_trap_group(self.client, custom_trap_group)

    def trapActionTest(self):
        '''
        tests sai_get_hostif_trap_attribute with action attribute
        '''
        try:
            ip2me_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_TRAP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_IP2ME,
            )
            self.assertGreater(ip2me_trap, 0)

            attrs = sai_thrift_get_hostif_trap_attribute(
                self.client,
                ip2me_trap,
                packet_action=True,
            )
            self.assertEqual(attrs["packet_action"], SAI_PACKET_ACTION_TRAP)

            dhcp_trap = sai_thrift_create_hostif_trap(
                self.client,
                packet_action=SAI_PACKET_ACTION_DROP,
                trap_type=SAI_HOSTIF_TRAP_TYPE_DHCP,
            )
            attrs = sai_thrift_get_hostif_trap_attribute(
                self.client,
                dhcp_trap,
                packet_action=True,
            )

            self.assertEqual(attrs["packet_action"], SAI_PACKET_ACTION_DROP)

        finally:
            sai_thrift_remove_hostif_trap(self.client, ip2me_trap)
            sai_thrift_remove_hostif_trap(self.client, dhcp_trap)
