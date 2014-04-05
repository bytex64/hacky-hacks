use Irssi;
use IO::File;
use strict;
use vars qw($VERSION %IRSSI);

$VERSION = '1.0';
%IRSSI = (
    authors        => 'Chip Black',
    contact        => 'bytex64@bytex64.net',
    name           => 'Lastlog',
    description    => 'Put the last chat line in /tmp/last_message',
    license        => 'Public Domain'
);

sub event_msg {
    my ($server, $data, $nick, $address) = @_;
    $data =~ /^(.*?) :(.*)$/;
    my ($channel, $message) = ($1, $2);
    my $fh = new IO::File;
    $fh->open(">/tmp/last_message");
    if ($channel eq $server->{nick}) {
        print $fh "/msg $nick $message\n";
    } else {
        print $fh "$channel $nick $message\n";
    }
    $fh->close();

    # notify when I'm pinged
    if ($channel eq $server->{nick} ||
        $message =~ /(\bchip|bytex64)/) {
        my $text = "$channel <$nick> $message";
        $text =~ s/"/\\"/g;
        #print CRAP qq/mnotify chip "$text"/;
        #system(qq/mnotify chip "$text"/);
        system("/usr/bin/play $ENV{HOME}/audio/annoyer.wav 2>/dev/null &");
    }
}

Irssi::signal_add("event privmsg", "event_msg");
