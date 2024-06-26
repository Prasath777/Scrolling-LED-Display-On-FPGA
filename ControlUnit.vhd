library ieee;
use work.definitions_package.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is
    port (
        clk : in std_logic;
        rst : in std_logic;
        hard_rst : in std_logic;
        toSeg : out bus_width;
        inst : in std_logic_vector(5 downto 0) --instruction input from Scheduler
    );
end ControlUnit;

architecture rtl of ControlUnit is
    signal next_inst: std_logic_vector(5 downto 0);
begin
    --only look at the next set of instructions on the rising edge of the clock
    process (rst, clk)
    begin
        if rising_edge (clk) then
            if (rst = '1' OR hard_rst = '1') then
                next_inst <= "000000";
            else
               next_inst <= inst;
            end if;
        end if;
    end process;

    process(next_inst)
    begin
        case next_inst is
            -- program 1 (Hello Ehsan)
            when "000101" =>
                toSeg(0) <= "00001"; -- H
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
            when "000110" =>
                toSeg(0) <= "00010"; -- E
                toSeg(1) <= "00001"; -- H
                toSeg(2) <= "00000"; -- OFF
                toSeg(3) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF 
                toSeg(6) <= "00000"; -- OFF
                toSeg(7) <= "00000"; -- OFF
            when "000111" =>
                toSeg(0) <= "00011"; -- L / worm tail moving left
                toSeg(1) <= "00010"; -- E
                toSeg(2) <= "00001"; -- H
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
            when "001000" =>
                toSeg(0) <= "00011"; -- L / worm tail moving left
                toSeg(1) <= "00011"; -- L / worm tail moving left
                toSeg(2) <= "00010"; -- E
                toSeg(3) <= "00001"; -- H
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
            when "001001" =>
                toSeg(0) <= "00100"; -- O
                toSeg(1) <= "00011"; -- L / worm tail moving left
                toSeg(2) <= "00011"; -- L / worm tail moving left
                toSeg(3) <= "00010"; -- E
                toSeg(4) <= "00001"; -- H
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
            when "001010" =>
                toSeg(1) <= "00100"; -- O
                toSeg(2) <= "00011"; -- L / worm tail moving left
                toSeg(3) <= "00011"; -- L / worm tail moving left
                toSeg(4) <= "00010"; -- E
                toSeg(5) <= "00001"; -- H
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
            when "001011" =>
                toSeg(0) <= "00010"; -- E
                toSeg(1) <= "00000"; -- OFF
                toSeg(2) <= "00100"; -- O
                toSeg(3) <= "00011"; -- L / worm tail moving left
                toSeg(4) <= "00011"; -- L / worm tail moving left
                toSeg(5) <= "00010"; -- E
                toSeg(6) <= "00001"; -- H
                toSeg(7) <= "00000"; -- OFF
            when "001100" =>
                toSeg(0) <= "00001"; -- H
                toSeg(1) <= "00010"; -- E
                toSeg(2) <= "00000"; -- OFF
                toSeg(3) <= "00100"; -- O
                toSeg(4) <= "00011"; -- L / worm tail moving left
                toSeg(5) <= "00011"; -- L / worm tail moving left
                toSeg(6) <= "00010"; -- E
                toSeg(7) <= "00001"; -- H
            when "001101" =>
                toSeg(0) <= "10010"; -- S
                toSeg(1) <= "00001"; -- H
                toSeg(2) <= "00010"; -- E
                toSeg(3) <= "00000"; -- OFF
                toSeg(4) <= "00100"; -- O
                toSeg(5) <= "00011"; -- L / worm tail moving left
                toSeg(6) <= "00011"; -- L / worm tail moving left
                toSeg(7) <= "00010"; -- E
            when "001110" =>
                toSeg(0) <= "10011"; -- A
                toSeg(1) <= "10010"; -- S
                toSeg(2) <= "00001"; -- H
                toSeg(3) <= "00010"; -- E
                toSeg(4) <= "00000"; -- OFF
                toSeg(5) <= "00100"; -- O
                toSeg(6) <= "00011"; -- L / worm tail moving left
                toSeg(7) <= "00011"; -- L / worm tail moving left
            when "001111" =>
                toSeg(0) <= "00111"; -- N / worm body
                toSeg(1) <= "10011"; -- A
                toSeg(2) <= "10010"; -- S
                toSeg(3) <= "00001"; -- H
                toSeg(4) <= "00010"; -- E
                toSeg(5) <= "00000"; -- OFF
                toSeg(6) <= "00100"; -- O
                toSeg(7) <= "00011"; -- L / worm tail moving left
            when "010000" =>
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "00111"; -- N / worm body
                toSeg(2) <= "10011"; -- A
                toSeg(3) <= "10010"; -- S
                toSeg(4) <= "00001"; -- H
                toSeg(5) <= "00010"; -- E
                toSeg(6) <= "00000"; -- OFF
                toSeg(7) <= "00100"; -- O
            when "010001" =>
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(2) <= "00111"; -- N / worm body
                toSeg(3) <= "10011"; -- A
                toSeg(4) <= "10010"; -- S
                toSeg(5) <= "00001"; -- H
                toSeg(6) <= "00010"; -- E
                toSeg(7) <= "00000"; -- OFF
            when "010010" =>
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF 
                toSeg(3) <= "00111"; -- N / worm body
                toSeg(4) <= "10011"; -- A
                toSeg(5) <= "10010"; -- S
                toSeg(6) <= "00001"; -- H
                toSeg(7) <= "00010"; -- E
            when "010011" =>
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF 
                toSeg(4) <= "00111"; -- N / worm body
                toSeg(5) <= "10011"; -- A
                toSeg(6) <= "10010"; -- S
                toSeg(7) <= "00001"; -- H
            when "010100" =>
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF 
                toSeg(5) <= "00111"; -- N / worm body
                toSeg(6) <= "10011"; -- A
                toSeg(7) <= "10010"; -- S
            when "010101" =>
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF 
                toSeg(6) <= "00111"; -- N / worm body
                toSeg(7) <= "10011"; -- A
            when "010110" =>
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF 
                toSeg(7) <= "00111"; -- N / worm body
            
            --program 2 (worm moving left)
            when "010111" =>
                toSeg(0) <= "00110"; -- 7 / worm head moving left
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
            when "011000" =>
                toSeg(0) <= "00111"; -- N / worm body
                toSeg(1) <= "00110"; -- 7 / worm head moving left
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
            when "011001" =>
                toSeg(0) <= "00111"; -- N / worm body
                toSeg(1) <= "00111"; -- N / worm body
                toSeg(2) <= "00110"; -- 7 / worm head moving left
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
            when "011010" =>
                toSeg(0) <= "00011"; -- L / worm tail moving left
                toSeg(1) <= "00111"; -- N / worm body
                toSeg(2) <= "00111"; -- N / worm body
                toSeg(3) <= "00110"; -- 7 / worm head moving left
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF
            when "011011" =>
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "00011"; -- L / worm tail moving left
                toSeg(2) <= "00111"; -- N / worm body
                toSeg(3) <= "00111"; -- N / worm body
                toSeg(4) <= "00110"; -- 7 / worm head moving left
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
            when "011100" =>
                toSeg(2) <= "00011"; -- L / worm tail moving left
                toSeg(3) <= "00111"; -- N / worm body
                toSeg(4) <= "00111"; -- N / worm body
                toSeg(5) <= "00110"; -- 7 / worm head moving left
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
            when "011101" =>
                toSeg(3) <= "00011"; -- L / worm tail moving left
                toSeg(4) <= "00111"; -- N / worm body
                toSeg(5) <= "00111"; -- N / worm body
                toSeg(6) <= "00110"; -- 7 / worm head moving left
                toSeg(7) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
            when "011110" =>
                toSeg(4) <= "00011"; -- L / worm tail moving left
                toSeg(5) <= "00111"; -- N / worm body
                toSeg(6) <= "00111"; -- N / worm body
                toSeg(7) <= "00110"; -- 7 / worm head moving left
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
            when "011111" =>
                toSeg(5) <= "00011"; -- L / worm tail moving left
                toSeg(6) <= "00111"; -- N / worm body
                toSeg(7) <= "00111"; -- N / worm body
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF -- OFF
            when "100000" =>
                toSeg(6) <= "00011"; -- L / worm tail moving left
                toSeg(7) <= "00111"; -- N / worm body
                toSeg(5) <= "00000"; -- OFF -- OFF
                toSeg(4) <= "00000"; -- OFF -- OFF 
                toSeg(3) <= "00000"; -- OFF -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF     
            when "100001" =>
                toSeg(7) <= "00011"; -- L / worm tail moving left
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF

            -- program 3 (worm moving right)
            when "100010" =>
                toSeg(7) <= "01000"; -- worm head - moving right
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
            when "100011" =>
                toSeg(7) <= "00111"; -- N / worm body
                toSeg(6) <= "01000"; -- worm head - moving right
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
            when "100100" =>
                toSeg(7) <= "00111"; -- N / worm body
                toSeg(6) <= "00111"; -- N / worm body
                toSeg(5) <= "01000"; -- worm head - moving right
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
            when "100101" =>
                toSeg(7) <= "01001"; -- worm tail- moving right
                toSeg(6) <= "00111"; -- N / worm body
                toSeg(5) <= "00111"; -- N / worm body
                toSeg(4) <= "01000"; -- worm head - moving right 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
            when "100110" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "01001"; -- worm tail- moving right
                toSeg(5) <= "00111"; -- N / worm body
                toSeg(4) <= "00111"; -- N / worm body
                toSeg(3) <= "01000"; -- worm head - moving right
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
            when "100111" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "01001"; -- worm tail- moving right
                toSeg(4) <= "00111"; -- N / worm body 
                toSeg(3) <= "00111"; -- N / worm body
                toSeg(2) <= "01000"; -- worm head - moving right
                toSeg(1) <= "00000"; -- OFF 
                toSeg(0) <= "00000"; -- OFF    
            when "101000" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "01001"; -- worm tail- moving right 
                toSeg(3) <= "00111"; -- N / worm body
                toSeg(2) <= "00111"; -- N / worm body
                toSeg(1) <= "01000"; -- worm head - moving right 
                toSeg(0) <= "00000"; -- OFF    
            when "101001" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "01001"; -- worm tail- moving right
                toSeg(2) <= "00111"; -- N / worm body
                toSeg(1) <= "00111"; -- N / worm body
                toSeg(0) <= "01000"; -- worm head - moving right    
            when "101010" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "01001"; -- worm tail- moving right
                toSeg(1) <= "00111"; -- N / worm body 
                toSeg(0) <= "00111"; -- N / worm body
            when "101011" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "01001"; -- worm tail- moving right 
                toSeg(0) <= "00111"; -- N / worm body      
            when "101100" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "01001"; -- worm tail- moving right 

            --program 4 (fly in a box)
            when "101101" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "10000"; -- LED 6 lit up
            when "101110" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "01111"; -- LED 5 lit up
            when "101111" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "01010"; -- LED 0 lit up
            when "110000" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "01011";
            when "110001" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "10000"; -- LED 6 lit up
            when "110010" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "01110"; -- LED 4 lit up
            when "110011" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "01101"; -- LED 3 lit up
            when "110100" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "01100"; -- LED 2 lit up
            when "110101" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "10000"; -- LED 6 lit up
            when "110110" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "10000"; -- LED 6 lit up
            when "110111" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <="01111"; -- LED 5 lit up
            when "111000" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "01010"; -- LED 0 lit up
            when "111001" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "01011";
            when "111010" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "10000"; -- LED 6 lit up
            when "111011" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "01110"; -- LED 4 lit up
            when "111100" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "01101"; -- LED 3 lit up
            when "111101" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "01100"; -- LED 2 lit up
            when "111110" =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF
                toSeg(1) <= "10000"; -- LED 6 lit up          
            --Error message
            when "111111" =>
                toSeg(7) <= "00000"; --OFF
                toSeg(6) <= "00000"; --OFF
                toSeg(5) <= "00000"; --OFF
                toSeg(4) <= "00010"; -- E
                toSeg(3) <= "00101"; -- r
                toSeg(2) <= "00101"; -- r
                toSeg(1) <= "10001"; -- o
                toSeg(0) <= "00101"; -- r                                  
            when OTHERS =>
                toSeg(7) <= "00000"; -- OFF
                toSeg(6) <= "00000"; -- OFF
                toSeg(5) <= "00000"; -- OFF
                toSeg(4) <= "00000"; -- OFF 
                toSeg(3) <= "00000"; -- OFF
                toSeg(2) <= "00000"; -- OFF
                toSeg(1) <= "00000"; -- OFF
                toSeg(0) <= "00000"; -- OFF 
            end case;
        end process;
end architecture;