library IEEE;
use IEEE.std_logic_1164.all;

entity codificador_4_2_prioridad is
  port( valida      : out std_logic;
        codificada  : out std_logic_vector(1 downto 0);
        i3,i2,i1,i0 : in  std_logic);
end entity codificador_4_2_prioridad; 

architecture codificador_4_2_prioridad of codificador_4_2_prioridad is
begin
  process (i3,i2,i1,i0) is
  begin
    if (i3='1') or (i2='1') or (i1='1') or (i0='1') then
      valida <= '1';
    else
      valida <= '0';
    end if;

    if    (i3 = '1') then codificada <= "11";
    elsif (i2 = '1') then codificada <= "10";
    elsif (i1 = '1') then codificada <= "01";
    else codificada <= "00";
    end if;
  end process;
end architecture codificador_4_2_prioridad;
