use strict;
use warnings;
package App::Nopaste::Service::BSD;
# ABSTRACT: Service provider for BSD.to - http://bsd.to/

our $VERSION = '1.014';

use parent 'App::Nopaste::Service';

sub available {
    my $self = shift;
    my %args = @_;
    return !(exists($args{private}) && $args{private});
}

sub uri { "https://bsd.to/" }

my %languages = (
    "Plain Text"=>"_text",
    "Markdown"=>"_markdown",
    "reStructuredText"=>"_rst",
    "Code"=>"_code",
    "AppleScript"=>"applescript",
    "Arduino"=>"arduino",
    "Bash"=>"bash",
    "Batchfile"=>"bat",
    "C"=>"c",
    "Clojure"=>"clojure",
    "CMake"=>"cmake",
    "CoffeeScript"=>"coffee-script",
    "Common Lisp"=>"common-lisp",
    "Console/Bash Session"=>"console",
    "C#"=>"csharp",
    "CSS"=>"css",
    "CUDA"=>"cuda",
    "Dart"=>"dart",
    "Delphi"=>"delphi",
    "Diff"=>"diff",
    "Django/Jinja"=>"django",
    "Docker"=>"docker",
    "Elixir"=>"elixir",
    "Erlang"=>"erlang",
    "Go"=>"go",
    "Handlebars"=>"handlebars",
    "Haskell"=>"haskell",
    "HTML"=>"html",
    "HTML + Django/Jinja"=>"html+django",
    "INI"=>"ini",
    "IPython console session"=>"ipythonconsole",
    "IRC logs"=>"irc",
    "Java"=>"java",
    "JavaScript"=>"js",
    "JSON"=>"json",
    "JSX/React"=>"jsx",
    "Kotlin"=>"kotlin",
    "LessCSS"=>"less",
    "Lua"=>"lua",
    "Makefile"=>"make",
    "Matlab"=>"matlab",
    "Nginx_configuration_file"=>"nginx",
    "NumPy"=>"numpy",
    "Objective-C"=>"objective-c",
    "Perl"=>"perl",
    "PHP"=>"php",
    "PostgreSQL_SQL"=>"postgresql",
    "Python"=>"python",
    "Ruby"=>"rb",
    "reStructuredText"=>"rst",
    "Rust"=>"rust",
    "Sass"=>"sass",
    "SCSS"=>"scss",
    "Solidity"=>"sol",
    "SQL"=>"sql",
    "Swift"=>"swift",
    "TeX"=>"tex",
    "TypoScript"=>"typoscript",
    "VimL"=>"vim",
    "XML"=>"xml",
    "XSLT"=>"xslt",
    "YAML"=>"yaml",
);

sub fill_form {
    my $self = shift;
    my $mech = shift;
    my %args = @_;

    my $lexer_id = $languages{"Plain Text"};
    $lexer_id = $languages{$args{lang}}
    if (exists $args{lang} && (exists $languages{$args{lang}}));

    my $fields = 
    {
	"content"    => $args{text},
	    "lexer"      => $lexer_id,
	    
    };
    
    $fields->{"title"} = $args{title} if (exists $args{title});
    $fields->{"expires"} = $args{expires} if (exists $args{expires});

    my $res = $mech->submit_form(
	fields => $fields,
	);

    $DB::single=1;
    
    if ($res->is_success) {
	return  $res->request->uri_canonical;
    }
    return $res;
}

sub return {
    my $self = shift;
    my $mech = shift;
    my %args = @_;
    return (1, $mech->response->request->uri_canonical);
}


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

App::Nopaste::Service::BSD - Service provider for BSD - http://bsd.to/

=head1 VERSION

version 1.014

=head1 SUPPORT

Bugs may be submitted through L<the RT bug tracker|https://rt.cpan.org/Public/Dist/Display.html?Name=App-Nopaste>
(or L<bug-App-Nopaste@rt.cpan.org|mailto:bug-App-Nopaste@rt.cpan.org>).

=head1 AUTHOR

Ferruccio Zamuner <nonsolosoft@diff.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Shawn M Moore.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
