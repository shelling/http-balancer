package HTTP::Balancer::Command::Init;

use Modern::Perl;

use Moose;

with qw( HTTP::Balancer::Role::Command );

use Path::Tiny;

sub run {
    my ($self, ) = @_;

    require HTTP::Balancer::Model;
    my $dbpath = path($HTTP::Balancer::Model::dbpath);
    if ($dbpath->exists) {
        say $dbpath->stringify . "has existed.";
    } else {
        say "create " . $dbpath->stringify;
        $dbpath->mkpath({user => "root"}) unless $dbpath->exists;
    }
}

1;
__END__

=head1 NAME

HTTP::Balancer::Command::Init - prepare the environment for HTTP::Balancer

=head1 SYNOPSIS

    # http-balancer init

=cut
