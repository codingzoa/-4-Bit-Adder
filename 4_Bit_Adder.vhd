----------------------------------------------------------------------------------
-- Engineer: Hyeonsu Lee
-- Create Date: 2022/03/19 17:08:37
-- Project Name: 4 bit adder with full adder
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;    -- bit type 외에 std_logic type 사용하기 위함

entity Adder_4bit is            --std_logic type으로 4bit adder 입출력 선언, x,y,cin을 입력으로 sum,cout을 출력으로 선언
port (x, y : in std_logic_vector(3 downto 0); --4 bit이기 때문에 vector
      cin: in std_logic; 
      sum : out std_logic_vector(3 downto 0); --4 bit이기 때문에 vector
      cout: out std_logic);
end Adder_4bit;

architecture Behavioral of Adder_4bit is
component Full_Adder             --앞서 설계한 full adder를 component로 불러와서 사용, 모두 1bit이기 때문에 std_logic 사용
port(x, y, cin: in std_logic;
      sum : out std_logic;
      cout: out std_logic);
      end component;             --full adder의 입출력을 가져왔다고 할 수 있음
     
signal C_internal : std_logic_vector(3 downto 1); --각 full adder에서 다음 full adder로 이동하는 carry 의미 
begin  --port map으로 component, signal을 이용하여 full adder의 block 간 연결
    FA0 : Full_Adder port map (x(0),y(0),cin,sum(0),C_internal(1)); --x(0), y(0), cin을 더했을 때 carry는 C_interal(1), carry 제외한 합은 sum(0)
    FA1 : Full_Adder port map (x(1),y(1),C_internal(1),sum(1),C_internal(2)); --x(1), y(1), C_internal(1)을 더했을 때 carry는 C_interal(2), carry 제외한 합은 sum(1)
    FA2 : Full_Adder port map (x(2),y(2),C_internal(2),sum(2),C_internal(3)); --x(2), y(2), C_internal(2)을 더했을 때 carry는 C_interal(3), carry 제외한 합은 sum(2)
    FA3 : Full_Adder port map (x(3),y(3),C_internal(3),sum(3),cout); --x(3), y(3), C_internal(3)을 더했을 때 carry는 최종적으로 cout이고, carry 제외한 합은 sum(3)

end Behavioral;        --full adder 4개를 연결한 4bit adder를 설계해야 하므로 structural modeling을 이용하여 block과 block을 연결
 
