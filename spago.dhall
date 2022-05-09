{ name = "purescript-deku"
, dependencies =
  [ "control"
  , "effect"
  , "event"
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
  , "sized-vectors"
  , "st"
  , "tuples"
  , "type-equality"
  , "unsafe-coerce"
  , "web-dom"
  , "web-events"
  , "web-html"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
