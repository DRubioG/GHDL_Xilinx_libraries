library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ODDR is
  generic (
    DDR_CLK_EDGE : string := "OPPOSITE_EDGE";
    INIT         : bit    := '0';
    SRTYPE       : string := "ASYNC"
  );
  port (
    Q  : out std_logic;
    C  : in std_logic;
    CE : in std_logic;
    D1 : in std_logic;
    D2 : in std_logic;
    R  : in std_logic;
    S  : in std_logic
  );
end ODDR;

architecture behavioral of ODDR is

  signal q_reg : std_logic;

begin

  INIT_GEN : if INIT = '1' generate
    signal q_reg : std_logic := '1';
  begin
  else
    generate
      signal q_reg : std_logic := '0';
    begin
    end generate;

    Q <= q_reg;

    EDGE_GEN : if DDR_CLK_EDGE = "OPPOSITE_EDGE" generate

      EDGE_GEN_ASYNC : if SRTYPE = "ASYNC" generate
        process (C, R, S)
        begin
          if R = '1' or S = '1' then
            q_reg <= '0';

          elsif rising_edge(C) then
            if CE = '1' then
              q_reg <= D1;
            end if;

          elsif falling_edge(C) then
            if CE = '1' then
              q_reg <= D2;
            end if;
          end if;
        end process;
      end generate;
      EDGE_GEN_SYNC : if SRTYPE = "SYNC" generate
        process (C, R, S)
        begin

          if rising_edge(C) then

            if R = '1' or S = '1' then
              q_reg <= '0';
            elsif CE = '1' then
              q_reg <= D1;
            end if;

          elsif falling_edge(C) then
            if R = '1' or S = '1' then
              q_reg <= '0';
            elsif CE = '1' then
              q_reg <= D2;
            end if;
          end if;
        end process;
      end generate;
    end generate;

    SAME_EDGE_GEN : if DDR_CLK_EDGE = "SAME_EDGE" generate

      signal q_reg1 : std_logic;
    begin

      EDGE_GEN_ASYNC : if SRTYPE = "ASYNC" generate
        process (C, R, S)
        begin
          if R = '1' or S = '1' then
            q_reg <= '0';

          elsif rising_edge(C) then
            if CE = '1' then
              q_reg  <= D1;
              q_reg1 <= D2;
            end if;

          elsif falling_edge(C) then
            if CE = '1' then
              q_reg <= q_reg1;
            end if;
          end if;
        end process;
      end generate;

      EDGE_GEN_SYNC : if SRTYPE = "SYNC" generate
        process (C, R, S)
        begin

          if rising_edge(C) then

            if R = '1' or S = '1' then
              q_reg <= '0';
            elsif CE = '1' then
              q_reg  <= D1;
              q_reg1 <= D2;
            end if;

          elsif falling_edge(C) then
            if R = '1' or S = '1' then
              q_reg <= '0';
            elsif CE = '1' then
              q_reg <= q_reg1;
            end if;
          end if;
        end process;
      end generate;

    end generate;
  end behavioral;