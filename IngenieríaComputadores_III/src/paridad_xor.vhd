-- archivo del not1
library IEEE;
use IEEE.std_logic_1164.all;

entity not1 is
  port(y0 : out std_logic;
       x0 : in std_logic);
end entity not1
architecture not1 of not1 is
  begin
    y0 <= not x0;
end architecture not1;

-- archivo del xor
library IEEE;
use IEEE.std_logic_1164.all;
entity xor2 is
  port (y0 : out std_logic;
        x0, x1 : in std_logic);
end entity xor2;
architecture xor2 of xor2 is
  begin
    y0 <= x0 xor x1;
end architecture xor2;

-- Archivo del detector de paridad
library IEEE;
use IEEE.std_logic_1164.all;
architecture estruc_xor_not of detectorPar is
  component xor2 is
    port (y0 : out std_logic;
          x0,x1 : in std_logic);
    end component xor2;
  component not1 is
    port (y0 : out std_logic;
          x0 : in std_logic);
    end component not1;
  signal s1,s2 : std_logic;
  begin
    unit1 : xor2 port map (x0 => a(0), x1 => a(1), y0 => s1);
    unit2 : xor2 port map (x0 => a1,   x1 => a(2), y0 => s1);
    unit3 : not1 port map (x0 => s2, y0 => par);
end architecture estruc_xor_not;


                 
