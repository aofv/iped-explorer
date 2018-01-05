server 'aov01.athletesofvalor.com', user: 'puma-worker', roles: %w{app web}

set :ssh_options, {
  keys: %w(~/.ssh/aov-puma-worker),
  forward_agent: false
}
