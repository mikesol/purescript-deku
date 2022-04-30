let conf = ../spago.dhall
in conf //
  { dependencies =
      conf.dependencies #
        [ "avar"
        ]
  , sources =
      conf.sources #
        [ "test/**/*.purs"
        ]
  }
