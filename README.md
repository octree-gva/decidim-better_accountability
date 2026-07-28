<h1 align="center"><img src="https://github.com/octree-gva/meta/blob/main/decidim/static/header.png?raw=true" alt="Decidim - Octree Participatory democracy on a robust and open source solution" /></h1>

<h4 align="center">
    <a href="https://git.octree.ch/decidim/vocacity/decidim-modules/decidim-module-better-accountability/-/issues">Issues</a>  <br/><br />
    <a href="https://crowdin.com/project/decidim-better-accountability"><img src="https://badges.crowdin.net/decidim-better-accountability/localized.svg" /></a>  <br/><br /><br />
    <a href="https://www.octree.ch">Octree</a> |
    <a href="https://octree.ch/en/contact-us/">Contact Us</a> |
    <a href="https://blog.octree.ch">Our Blog (FR)</a><br/><br/>
    <a href="https://decidim.org">Decidim</a> |
    <a href="https://docs.decidim.org/en/">Decidim Docs</a> |
    <a href="https://meta.decidim.org">Participatory Governance (meta decidim)</a><br/><br/>
    <a href="https://matrix.to/#/+decidim:matrix.org">Decidim Community (Matrix+Element.io)</a>
</h4>

# Decidim _Better_ Accountability
This module is an experiment from Octree to improve the `decidim-accountability` module. 

## Features

**Add localization to Accountability's projects**<br />
Every project can now be localized. They are compatible with [`decidim-geo`](https://git.octree.ch/decidim/decidim-module-geo/-/) module to them on a map!

---

**Display Acountability's Project by Grid**<br />
By default, participants will see on the accountability page a grid with all the projects. Participant can switch from grid to previous percentage view with a button.

## Install the module
Add the `deface` gem to your Gemfile, since the module depends on it. And also the `better accountability` gem.
```ruby
gem 'deface', '~> 1.9'
gem 'decidim-decidim_better_accountability', git: "https://git.octree.ch/decidim/vocacity/decidim-modules/decidim-module-better-accountability.git"
```

Follow the production setup instructions for [Deface](https://github.com/spree/deface?tab=readme-ov-file#production--precompiling), then run `bundle install`.

```ruby
bundle config set frozen false # in case of production
bundle install
bundle config set frozen true
```

Next, run the Deface precompile task, and then recompile your assets.
```ruby
rails deface:precompile
rails assets:precompile
```

# Run locally
To run this module locally, we use Docker Compose (`octree/decidim-dev:0.32`):

```bash
docker compose up -d
```
This will run a decidim-better-acccountability container, which **sleeps and does nothing**.

After your containers are mounted, you can install the gems: 
```bash
  docker compose exec -it decidim-better-acccountability bundle
```

Then, you should run the migration on the database: 
```bash
  docker compose exec -it decidim-better-acccountability bin/rails db:migrate
```

Then, you can seed the database: 
```bash
  docker compose exec -it decidim-better-acccountability bin/rails db:seed
```

Then, you can start the server
```bash
  docker compose exec -it decidim-better-acccountability bin/rails s -b 0.0.0.0
```

You can then open a bash session.
```bash
  docker compose exec -it decidim-better-acccountability bash
```

Once something change, reset your server: 
```bash
  docker compose exec -it decidim-better-acccountability bin/rails restart
```

The destack app is `/home/decidim` (image `ROOT=/home/decidim`). This gem is mounted at `/home/module`. Compose sets `DEV_MODULE=decidim-decidim_better_accountability`, `DISABLED_DOCKER_COMPOSE=true`, and `DATABASE_HOST=better-accountability-pg`.

# Run CI locally
GitLab `ruby::rspec` locally (ruby 3.4.7, Postgres 17, Redis, Node 22, libvips42, `rake test_app`, then `rspec spec`). Not for interactive development.

```bash
docker compose -f docker-compose.ci.yml run --rm rspec
```

## Contributions

New ideas are welcome on our [feedback page](https://feedback.voca.city/?tags=decidim-better-accountability). We manage there co-financing and release planning.
For technical aspects (contributions, code, issues), take a look at our [gitlab](https://git.octree.ch/decidim/vocacity/decidim-modules/decidim-module-better-accountability/-/issues).

## License

This engine is distributed under the [GNU AFFERO GENERAL PUBLIC LICENSE](LICENSE-AGPLv3.txt)


<br /><br />

<h3 align="center">With the support of</h3>
<p align="center">
        <img
            src="https://github.com/octree-gva/meta/blob/main/decidim/static/participer_lausanne/chip.png?raw=true"
            alt="Lausanne Participe — Une plateforme de participation pour imaginer et réaliser ensemble" />
</p>
