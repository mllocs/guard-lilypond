# Guard::Lilypond

Lilypond guard allows you to automatically compile your new/updated lilypond files.

## Installation

Install the gem:

```
$ gem 'guard-lilypond'
```

## Usage

Generate your Guardfile:

```
$ guard init lilypond
```

Start guard:

```
$ guard
```

## Guardfile

```ruby
guard 'lilypond' do
  watch(%r{^.+*\.ly$})
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
