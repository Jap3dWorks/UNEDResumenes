-- Circuito de control de alarma de un coche.
-- Es una representación del comportamiento del circuito,
--  Expresada mediante funciones lógicas.

library IEEE;
use IEEE.std_logic_1164.all;

entity buzzer is
  port (Warning : out std_logic;
        Door, Ignition, Sbelt : in std_logic);
end entity buzzer;

architecture buzzer1 of buzzer is
begin
  Warning <= (not Door and Ignition) or (not SBelt and Ignition);
end architecture buzzer1;
    
