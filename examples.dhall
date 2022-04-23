let conf = ./spago.dhall

in      conf
    //  { sources = conf.sources # [ "examples/**/*.purs" ]
        , dependencies =
              conf.dependencies
            # [ "web-html"
              , "filterable"
              , "affjax"
              , "either"
              , "integers"
              , "aff"
              , "argonaut-core"
              , "web-uievents"
              , "http-methods"
              , "maybe"
              , "typelevel"
              ]
        }
