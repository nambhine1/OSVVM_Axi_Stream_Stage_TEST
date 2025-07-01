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
