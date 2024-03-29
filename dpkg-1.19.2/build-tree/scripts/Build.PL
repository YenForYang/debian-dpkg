#!/usr/bin/perl

use strict;
use warnings;

eval {
    require Module::Build;
} or do {
    die "error: Missing Module::Build module, cannot proceed.\n";
};

if (-e 'Build.PL.in') {
    die "error: This is an in-tree build, not a proper perl distribution.\n" .
        "To create one please configure normally and then run 'make dist'.\n";
}

my $class = Module::Build->subclass(
    class => 'Module::Build::Dpkg',
    code => q{
        BEGIN {
            $ENV{DPKG_TEST_MODE} = 'cpan';
            $ENV{DPKG_DATADIR} = 'data';
            $ENV{DPKG_ORIGINS_DIR} = 't/origins';
        }

        sub subst {
            my ($self, $file) = @_;
            my $path = $self->install_path();
            my $version = $self->dist_version();

            unlink "blib/$file"
                or die "error: cannot remove blib/$file: $!\n";
            open my $fhin, '<', $file
                or die "error: cannot open $file: $!\n";
            open my $fhout, '>', "blib/$file"
                or die "error: cannot create blib/$file: $!\n";
            while (<$fhin>) {
                s{our \$PROGVERSION = .*;}{our \$PROGVERSION = '$version';};
                s{our \$CONFDIR = .*;}{our \$CONFDIR = '$path->{conf}';};
                s{our \$DATADIR = .*;}{our \$DATADIR = '$path->{data}';};
                s{our \$ADMINDIR = .*;}{our \$ADMINDIR = '$path->{admin}';};
                s{our \$LIBDIR = .*;}{our \$LIBDIR = '$path->{libexec}';};
                print { $fhout } $_;
            }
            close $fhout or die "error: cannot write blib/$file: $!\n";
            close $fhin;
        }

        sub ACTION_build {
            my $self = shift;

            $self->SUPER::ACTION_build;
            $self->subst('lib/Dpkg.pm');
        }
    },
);

my $build = $class->new(
    dist_name       => 'Dpkg',
    dist_abstract   => 'Debian Package Manager Perl modules',
    dist_version    => '1.19.2',
    dist_author     => 'Dpkg Developers <debian-dpkg@lists.debian.org>',
    license         => 'GPL_2',

    release_status  => 1 ? 'stable' : 'testing',

    # Set only to avoid warnings.
    module_name     => 'Dpkg',

    meta_merge => {
        'meta-spec' => {
            version => 2,
        },
        prereqs => {
            test => {
                recommends => {
                    'Test::Pod'             => 0,
                    'Test::Strict'          => 0,
                },
            },
            develop => {
                recommends => {
                    'Test::MinimumVersion'  => 0,
                    'Test::Perl::Critic'    => 0,
                    'Test::Pod::Coverage'   => 0,
                    'Test::Spelling'        => 0,
                    'Test::Synopsis'        => 0,
                },
            },
        },
        resources => {
            homepage => 'https://wiki.debian.org/Teams/Dpkg',
            repository => {
                type => 'git',
                url => 'https://git.dpkg.org/git/dpkg/dpkg.git',
                web => 'https://git.dpkg.org/cgit/dpkg/dpkg.git',
            },
            bugtracker => {
                web => 'https://bugs.debian.org/src:dpkg',
            },
        },
        keywords => [ qw(dpkg debian perl) ],
    },

    sign            => 1,
    dynamic_config  => 0,

    configure_requires => {
        'Module::Build'         => '0.4004',
    },
    test_requires => {
        'TAP::Harness'          => 0,
        'Test::More'            => 0,
    },
    recommends => {
        'Algorithm::Merge'      => 0,
        'File::FcntlLock'       => 0,
        'Locale::gettext'       => 0,

    },
    requires => {
        'perl'                  => '5.20.2',
    },

    data_files => {
        map { $_ => $_ } glob 'data/*'
    },
    install_path => {
        conf => '/etc/dpkg',
        data => '/usr/share/dpkg',
        admin => '/var/lib/dpkg',
        libexec => '/usr/lib/dpkg',
    },
);

$build->add_build_element('data');
$build->create_build_script();

1;
