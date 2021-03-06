package HTTP::Balancer::Command::Add::Host;
use Modern::Perl;
use Moose;
with qw(HTTP::Balancer::Role::Command);

use Path::Tiny;

has name => (
    is      => "rw",
    traits  => [ 'NoGetopt' ],
    default => sub { shift->argv(2) },
);

has fullname => (
    is              => "rw",
    isa             => "Str",
    metaclass       => "Getopt",
    cmd_aliases     => "f",
    default         => "",
    documentation   => "full virtual host name used to filter requests. default: empty string. make sure only one host has empty fullname.",
);

has address => (
    is              => "rw",
    isa             => "Str",
    metaclass       => "Getopt",
    cmd_aliases     => "a",
    default         => "0.0.0.0",
    documentation   => "the address this virtual host listens to. default: 0.0.0.0",
);

has port => (
    is              => "rw",
    isa             => "Str",
    metaclass       => "Getopt",
    cmd_aliases     => "p",
    default         => "80",
    documentation   => "the TCP port this host listens to. default: 80",
);

has forward => (
    is              => "rw",
    isa             => "Str",
    default         => "http",
    documentation   => "the protocol used to communicate with backends, http or https. default: http",
);

has ssl => (
    is              => "rw",
    isa             => "HashRef[Str]",
    default         => sub { {} },
    documentation   => "the SSL certificate file pair of the load balancer. given as --ssl key=ssl.key --ssl crt=ssl.crt. default: empty hash"
);

sub ordinary_args {
    qw(name);
}

before prepare => sub {
    my $self = shift;
    $self->validate_ssl;
};

sub run {
    my ($self, ) = @_;

    my @columns = grep {!/^id$/} $self->model("Host")->columns;

    my %params; @params{@columns} = @$self{@columns};

    $self
    ->model("Host")
    ->new(%params)
    ->save;
}

sub validate_ssl {
    my $self = shift;

    if (scalar (my @keys = keys(%{$self->ssl})) ) {
        $self->usage->die({
            pre_text => "ssl option must be --ssl key=ssl.key --ssl crt=ssl.crt\n\n"
        }) unless (scalar(grep {/(key|crt)/} @keys) == 2);

        for (qw(key crt)) {
            $self->ssl->{$_} = path($self->ssl->{$_})->absolute->stringify;
        }
    }

}

1;
