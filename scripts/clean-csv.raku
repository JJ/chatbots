#!/usr/bin/env raku

use Text::CSV;

my @data = csv(in => "data/estudiantes-edubots.csv",
               headers => "auto"); # as array of hashes


my @clean-data;
my %keys;
for @data -> %d {
    if %d<Género> && %d<Edad> {
        my %this-data;
        %this-data{"Titulación en curso","Género","Edad"} = %d{"Titulación en curso","Género","Edad"} ;
        my @sistemas-mensajería = %d{"Sobre el uso de los sistemas de mensajería en clase, prefiero"}.split(/","? \s* "Un grupo"/);
        for @sistemas-mensajería[1..*] -> $sistema {
            my $this-sistema = $sistema.trim;
            $this-sistema = "con los más allegados" if $this-sistema eq "con más allegados";
            %keys{$this-sistema} = True;
            %this-data{$this-sistema.trim} = True;
        }
        @clean-data.push: %this-data;
    }
}

for @clean-data <-> %d {
    for %keys.keys -> $k {
        %d{$k} = False if !%d{$k};
    }
}

csv(in => @clean-data, out => "data/estudiantes-edubots-interaccion.csv", sep => ";");
