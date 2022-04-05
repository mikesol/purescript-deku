{ name = "purescript-deku"
, dependencies =
  [ "behaviors"
  , "control"
  , "distributive"
  , "effect"
  , "either"
  , "event"
  , "foldable-traversable"
  , "foreign-object"
  , "newtype"
  , "prelude"
  , "profunctor"
  , "random"
  , "record"
  , "safe-coerce"
  , "tuples"
  , "unordered-collections"
  , "variant"
  , "web-dom"
  , "web-events"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
