package Class::DBI::Plugin::AsFdat;
use strict;
use warnings;
our $VERSION = '0.03';
use Exporter 'import';
use Scalar::Util qw/blessed/;

our @EXPORT = qw(as_fdat);

sub as_fdat {
    my $self = shift;

    my $fdat;
    for my $column ($self->columns) {
        $fdat->{$column} = $self->get($column);

        # inflate the datetime
        if (blessed $fdat->{$column} and $fdat->{$column}->isa('DateTime')) {
            for my $type (qw(year month day hour minute second)) {
                $fdat->{"${column}_$type"}  = $fdat->{$column}->$type;
            }
        }
    }
    return $fdat;
}

1;
__END__

=head1 NAME

Class::DBI::Plugin::AsFdat - cdbi meets fillinform

=head1 SYNOPSIS

    package Music::CD;
    use base qw/Class::DBI/;
    use Class::DBI::Plugin::AsFdat;

    package main;
    use HTML::FillInForm;
    my $cd = Music::CD->retrieve_all->first;
    my $fif = HTML::FillInForm->new;
    $fif->fill(scalarref => \$html, fdat => $cd->as_fdat);

=head1 DESCRIPTION

Class::DBI::Plugin::AsFdat is easy to convert CDBI object to fdat.
`fdat' is data for HTML::FillInForm.

=head1 METHODS

=over 4

=item as_fdat

transform cdbi row instance to hashref.

=back

=head1 AUTHOR

MATSUNO Tokuhiro E<lt>tokuhiro at mobilefactory.jpE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 THANKS TO

KIMURA, Takefumi

=head1 SEE ALSO

L<HTML::FillInForm>

=cut
