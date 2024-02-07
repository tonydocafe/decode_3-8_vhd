----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:16 05/10/2023 
-- Design Name: 
-- Module Name:    decodd - Behavioral 
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

entity decodd is
	 port ( 
			  CLK_50MHz : in std_logic;
           CA : out  STD_LOGIC;
           CB : out  STD_LOGIC;
           CC : out  STD_LOGIC;
           CD : out  STD_LOGIC;
           CE : out  STD_LOGIC;
           CF : out  STD_LOGIC;
           CG : out  STD_LOGIC;
           DP : out  STD_LOGIC;
           AN0 : out  STD_LOGIC;
           AN1 : out  STD_LOGIC;
           AN2 : out  STD_LOGIC;
           AN3 : out  STD_LOGIC;
           p:in std_logic_vector( 2 downto 0);
			  s: out std_logic_vector(7 downto 0)
			);
			
end decodd;

architecture Behavioral of decodd is

		component dcd38 is
			port(
			p : in std_logic_vector(2 downto 0); 
			e :in std_logic;
			s: out std_logic_vector(7 downto 0)
			);
			
		end component dcd38;		
		component decod7seg_4dig is
			 port ( N0 : in  std_logic_vector(3 downto 0);
					  N1 : in  std_logic_vector(3 downto 0);
					  N2 : in  std_logic_vector(3 downto 0);
					  N3 : in  std_logic_vector(3 downto 0);
					  CLK_50MHz : in std_logic;
					  CA : out  STD_LOGIC;
					  CB : out  STD_LOGIC;
					  CC : out  STD_LOGIC;
					  CD : out  STD_LOGIC;
					  CE : out  STD_LOGIC;
					  CF : out  STD_LOGIC;
					  CG : out  STD_LOGIC;
					  DP : out  STD_LOGIC;
					  AN0 : out  STD_LOGIC;
					  AN1 : out  STD_LOGIC;
					  AN2 : out  STD_LOGIC;
					  AN3 : out  STD_LOGIC
					);

		end component;
begin
	decodificador : dcd38 port map (
		e => '0',
		p => p,
		s => s
		);
	display : decod7seg_4dig port map (
		N0 (2 downto 0) => p,
		N0(3) => '0',
		N1 => "0000",
		N2 => "0000",
	   N3 => "0000",
		CLK_50MHz => CLK_50MHz,
		CA => CA,
	   CB => CB,
	   CC => CC,
		CD => CD,
		CE => CE,
		CF => CF,
		CG => CG,
		DP => DP,
		AN0 => AN0,
		AN1 => AN1,
		AN2 => AN2,
		AN3 => AN3
		);

end Behavioral;

