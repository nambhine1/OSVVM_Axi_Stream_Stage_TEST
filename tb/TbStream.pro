TestSuite TbStream 

SetLogSignals true



analyze TestCtrl_e.vhd
analyze TbStream.vhd


#Testcases:

analyze Tb_send_data.vhd

simulate Tb_send_data
