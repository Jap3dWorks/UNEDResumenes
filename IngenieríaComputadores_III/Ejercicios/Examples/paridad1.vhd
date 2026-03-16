-- Comentarios

library IEEE;
use IEEE.std_logic_1164.all;

entity detectorPar is
  port(
    par : out std_logic;
    a   :  in std.logic.vector(2 downto 0);
       );

end entity detectorPar;

architecture comp_funlog of detectorPar is
  signal p1, p2, p3, p4 : std_logic;                               -- declaración de señales
  begin
    --Asignaciones concurrentes
    par <= (p1 or p2) or (p3 or p4) after 20 ns;                   -- After, retardo de la sen~al
    p1 <= (not a(2)) and (not a(1)) and (not a(0)) after 15 ns;
    p2 <= (not a(2)) and a(1) and a(0) after 12 ns;
    p3 <= (a(2)) and (not a(1)) and a(0) after 12 ns;
    p4 <= a(2) and a(1) and (not a(0)) after 12 ns;
end architecture comp_funlog                                       -- Terminación de la arquitectura



