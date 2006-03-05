use ExtUtils::MakeMaker;
WriteMakefile(
    'NAME'         => 'Class::DBI::Plugin::AsFdat',
    'VERSION_FROM' => 'lib/Class/DBI/Plugin/AsFdat.pm', # finds $VERSION
    'PREREQ_PM'    => {
        Test::More       => 0.32,
        Class::DBI       => '3.0.11',
        DateTime         => 0.2901,
    },
);
