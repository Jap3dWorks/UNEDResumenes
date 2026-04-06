library IEEE;
use IEEE.std_logic_1164.all;

entity TST is
end entity TST;

architecture TST of TST is
  
  constant PERIODO : time := 10 ns;

  signal clk : std_logic := '0';

begin
   
   clk <= not clk after (PERIODO/2);

   gen_vec_test : process is
   begin
     report "Comienza";
          
     report "FIN";
     wait;  
   end process gen_vec_test;
end architecture TST;
