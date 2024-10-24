
entity twobitcounter is
	generic(prop_delay: Time := 10 ns);
	port(increment: in bit;
		count: out bit_vector(1 downto 0)
	);
end entity twobitcounter;

architecture behaviour1 of twobitcounter is
begin
	process (increment) is 
	variable internal_state: bit_vector(1 downto 0) := "00";
	begin
		if (increment'event and increment = '0') then
			if internal_state = "00" then
				internal_state := "01";
			elsif internal_state = "01" then
				internal_state := "10";
			elsif internal_state = "10" then
				internal_state := "11";
			elsif internal_state = "11" then
				internal_state := "00";
			end if;
		end if;
		count <= internal_state after prop_delay;
	end process;
end architecture behaviour1;
