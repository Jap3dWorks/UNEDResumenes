-- Circuito de control de alarma de un coche.
-- Es una representación estructural del circuito
--  al nivel de puertas lógicas.
library IEEE;
use IEEE.std_logic_1164.all;

entity BUZZER is port (
  Warning : out std_logic;
  Door, Ignition, Sbelt : in std_logic
  );
 end entity BUZZER;

architecture buzzer2 of BUZZER is
  signal Door_not, Sbelt_not, B1, B2 : std_logic;
  component AND2
    port ( y0 : out std_logic;
           x0, x1 : in std_logic);
  end component;
  component OR2
    port ( y0 : out std_logic;
           x0, x1 : in std_logic);
  end component;
  component NOT1
    port ( y0 : out std_logic;
           x0 : in std_logic);
  end component;
begin
  U0 : NOT1 port map (Door_not, Door);
  U1 : NOT1 port map (Sbelt_not, Sbelt);
  U2 : AND2 port map (B1, Ignition, Door_not);
  U3 : AND2 port map (B2, Ignition, Sbelt_not);
  U4 : OR2 port map (Warning, B1, B2);
end architecture buzzer2;
