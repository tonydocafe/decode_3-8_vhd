----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:51:56 05/10/2023 
-- Design Name: 
-- Module Name:    dcd38 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dcd38 is

	port(
	p : in std_logic_vector(2 downto 0); 
	e : in std_logic;
	s: out std_logic_vector(7 downto 0)
	);
	
end dcd38;

architecture Behavioral of dcd38 is

begin
   
	s(0) <= e or p(2) or (p(1) or p(0));
	s(1) <= e or p(2) or (p(1) or not p(0));
	s(2) <= e or p(2) or (not p(1) or p(0));
	s(3) <= e or p(2) or (not p(1) or not p(0));
	s(4) <= e or not p(2) or (p(1) or p(0));
	s(5) <= e or not p(2) or (p(1) or not p(0));
	s(6) <= e or not p(2) or (not p(1) or p(0));
	s(7) <= e or not p(2) or (not p(1) or not p(0));
	
end Behavioral;



