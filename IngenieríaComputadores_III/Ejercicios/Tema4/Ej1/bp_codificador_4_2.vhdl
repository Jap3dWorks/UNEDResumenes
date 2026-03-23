library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity bp_codificador_4_2 is
  constant MAX_COMB : integer := 16;
  constant DELAY    : time    := 10 ns;
end entity bp_codificador_4_2;

architecture bp_codificador_4_2 of bp_codificador_4_2 is
  signal valida      : std_logic;
  signal codificada  : std_logic_vector(1 downto 0);
  signal i3,i2,i1,i0 : std_logic;

  component codificador_4_2_prioridad is
    port ( valida      : out std_logic;
           codificada  : out std_logic_vector(1 downto 0);
           i3,i2,i1,i0 : in std_logic);
  end component codificador_4_2_prioridad;

begin
  UUT : component codificador_4_2_prioridad
    port map (valida, codificada, i3,i2,i1,i0);

  main : process is
    variable temp                : unsigned (3 downto 0);
    variable esperado_valida      : std_logic;
    variable esperado_codificada :std_logic_vector(1 downto 0);
    variable error_count         : integer := 0;
  begin
    report "Comienza la simulación";
    for i in 0 to (MAX_COMB-1) loop
      temp := TO_UNSIGNED(i,4);
      i3 <= std_logic(temp(3));
      i2 <= std_logic(temp(2));
      i1 <= std_logic(temp(1));
      i0 <= std_logic(temp(0));
      -- Calcular valor esperado
      if (i=0) then
        esperado_valida     := '0';
        esperado_codificada := "00";
      else
        esperado_valida                         := '1';
        if (i=1) then esperado_codificada       := "00";
        elsif (i <= 3) then esperado_codificada := "01";
        elsif (i <= 7) then esperado_codificada := "10";
        else                esperado_codificada := "11";
        end if;
      end if;
      wait for DELAY;

      if (esperado_valida /= valida) then
        report "ERROR en la salida valida. Valor esperado: " &
          std_logic'image(esperado_valida)                   &
          ", valor actual: "                                 &
          std_logic'image(valida)                            &
          " en el instante: "                                &
          time'image(now);
        error_count := error_count + 1;
      end if;

      if (esperado_codificada /= codificada) then
        report "ERROR en la salida codificada. Valor esperado: " &
          std_logic'image(esperado_codificada(1))                &
          std_logic'image(esperado_codificada(0))                &
          ", valor actual: "                                     &
          std_logic'image(codificada(1))                         &
          std_logic'image(codificada(0))                         &
          " en el instante: "                                    &
          time'image(now);
        error_count := error_count + 1;
      end if;
    end loop;

    -- Número total de erroes
    if (error_count = 0) then
      report "Simulación finalizada sin errores";
    else
      report "ERROR: Hay "         &
        integer'image(error_count) &
        " errorres.";
    end if;

    wait;

  end process main;

end architecture bp_codificador_4_2;
