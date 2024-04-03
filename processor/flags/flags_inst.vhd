	component flags is
		port (
			source : out std_logic_vector(18 downto 0);                    -- source
			probe  : in  std_logic_vector(18 downto 0) := (others => 'X')  -- probe
		);
	end component flags;

	u0 : component flags
		port map (
			source => CONNECTED_TO_source, -- sources.source
			probe  => CONNECTED_TO_probe   --  probes.probe
		);

