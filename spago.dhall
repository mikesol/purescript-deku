{ name = "purescript-deku"
, dependencies =
  [ "control"
  , "effect"
  , "event"
  , "exceptions"
  , "fast-vect"
  , "filterable"
  , "foldable-traversable"
  , "foreign-object"
  , "maybe"
  , "newtype"
  , "prelude"
  , "profunctor"
  , "random"
  , "record"
  , "safe-coerce"
  , "tuples"
  , "st"
  , "type-equality"
  , "unsafe-coerce"
  , "web-dom"
  , "web-events"
  , "web-html"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
