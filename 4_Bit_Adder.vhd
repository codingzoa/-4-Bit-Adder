----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/19 17:08:37
-- Design Name: 
-- Module Name: Adder_4bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;    -- bit type �ܿ� std_logic type ����ϱ� ����

entity Adder_4bit is            --std_logic type���� 4bit adder ����� ����, x,y,cin�� �Է����� sum,cout�� ������� ����
port (x, y : in std_logic_vector(3 downto 0); --4 bit�̱� ������ vector
      cin: in std_logic; 
      sum : out std_logic_vector(3 downto 0); --4 bit�̱� ������ vector
      cout: out std_logic);
end Adder_4bit;

architecture Behavioral of Adder_4bit is
component Full_Adder             --�ռ� ������ full adder�� component�� �ҷ��ͼ� ���, ��� 1bit�̱� ������ std_logic ���
port(x, y, cin: in std_logic;
      sum : out std_logic;
      cout: out std_logic);
      end component;             --full adder�� ������� �����Դٰ� �� �� ����
     
signal C_internal : std_logic_vector(3 downto 1); --�� full adder���� ���� full adder�� �̵��ϴ� carry �ǹ� 
begin  --port map���� component, signal�� �̿��Ͽ� full adder�� block �� ����
    FA0 : Full_Adder port map (x(0),y(0),cin,sum(0),C_internal(1)); --x(0), y(0), cin�� ������ �� carry�� C_interal(1), carry ������ ���� sum(0)
    FA1 : Full_Adder port map (x(1),y(1),C_internal(1),sum(1),C_internal(2)); --x(1), y(1), C_internal(1)�� ������ �� carry�� C_interal(2), carry ������ ���� sum(1)
    FA2 : Full_Adder port map (x(2),y(2),C_internal(2),sum(2),C_internal(3)); --x(2), y(2), C_internal(2)�� ������ �� carry�� C_interal(3), carry ������ ���� sum(2)
    FA3 : Full_Adder port map (x(3),y(3),C_internal(3),sum(3),cout); --x(3), y(3), C_internal(3)�� ������ �� carry�� ���������� cout�̰�, carry ������ ���� sum(3)

end Behavioral;        --full adder 4���� ������ 4bit adder�� �����ؾ� �ϹǷ� structural modeling�� �̿��Ͽ� block�� block�� ����
 