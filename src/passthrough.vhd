----------------------------------------------------------------------------------
-- Company        : 
-- Engineer       : Nambinina Rakotojaona
-- 
-- Create Date    : 03.06.2025
-- Design Name    : AXI4-Stream Pipeline Stage
-- Module Name    : axi_stream_stage - Behavioral
-- Project Name   : Generic AXI4-Stream Infrastructure
-- Target Devices : Generic FPGA
-- Tool Versions  : Any VHDL-compliant synthesis tool
-- Description    : 
--   This module implements a 1-stage AXI4-Stream pipeline register.
--   It supports standard VALID/READY handshaking and buffers a single
--   data beat. It allows backpressure from downstream modules and 
--   properly stalls the upstream interface if needed.
--
-- Dependencies   : None
--
-- Revision       :
-- Revision 0.01 - Initial version by Nambinina Rakotojaona
-- Additional Comments:
--   Extendable with TLAST/TKEEP/TUSER support for full AXIS compliance.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity axi_stream_stage is
  generic (
    DATA_WIDTH : integer := 32
  );
  port (
    clk      : in std_logic;
    rst      : in std_logic;

    -- Input Stream Interface
    valid_in : in std_logic;
    ready_in : out std_logic;
    data_in  : in std_logic_vector(DATA_WIDTH-1 downto 0);

    -- Output Stream Interface
    valid_out : out std_logic;
    ready_out : in std_logic;
    data_out  : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end axi_stream_stage;

architecture Behavioral of axi_stream_stage is
    signal data_reg  : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
    signal valid_reg : std_logic := '0';
begin
    -- Output assignments
    valid_out <= valid_reg;
    data_out  <= data_reg;

    -- Input ready: can accept new data when buffer is empty or downstream is ready
    ready_in <= not valid_reg or ready_out;

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '0' then
                valid_reg <= '0';
                data_reg  <= (others => '0');
            else
                -- Latch data from input when ready and valid
                if (ready_in = '1') and (valid_in = '1') then
                    data_reg  <= data_in;
                    valid_reg <= '1';
                -- Clear valid when data is accepted by downstream
                elsif (ready_out = '1') then
                    valid_reg <= '0';
                end if;
            end if;
        end if;
    end process;
end Behavioral;
