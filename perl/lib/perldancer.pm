package perldancer;
use Dancer ':syntax';

# changing default settings
set port         => 8080;
our $VERSION = '0.1';

hook 'before' => sub {
    #...
};

get '/' => sub {
    template 'index';
};

get '/hello' => sub {
    "Hello There!! Nice Get!!";
};

get '/hello/:name' => sub {
    return "Why, hello there " . params->{name};
};

get '/redirect' => sub {
    redirect '/';
};

get '/click' => sub {
    template 'jquery/click';
};

any '/any' => sub {
    return "The following will match any HTTP request";
};

any ['get', 'post'] => '/anygetpost' => sub {
    return "Any GET or POST http request";
};

get '/param/names/:person_name' => sub {
    my $company_id = params->{person_name};
    # Look up the company and return appropriate page
};

any qr{.*} => sub {
    status 'not_found';
    template 'special_404', { path => request->path };
};




true;
