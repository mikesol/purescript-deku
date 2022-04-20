{ name = "purescript-deku"
, dependencies =
  [ "behaviors"
  , "canvas"
  , "control"
  , "distributive"
  , "effect"
  , "event"
  , "exists"
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
  , "unsafe-coerce"
  , "variant"
  , "web-dom"
  , "web-events"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
