----------------------------------------------------------------------------------
-- Engineer: Hyeonsu Lee
-- Create Date: 2022/03/19 17:05:39
-- Project Name: Full_Adder
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  --bit type이 아닌 std_logic type을 사용하기 위함

entity Full_Adder is
port (x, y, cin: in std_logic;
      sum : out std_logic;
      cout: out std_logic);
end Full_Adder;                          -- x,y,cin이 입력, sum, cout이 출력

architecture Behavioral of Full_Adder is
begin
    sum <= cin xor x xor y;                                 
    cout <= (x and y) or (x and cin) or (y and cin);     --truth table을 작성하여 sSum과 cout에 대한 식을 도출
end Behavioral;

